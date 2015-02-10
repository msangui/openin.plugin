var OpenIn = function() {};

OpenIn.prototype.getFileUrl= function(successCallback, errorCallback) {
  if (errorCallback == null) {
    errorCallback = function () {
    }
  }

  if (typeof errorCallback != "function") {
    console.log("OpenIn.register failure: failure parameter not a function");
    return;
  }

  if (typeof successCallback != "function") {
    console.log("OpenIn.register failure: success callback parameter must be a function");
    return;
  }

  cordova.exec(successCallback, errorCallback, "OpenIn", "getFileUrl", []);
};

if(!window.plugins) {
  window.plugins = {};
}
if (!window.plugins.openIn) {
  window.plugins.openIn = new OpenIn();
}

if (typeof module != 'undefined' && module.exports) {
  module.exports = OpenIn;
}

