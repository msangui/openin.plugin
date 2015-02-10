# OpenIn Cordova Plugin

OpenIn Plugin lets you get the local URL of a file opened with your app through "Open in..." (iOS).

The plugin exposes two way of getting this URL, through a document event and through a API callback.

### Examples
##### Event
 <br/> 
```javascript
document.addEventListener('openIn.fileOpened', function (event) {
    var fileUrl = event.fileUrl;
    //
}, false);
```
 <br/> 
##### API Callback
 <br/> 
```javascript
window.plugins.openIn.getFileUrl(function (fileUrl) {
    // 
});
```

### Installation
```sh
$ cordova plugin add https://github.com/msangui/openin.plugin
```

