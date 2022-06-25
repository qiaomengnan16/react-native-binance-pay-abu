import BinancePaySDK

@objc(RNBinancePay)
class RNBinancePay: NSObject {

    @objc(multiply:withB:withResolver:withRejecter:)
    func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        resolve(a*b)
    }

    @objc(payCrypto:prepayId:timestamp:noncestr:certSn:sign:redirectScheme:withResolver:withRejecter:)
    func payCrypto(merchantId: String, prepayId: String, timestamp: Int64, noncestr: String, certSn: String, sign: String, redirectScheme: String, resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) -> Void {
        
        let presentedViewController = RCTPresentedViewController();
        let view = presentedViewController?.view

        let parameters = OrderInitParameters(merchantId: merchantId, prepayId: prepayId, timestamp: timestamp, noncestr: noncestr, certSn: certSn, sign: sign, redirectScheme: redirectScheme)

        BinancePay.shared.pay(with: parameters, containerView: view!) { (result) in
           switch result {
           case .success:
                resolve("success")
           case .failure(let error):
                resolve("failure \(error)")
           }
        }
    }
    
    @objc(transferCrypto:type:redirectScheme:withResolver:withRejecter:)
    func transferCrypto(orderId: String, type: String, redirectScheme: String, resolve: @escaping RCTPromiseResolveBlock,reject: @escaping RCTPromiseRejectBlock) -> Void {
        
        let presentedViewController = RCTPresentedViewController();
        let view = presentedViewController?.view
        
        let parameters = C2CInitParameters(id: orderId, type: type, redirectScheme: redirectScheme)
        
        BinancePay.shared.pay(with: parameters, containerView: view!) { (result) in
            switch result {
            case .success:
                resolve("success")
            case .failure(let error):
                resolve("failure \(error)")
            }
        }
    }
}
