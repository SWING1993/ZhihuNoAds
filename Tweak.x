
#import <UIKit/UIKit.h>

@interface ZHFeedsContainerExploreAViewController: UIViewController
- (void)handleAdDisappeared;
- (void)showAlertController;
@end

@interface ZHLaunchAD: NSObject
- (void)finish;
@end


%hook ZHFeedsContainerExploreAViewController
- (void)viewDidLoad {
    %log;
    %orig;
	//[self handleAdDisappeared];
     if (![[NSUserDefaults standardUserDefaults] boolForKey:@"block-ad-alert"]) {
        [self showAlertController];
    }
}


%new
- (void)showAlertController {
    NSString *alertTitle = @"知乎去广告插件";
    NSString *alertMessage = @"由SWING开发";
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:alertTitle message:alertMessage preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"不再提醒" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"block-ad-alert"];
    }];
    [alertController addAction:okAction];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

%end


%hook ZHMorphAPIModel

+ (id)modelCustomPropertyMapper  {
    return nil;
}
- (id)fullContent {
    return nil;
}
- (BOOL)contentIsValid {
    return false;
}
- (BOOL)isValid {
    return false;
}

%end

%hook ZHADDataManager

- (void)initializeManager {
}
- (id)dataWithModel:(id)arg1 {
    return nil;
}
- (id)modelWithDada:(id)arg1 {
    return nil;
}
%end

%hook ZHLaunchingAdDataManager

+ (id)sharedManager {
    return nil;
}

%end
