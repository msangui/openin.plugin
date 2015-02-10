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

### Note
Keep in mind that you will need to modify your project's plist file. You'll need to add the file types you want to support to your [Document Types](https://developer.apple.com/library/prerelease/ios/documentation/FileManagement/Conceptual/DocumentInteraction_TopicsForIOS/Articles/RegisteringtheFileTypesYourAppSupports.html) key
##### Example
```xml
...
<key>CFBundleDocumentTypes</key>
<array>
    <dict>
    ...
    <key>CFBundleTypeName</key>
    <string>Item 0</string>
    <key>LSItemContentTypes</key>
    <array>
        ...
        <string>com.adobe.pdf</string>
        ...
        <string>public.data</string>
        <string>public.content</string>
        ...
    </array>
    ...
    </dict>
</array>
...
```

