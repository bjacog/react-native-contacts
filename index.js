import { NativeModules, NativeEventEmitter, Platform } from 'react-native';

export const ContactsManager = {
	EventEmitter: Platform.OS === 'ios' ? new NativeEventEmitter(NativeModules.ContactsManager) : null,
	startWatching: Platform.OS === 'ios' ? NativeModules.ContactsManager.startWatching: null,
	startWatchingContact: Platform.OS === 'ios' ? NativeModules.ContactsManager.startWatchingContact: null,
	stopWatching: Platform.OS === 'ios' ? NativeModules.ContactsManager.stopWatching: null,
};

export default NativeModules.Contacts;
