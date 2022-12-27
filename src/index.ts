
import { NativeModules } from 'react-native';

const { RNTalkingData } = NativeModules;

export function trackEvent(event_name: string, event_value: number, parameters: Record<string, string | number>) {
    RNTalkingData.trackEvent(event_name, event_value, parameters);
}
