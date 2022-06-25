package com.reactnativernbinancepay;

import androidx.annotation.NonNull;

import com.binance.android.binancepay.api.BinancePay;
import com.binance.android.binancepay.api.BinancePayException;
import com.binance.android.binancepay.api.BinancePayFactory;
import com.binance.android.binancepay.api.BinancePayListener;
import com.binance.android.binancepay.api.BinancePayParam;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.module.annotations.ReactModule;

@ReactModule(name = RNBinancePayModule.NAME)
public class RNBinancePayModule extends ReactContextBaseJavaModule {
    public static final String NAME = "RNBinancePay";

    ReactApplicationContext reactApplicationContext;

    public RNBinancePayModule(ReactApplicationContext reactContext) {
        super(reactContext);
        reactApplicationContext = reactContext;
    }

    @Override
    @NonNull
    public String getName() {
        return NAME;
    }

    @ReactMethod
    public void multiply(int a, int b, Promise promise) {
        promise.resolve(a * b);
    }

    // Make Payment
    @ReactMethod
    public void payCrypto(String merchantId, String prepayId, String timestamp, String noncestr, String certSn, String sign, Promise promise) {
        BinancePay binancePay = new BinancePayFactory.Companion().getBinancePay(reactApplicationContext);
        BinancePayParam binancePayParam = new BinancePayParam(merchantId, prepayId, timestamp, noncestr, certSn, sign);
        try {
        binancePay.pay(binancePayParam, new BinancePayListener() {
            @Override
            public void onSuccess() {
            promise.resolve("success");
            }

            @Override
            public void onCancel() {
            promise.resolve("cancel");
            }

            @Override
            public void onError(BinancePayException e) {
            promise.reject("Make payment failed", e);
            }
        });
        } catch (Exception e) {
        promise.reject("Make payment failed", e);
        }
    }

    // Make Transfer
    @ReactMethod
    public void transferCrypto(String orderId, String type, Promise promise) {
        BinancePay binancePay = new BinancePayFactory.Companion().getBinancePay(reactApplicationContext);
        try {
        binancePay.pay(orderId, type, new BinancePayListener() {
            @Override
            public void onSuccess() {
            promise.resolve("success");
            }

            @Override
            public void onCancel() {
            promise.resolve("cancel");
            }

            @Override
            public void onError(BinancePayException e) {
            promise.reject("Transfer failed", e);
            }
        });
        } catch (Exception e) {
        promise.reject("Transfer failed", e);
        }
    }
}
