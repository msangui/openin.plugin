//
//  OpenIn.h
//  OpenIn
//
//  Created by Matias Sanguinetti on 2/7/15.
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>

@interface OpenIn : CDVPlugin
{
	NSString *openedFileURL;
}

@property (nonatomic, copy) NSString *openedFileURL;

	- (void)emitEvent:(NSString *)url;
	- (void)getFileUrl:(CDVInvokedUrlCommand *)command;

@end
