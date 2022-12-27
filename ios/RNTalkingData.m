
#import "RNTalkingData.h"
#import "TalkingDataSDK.h"

@implementation RNTalkingData

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

+ (void)registerApp:(NSString *)appId channelID:(NSString *)channelID customParam:(NSString *)customParam crashReport:(BOOL)report {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (report) {
            [TalkingDataSDK setExceptionReportEnabled:YES];
            [TalkingDataSDK setSignalReportEnabled:YES];
        }
        [TalkingDataSDK init: appId channelId: channelID custom: customParam];
    });
}

RCT_EXPORT_METHOD(trackEvent:(NSString *)event_name value:(double)event_value parameters:(NSDictionary *)parameters)
{
    if (event_name != nil) {
        [TalkingDataSDK onEvent:event_name value:event_value parameters:parameters];
    }
}

@end
  