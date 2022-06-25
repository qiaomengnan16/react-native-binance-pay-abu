#import <React/RCTBridgeModule.h>
#import <React/RCTUtils.h>

@interface RCT_EXTERN_MODULE(RNBinancePay, NSObject)

RCT_EXTERN_METHOD(multiply:(float)a withB:(float)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(payCrypto:(NSString*)merchantId prepayId:(NSString*)prepayId timestamp:(int64_t)timestamp noncestr:(NSString*)noncestr certSn:(NSString*)certSn sign:(NSString*)sign redirectScheme:(NSString*)redirectScheme
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(transferCrypto:(NSString*)orderId type:(NSString*)type redirectScheme:(NSString*)redirectScheme
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
                  
@end
