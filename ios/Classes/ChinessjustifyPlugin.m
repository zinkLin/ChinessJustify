#import "ChinessjustifyPlugin.h"
#if __has_include(<chinessjustify/chinessjustify-Swift.h>)
#import <chinessjustify/chinessjustify-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "chinessjustify-Swift.h"
#endif

@implementation ChinessjustifyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftChinessjustifyPlugin registerWithRegistrar:registrar];
}
@end
