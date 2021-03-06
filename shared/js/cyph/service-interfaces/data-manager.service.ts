import {IProto} from '../iproto';
import {LockFunction} from '../lock-function-type';
import {BinaryProto} from '../proto';
import {getOrSetDefault} from '../util/get-or-set-default';
import {lockFunction} from '../util/lock';


/**
 * Base class for any service that manages data.
 */
export class DataManagerService {
	/** @ignore */
	private readonly getOrSetDefaultLocks: Map<string, LockFunction>	=
		new Map<string, LockFunction>()
	;

	/** Gets an item's value. */
	public async getItem<T> (_URL: string, _PROTO: IProto<T>) : Promise<T> {
		throw new Error('Must provide an implementation of getItem.');
	}

	/** Gets a value and sets a default value if none had previously been set. */
	public async getOrSetDefault<T> (
		url: string,
		proto: IProto<T>,
		defaultValue: () => T|Promise<T>
	) : Promise<T> {
		return getOrSetDefault(
			this.getOrSetDefaultLocks,
			url,
			lockFunction
		)(async () => {
			try {
				return await this.getItem(url, proto);
			}
			catch (_) {
				const value	= await defaultValue();
				this.setItem(url, proto, value).catch(() => {});
				return value;
			}
		});
	}

	/** Checks whether an item exists. */
	public async hasItem (url: string) : Promise<boolean> {
		try {
			await this.getItem(url, BinaryProto);
			return true;
		}
		catch (_) {
			return false;
		}
	}

	/** Deletes an item. */
	public async removeItem (_URL: string) : Promise<void> {
		throw new Error('Must provide an implementation of removeItem.');
	}

	/**
	 * Sets an item's value.
	 * @returns Item url.
	 */
	public async setItem<T> (_URL: string, _PROTO: IProto<T>, _VALUE: T) : Promise<{url: string}> {
		throw new Error('Must provide an implementation of setItem.');
	}

	constructor () {}
}
