import {NativeModules, Platform} from 'react-native';

type RNBinancePayType = {

  multiply(a: number, b: number): Promise<number>;

  payCrypto(
    merchantId: string,
    prepayId: string,
    timestamp: number,
    noncestr: string,
    certSn: string,
    sign: string,
    redirectScheme?: string
  ): Promise<string>;

  transferCrypto(
    orderId: string,
    type: string,
    redirectScheme?: string
  ): Promise<string>;
};

const { RNBinancePay } = NativeModules;


const BinancePay = {
  payCrypto(merchantId: string,
            prepayId: string,
            timestamp: number,
            noncestr: string,
            certSn: string,
            sign: string,
            redirectScheme?: string) {
    if (Platform.OS === 'android') {
      return RNBinancePay.payCrypto(merchantId, prepayId, timestamp + '', noncestr, certSn, sign)
    } else {
      return RNBinancePay.payCrypto(merchantId, prepayId, timestamp, noncestr, certSn, sign, redirectScheme)
    }
  },
  transferCrypto(orderId: string,
                 type: string,
                 redirectScheme?: string) {
    if (Platform.OS === 'android') {
      return RNBinancePay.transferCrypto(orderId, type)
    } else {
      return RNBinancePay.transferCrypto(orderId, type, redirectScheme)
    }
  }
}


export default BinancePay as RNBinancePayType;
