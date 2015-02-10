//
//  OpenIn.m
//  OpenIn
//
//  Created by Matias Sanguinetti on 2/7/15.
//
//

#import "OpenIn.h"

@implementation OpenIn

@synthesize callbackId;

- (void)emitEvent:(NSString *)url;
{
	self.openedFileURL = url;
	NSString *js = [NSString stringWithFormat:@"cordova.fireDocumentEvent('openin.fileopened', {data:'%@'});", url];
	[self.commandDelegate evalJs:js scheduledOnRunLoop:NO];
}

- (void)getFileUrl:(CDVInvokedUrlCommand *)command;
{
	self.callbackId = command.callbackId;
	CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:self.openedFileURL];
	[self.commandDelegate sendPluginResult:commandResult callbackId:self.callbackId];
}

@end
