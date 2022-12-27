
package com.sonorus.talkingdata;
import android.content.Context;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.tendcloud.tenddata.TalkingDataSDK;
import java.util.Map;

public class RNTalkingDataModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNTalkingDataModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNTalkingData";
  }

  private static Boolean registered = false;

  public static void register(Context context, String appID, String channelID, String tdCustom, boolean reportExceptions) {
      if (!registered) {
          // tdCustom 仅 AdTracking
          TalkingDataSDK.init(context, appID, channelID, tdCustom);
          if (reportExceptions) {
              TalkingDataSDK.setReportUncaughtExceptions(true);
          }
          registered = true;
      }
  }

  @Override
  public void onCatalystInstanceDestroy() {
      super.onCatalystInstanceDestroy();
  }

  @ReactMethod
  public void trackEvent(String eventName, double eventValue, Map parameters) {
    if (eventName != null) {
        TalkingDataSDK.onEvent(getReactApplicationContext(), eventName, eventValue, parameters);
    }
  }
}