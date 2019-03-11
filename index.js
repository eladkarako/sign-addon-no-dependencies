"use strict";
/*
sign-addon-helper.cmd  "..jwt issuer..."  "..jwt secret..."  "c:\work\abc.xpi"  "0.5.3.1"  "abc@id.com"
*/
const SIGN_ADDON = require("sign-addon").default
     ,PATH       = require("path")
     ,ARGS       = process.argv
                          .filter(function(s){return false === /node\.exe/i.test(s) && false === /index\.js/i.test(s);})
                          .map(function(s){return s.replace(/\"/gm,"");})
     ,JWT_ISSUER = ARGS[0]
     ,JWT_SECRET = ARGS[1]
     ,FILENAME   = PATH.resolve(  ARGS[2].replace(/\\+/g,"/")  )
                       .replace(/\\+/g,"/")
                       .replace(/\/\/+/g,"/")
     ,VERSION    = ARGS[3]
     ,ID         = ARGS[4]
     ,CONF       = {}
     ;

console.error("\r\n");
console.error(ARGS);
console.error("\r\n");

//-----------------------initializing required arguments.
CONF.apiKey            = JWT_ISSUER;
CONF.apiSecret         = JWT_SECRET;
CONF.xpiPath           = FILENAME;
CONF.version           = VERSION;


//-----------------------initializing optional arguments.
CONF.id                = ID;                                    //an explicit extension ID, a WebExtension does require an ID. See the notes below about dealing with IDs.
CONF.channel           = "unlisted";                            //[undefined|"listed"|"unlisted"]. Ignored for new add-ons, which are always unlisted.
CONF.downloadDir       = undefined;                             //Save downloaded files to this directory. Default: current working directory.
CONF.timeout           = 10*1000*60;       //10 minutes           //Number of milleseconds to wait before aborting the request. Default: 2 minutes.
CONF.apiProxy          = undefined;                             //Optional proxy to use for all API requests, such as "http://yourproxy:6000"   -  Read this for details on how proxy requests work: https://github.com/request/request#proxies
CONF.apiRequestConfig  = undefined;                             //Optional object to pass to request() for additional configuration. Some properties such as 'url' cannot be defined here. Available options: https://github.com/request/request#requestoptions-callback  .
CONF.apiJwtExpiresIn   = undefined;                             //Optional override to the number of seconds until the JWT token for the API request expires. This must match the expiration time that the API server accepts.
CONF.apiUrlPrefix      = 'https://addons.mozilla.org/api/v3';   //Optional override to the URL prefix of the signing API. The production instance of the API will be used by default.


function on_done(result){
  if (result.success){
    console.log("The following signed files were downloaded:");
    console.log(result.downloadedFiles);
    console.log("Your extension ID is:");
    console.log(result.id);
  }
  else{
    console.error("Your add-on could not be signed!");
    console.error("Check the console for details.");
  }
  console.log(result.success ? "SUCCESS" : "FAIL");
}


function on_error(error){
  console.error("Signing error:", error);
}


//-------------------program start.


SIGN_ADDON(CONF)
  .then(on_done)
  .catch(on_error)
;

