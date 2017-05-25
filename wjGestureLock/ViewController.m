//
//  ViewController.m
//  wjGestureLock
//
//  Created by gouzi on 2017/5/24.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#define wjSaveKey @"saveKey"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self wjAddNameMarkInPicture];
}

- (void)wjAddNameMarkInPicture {
    UIImage *image = [UIImage imageNamed:@"gagi.jpg"];
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    [image drawAtPoint:CGPointZero];
    NSString *markStr = @"@请输入账号名";
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName : [UIColor redColor],
                           NSFontAttributeName : [UIFont systemFontOfSize:25.f]
                           };
    [markStr drawAtPoint:CGPointMake(image.size.width - markStr.length * 25.0f - 10, image.size.height - 35) withAttributes:dict];
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.imageView.image = newImg;
}





- (IBAction)wjReDrawGestureCodeAction:(UIButton *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:nil forKey:wjSaveKey];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"重置成功" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}

@end
