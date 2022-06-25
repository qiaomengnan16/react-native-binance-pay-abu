# change bug

RNBinancePay.swift No Such Module BinancePaySDK

react-native-binance-pay-abu.podspec add `s.vendored_frameworks = 'ios/Frameworks/BinancePaySDK.xcframework'` fix bug


# react-native-binance-pay-abu

React Native Package for Binance Pay from Binance SDKs

## Installation

```sh
npm install react-native-binance-pay-abu
```

### Add dependencies

#### Android dependencies

1. Append the following lines to `android/settings.gradle`:
   ```
    include ':react-native-binance-pay-abu'
    project(':react-native-binance-pay-abu').projectDir = new File(rootProject.projectDir, '../node_modules/react-native-binance-pay-abu/android')
   ```
2. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
   ```
    implementation project(':react-native-binance-pay-abu')
   ```

#### iOS dependencies

1. Create Frameworks folder in iOS project root folder and copy & paste the BinancePaySDK.xcframework
2. Add BinancePaySDK.xcframework to Frameworks, Libraries, and Embedded Content


## Usage

- redirectScheme is the deeplink of you APP, you need this scheme to jump back from Binance APP
- redirectScheme is required for iOS only

```js
import BinancePay from "react-native-binance-pay-abu";

// ...

BinancePay.payCrypto(merchantId, prepayId, timeStamp, nonceStr, certSn, sign, redirectScheme)
.then((result) => {
   console.log(result);
});

BinancePay.transferCrypto(orderId, type, redirectScheme)
.then((result) => {
   console.log(result);
});

```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
