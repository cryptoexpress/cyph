import {Injectable} from '@angular/core';
import {env} from '../env';
import {AccountService} from './account.service';
import {EnvService} from './env.service';
import {LocalStorageService} from './local-storage.service';


/**
 * Replaces a subset of the env service for the accounts UI in certain cases.
 */
@Injectable()
export class AccountEnvService extends EnvService {
	/** @inheritDoc */
	public get isMobile () : boolean {
		return (this.accountService && this.accountService.isExtension) || env.isMobile;
	}

	/** @ignore */
	public set isMobile (_: boolean) {}

	constructor (
		localStorageService: LocalStorageService,

		/** @ignore */
		private readonly accountService: AccountService
	) {
		super(localStorageService);
	}
}
