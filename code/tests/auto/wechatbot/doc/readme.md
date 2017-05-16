# 微信机器人

[Urinx/WeixinBot](https://github.com/Urinx/WeixinBot)

[liuwons/wxBot](https://github.com/liuwons/wxBot)

## 流程

```
       +--------------+     +---------------+   +---------------+
       |              |     |               |   |               |
       |   Get UUID   |     |  Get Contact  |   | Status Notify |
       |              |     |               |   |               |
       +-------+------+     +-------^-------+   +-------^-------+
               |                    |                   |
               |                    +-------+  +--------+
               |                            |  |
       +-------v------+               +-----+--+------+      +--------------+
       |              |               |               |      |              |
       |  Get QRCode  |               |  Weixin Init  +------>  Sync Check  <----+
       |              |               |               |      |              |    |
       +-------+------+               +-------^-------+      +-------+------+    |
               |                              |                      |           |
               |                              |                      +-----------+
               |                              |                      |
       +-------v------+               +-------+--------+     +-------v-------+
       |              | Confirm Login |                |     |               |
+------>    Login     +---------------> New Login Page |     |  Weixin Sync  |
|      |              |               |                |     |               |
|      +------+-------+               +----------------+     +---------------+
|             |
|QRCode Scaned|
+-------------+
```

## api

## 获取 uuid

获取 uuid

```
GET https://login.weixin.qq.com/jslogin?_=1487427049516&appid=wx782c26e4c19acffb&fun=new&lang=zh_CN
```

返回

```
window.QRLogin.code = 200; window.QRLogin.uuid = "oa2KCesO1A==";
```

或者

```
window.QRLogin.code = 400; window.QRLogin.error = "";
```

获取参数 `uuid`

## 获取二维码

```
GET https://login.weixin.qq.com/qrcode/"+uuid
```

## 轮询二维码扫描状态

```
window.code=xxx;

xxx:
    408 登陆超时
    201 扫描成功
    200 确认登录

当返回200时，还会有
window.redirect_uri="https://wx.qq.com/cgi-bin/mmwebwx-bin/webwxnewloginpage?ticket=xxx&uuid=xxx&lang=xxx&scan=xxx";
```

获取 `redirect_uri`

## 访问 redirect_uri

访问 `redirect_uri`，将内容保持下来，内容是由一段非标准的 `xml` + `html` 组成，`xml` 中保存着 `skey`，`wxsid`，`wxuin`，`pass_ticket` 以及 `isgrayscale`

···
<error>
    <ret>0</ret>
    <message>OK</message>
    <skey>xxx</skey>
    <wxsid>xxx</wxsid>
    <wxuin>xxx</wxuin>
    <pass_ticket>xxx</pass_ticket>
    <isgrayscale>1</isgrayscale>
</error>
···
