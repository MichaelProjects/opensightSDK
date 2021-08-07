#import "CosmicmetricsSdkPlugin.h"
#if __has_include(<cosmicmetrics_sdk/cosmicmetrics_sdk-Swift.h>)
#import <cosmicmetrics_sdk/cosmicmetrics_sdk-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "cosmicmetrics_sdk-Swift.h"
#endif

@implementation CosmicmetricsSdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCosmicmetricsSdkPlugin registerWithRegistrar:registrar];
}
@end
