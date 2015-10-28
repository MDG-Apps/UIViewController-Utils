#import "UIViewController+Utils.h"

@implementation UIViewController (Utils)

+(UIViewController*) findBestViewController:(UIViewController*)vc {
    
    if (![vc.presentedViewController isKindOfClass:[UIAlertController class]] && vc.presentedViewController) {
        
        // Return presented view controller
        return [UIViewController findBestViewController:vc.presentedViewController];
    } else {
        if (vc.tabBarController != nil) {
            return vc.tabBarController;
        } else if (vc.navigationController != nil) {
            return vc.navigationController;
        } else {
            if ([vc isKindOfClass:[UIViewController class]] || [vc isKindOfClass:[UINavigationController class]] || [vc isKindOfClass:[UITabBarController class]]) {
                return vc;
            } else {
                if ([vc.parentViewController isKindOfClass:[UIViewController class]] || [vc.parentViewController isKindOfClass:[UINavigationController class]] || [vc.parentViewController isKindOfClass:[UITabBarController class]]) {
                    return vc.parentViewController;
                } else {
                    return [[[[UIApplication sharedApplication]delegate] window] rootViewController];
                }
            }
            return vc;
        }
    }
    
}

+(UIViewController*) currentViewController {
    
    // Find best view controller
    UIViewController* viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [UIViewController findBestViewController:viewController];
    
}

@end