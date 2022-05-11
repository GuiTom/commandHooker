//
//  main.m
//  commandHooker
//
//  Created by chenchao on 2022/5/11.
//

#import <Foundation/Foundation.h>
#include <stdlib.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *selfPath = [[NSString alloc] initWithUTF8String:argv[0]];
        NSString *oldCmd = selfPath.lastPathComponent;
       NSString *newCmdStr = [selfPath.lastPathComponent stringByAppendingString:@"_old"];
        NSLog(@"selfPath:%@",selfPath);
        for (int i=1;i<argc;i++) {

            newCmdStr = [newCmdStr stringByAppendingFormat:@" %@",[[NSString alloc] initWithUTF8String:argv[i]]];
            oldCmd = [oldCmd stringByAppendingFormat:@" %@",[[NSString alloc] initWithUTF8String:argv[i]]];
        }
        
        system([newCmdStr cStringUsingEncoding:NSASCIIStringEncoding]);
    
        NSLog(@"current path:");
        system("pwd");
        NSLog(@"excuted command:%@",oldCmd);
        NSString *logFileName = [selfPath.lastPathComponent stringByAppendingString:@"_cmd.txt"];
        
        
        NSDate *currentDate = [NSDate date];//获取当前时间，日期
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];// 创建一个时间格式化对象
        [dateFormatter setDateFormat:@"YYYY/MM/dd hh:mm:ss SS "];//设定时间格式,这里可以设置成自己需要的格式
        NSString *dateString = [dateFormatter stringFromDate:currentDate];//将时间转化成字符串
        
        oldCmd = [oldCmd stringByAppendingFormat:@" \n%@",dateString];
       
        [oldCmd writeToFile:logFileName atomically:YES encoding:NSUTF8StringEncoding error:nil];


    }
    return 0;
}


