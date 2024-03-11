
#import <UIKit/UIKit.h>

@interface ZHFeedsContainerExploreAViewController : UIViewController {

}
- (void)handleAdDisappeared;

@end

@interface ZHLaunchAD : NSObject

- (void)finish;

@end

%hook ZHFeedsContainerExploreAViewController
- (void)viewDidLoad {
    %log;
    %orig;

	[self handleAdDisappeared];

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"测试微博去广告插件" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:okAction];
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
