import {
	HttpClient,
	HttpEvent,
	HttpEventType,
	HttpHeaders,
	HttpResponse
} from '@angular/common/http';
import {BehaviorSubject} from 'rxjs/BehaviorSubject';
import {Observable} from 'rxjs/Observable';
import {env} from '../env';
import {stringify, toQueryString} from './serialization';


/** Sets http. */
export let resolveHttpClient: (httpClient: HttpClient) => void;

/** @ignore */
const staticHttpClient: Promise<HttpClient|undefined>	=
	new Promise<HttpClient|undefined>(resolve => {
		if (!env.isMainThread) {
			resolve();
		}

		resolveHttpClient	= resolve;
	})
;

/** Performs HTTP request. */
const baseRequest	= <R, T> (
	o: {
		contentType?: string;
		data?: any;
		discardErrors?: boolean;
		method?: string;
		retries?: number;
		url: string;
	},
	responseType: 'arraybuffer'|'blob'|'json'|'text',
	getResponseData: (res: HttpResponse<T>) => R|Promise<R>
) : {
	progress: Observable<number>;
	result: Promise<R>;
} => {
	const progress	= new BehaviorSubject(0);

	return {
		progress,
		result: (async () => {
			const httpClient	= await staticHttpClient;
			if (!httpClient) {
				throw new Error('HTTP service not found.');
			}

			const method: string			= o.method || 'GET';
			const retries: number			= o.retries === undefined ? 0 : o.retries;
			let contentType: string			= o.contentType || '';
			let data: any					= o.data;
			let url: string					= o.url;

			if (url.slice(-5) === '.json') {
				contentType	= 'application/json';
			}
			else if (responseType === 'text') {
				contentType	= 'application/x-www-form-urlencoded';
			}

			if (data && method === 'GET') {
				url		+= '?' + (
					typeof data === 'object' ?
						toQueryString(data) :
						(<string> data.toString())
				);

				data	= undefined;
			}
			else if (typeof data === 'object') {
				data	= contentType === 'application/json' ?
					stringify(data) :
					toQueryString(data)
				;
			}

			let response: R|undefined;
			let error: Error|undefined;
			let statusOk	= false;

			for (let i = 0 ; !statusOk && i <= retries ; ++i) {
				try {
					progress.next(0);

					const req: Observable<HttpEvent<T>>	=
						httpClient.request(method, url, {
							body: data,
							headers: contentType ?
								new HttpHeaders({'Content-Type': contentType}) :
								undefined
							,
							observe: 'events',
							responseType
						})
					;

					const res	= await new Promise<HttpResponse<T>>((resolve, reject) => {
						let last: HttpResponse<T>;

						req.subscribe(
							e => {
								if (e.type === HttpEventType.DownloadProgress) {
									progress.next(e.loaded / (e.total || e.loaded) * 100);
								}
								else if (e.type === HttpEventType.Response) {
									last	= e;
								}
							},
							reject,
							() => {
								if (last) {
									resolve(last);
								}
								else {
									reject();
								}
							}
						);
					});

					statusOk	= res.ok;
					response	= await getResponseData(res);
				}
				catch (err) {
					error		= err;
					statusOk	= false;
				}
			}

			if (!statusOk || !response) {
				const err	= error || response || new Error('Request failed.');
				progress.error(err);
				throw err;
			}

			progress.next(100);
			progress.complete();
			return response;
		})()
	};
};

/** Performs HTTP request. */
export const request	= async (o: {
	contentType?: string;
	data?: any;
	method?: string;
	retries?: number;
	url: string;
}) : Promise<string> => {
	return (await baseRequest<string, string>(o, 'text', res =>
		(res.body || '').trim()
	)).result;
};

/** Performs HTTP request. */
export const requestByteStream	= (o: {
	contentType?: string;
	data?: any;
	method?: string;
	retries?: number;
	url: string;
}) : {
	progress: Observable<number>;
	result: Promise<Uint8Array>;
} => {
	return baseRequest<Uint8Array, ArrayBuffer>(o, 'arraybuffer', res =>
		res.body ? new Uint8Array(res.body) : new Uint8Array(0)
	);
};

/** Performs HTTP request. */
export const requestBytes	= async (o: {
	contentType?: string;
	data?: any;
	method?: string;
	retries?: number;
	url: string;
}) : Promise<Uint8Array> => {
	return requestByteStream(o).result;
};
