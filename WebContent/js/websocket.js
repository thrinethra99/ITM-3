'use strict';

var path = window.location.host+'/ITM3';
var websocket;
if ('WebSocket' in window) {
	websocket = new WebSocket("WSS://" + path + "/ws?uid=2");
} else if ('MozWebSocket' in window) {
	websocket = new MozWebSocket("WSS://" + path + "/ws1");
} else {
	websocket = new SockJS("https://" + path + "/ws/sockjs1");
}
websocket.onopen = function(event) {
	console.log("WebSocket:connected");
	console.log(event);
};

websocket.onerror = function(event) {
	console.log("WebSocket:Err ");
	console.log(event);
};
websocket.onclose = function(event) {
	console.log("WebSocket:Close");
	console.log(event);
}
