//
//  OpenIn.m
//  OpenIn
//
//  Created by Matias Sanguinetti on 2/7/15.
//
//

#import "OpenIn.h"

@implementation OpenIn

- (void)emitEvent:(NSString *)url;
{
	NSString *js = [NSString stringWithFormat:@"cordova.fireDocumentEvent('openin.fileopened', {data:'%@'});", url];
	[self.commandDelegate evalJs:js scheduledOnRunLoop:NO];
}
@end
