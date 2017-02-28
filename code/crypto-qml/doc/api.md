# api

[brix/crypto-js](https://github.com/brix/crypto-js)

## MD5

```
var encrypted = CryptoJS.CryptoJS.MD5("");
console.log(encrypted);
```

## AES

```

CryptoJS.mode: [CBC, CFB, CTR, OFB, ECB];

CryptoJS.pad: [Pkcs7, Iso97971, AnsiX923, Iso10126, ZeroPadding, NoPadding]

cfg: {
    mode : CryptoJS.mode.CBC,
    padding: CryptoJS.pad.Pkcs7,
    iv: ""
}
```

```
var ciphertext = CryptoJS.AES.encrypt(message, key, cfg);
var plaintext  = CryptoJS.AES.decrypt(ciphertext, key, cfg);
```


