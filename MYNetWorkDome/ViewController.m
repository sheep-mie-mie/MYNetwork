//
//  ViewController.m
//  MYNetWorkDome
//
//  Created by ifly on 2017/3/29.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "ViewController.h"
#import "MYNetWorkAPI.h"
#import "MYNetworkingManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *getInfo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)getInfo:(id)sender {
    
    [MYNetWorkAPI loadOpenEyesInformationDataWithSuccess:^(MY_OpenEyesVoideModel *result) {
        
    } failure:^(NSError *error) {
        DTLog(@"=====error=====%@=====",error);
    } showView:nil];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
