//
//  MYNetWorkAPI.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/17.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MYNetWorkAPI.h"
#import "MYNetworkingManager.h"
#import "MJExtension.h"

@implementation MYNetWorkAPI

+(void)loadCreateWithDic:(id)dic withName:(NSString *)name withFileName:(NSString *)fileName{
    NSData * data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString * string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    DTLog(@"%@的json数据结构=============================%@",name,string);
    
    NSString *fileNmae = [NSString stringWithFormat:@"Documents/GDHNetworkingCaches/%@",fileName];
    //创建文本路径
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:fileNmae];
    NSLog(@"path is %@",path);
    BOOL isOk = [data writeToFile:path atomically:YES];
    if (isOk) {
        NSLog(@"json 写入成功");
    }
}



/**1
 获取开眼App数据
 @param success 成功
 @param failure 失败
 */
+ (void)loadOpenEyesInformationDataWithSuccess:(void(^)(MY_OpenEyesVoideModel *result))success
                                       failure:(void(^)(NSError *error))failure
                                      showView:(UIView *)showView {
    //num=10&date=%@&vc=67&u=011f2924aa2cf27aa5dc8066c041fe08116a9a0c&v=1.8.0&f=iphone
    NSDictionary *parameters = @{@"num":@"3",
                                 @"date":@"20170228",
                                 @"vc":@"67",
                                 @"u":@"011f2924aa2cf27aa5dc8066c041fe08116a9a0c",
                                 @"v":@"1.8.0",
                                 @"f":@"iphone"};

   
    [MYNetworkingManager postRequestWithURL:@"api/v1/feed?" parameters:parameters success:^(id returnData) {
        [MYNetWorkAPI loadCreateWithDic:returnData withName:@"block回调函数" withFileName:@"Block"];
        MY_OpenEyesVoideModel *info = [MY_OpenEyesVoideModel mj_objectWithKeyValues:returnData];
        success(info);
    } failure:^(NSError *error) {
        failure(error);
    } progress:nil refreshCache:NO showView:showView];
    
}

























@end
