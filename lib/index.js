import { NativeModules } from 'react-native';
const { RNTalkingData } = NativeModules;
export function trackEvent(event_name, event_value, parameters) {
    RNTalkingData.trackEvent(event_name, event_value, parameters);
}
