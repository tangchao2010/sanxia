
try{
document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
WeixinJSBridge.call('hideOptionMenu');
WeixinJSBridge.call('hideToolbar');
});
}catch(e){};