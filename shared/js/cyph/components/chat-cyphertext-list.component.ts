import {ChangeDetectionStrategy, Component, Input} from '@angular/core';
import {List} from 'immutable';
import {ChatMessage} from '../chat';
import {StringsService} from '../services/strings.service';


/**
 * Angular component for cyphertext message list.
 */
@Component({
	changeDetection: ChangeDetectionStrategy.OnPush,
	selector: 'cyph-chat-cyphertext-list',
	styleUrls: ['../../../css/components/chat-cyphertext-list.scss'],
	templateUrl: '../../../templates/chat-cyphertext-list.html'
})
export class ChatCyphertextListComponent {
	/** Indicates whether this is the accounts UI. */
	@Input() public accounts: boolean	= false;

	/** @see CyphertextService.messages */
	@Input() public messages: List<ChatMessage>;

	constructor (
		/** @see StringsService */
		public readonly stringsService: StringsService
	) {}
}
