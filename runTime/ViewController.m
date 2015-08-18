
//  ViewController.m
//  runTime
//
//  Created by 徐继垚 on 15/8/18.
//  Copyright (c) 2015年 徐继垚. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "CA.h"
@interface ViewController ()

@end

@implementation ViewController


void sayHello(id self, SEL _cmd)
{
    printf("hello xujiyao\n");
}

- (void)addMethod
{
    class_addMethod([CA class], @selector(sayHello2), (IMP)sayHello, "v@:");
    // Test Method
    CA *instance = [[CA alloc] init];
    
    [instance performSelector:@selector(sayHello2)];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addMethod];
    
//    CA * a = [CA new];
//    
//    [a performSelector:@selector(f)];
//    
//    NSString * str = [a performSelector:@selector(lowercaseString)];
//    
//    NSLog(@"%@" , str);
//    
//    
//    
//    
    u_int count;
    objc_property_t * properties= class_copyPropertyList([UIView class], &count);
    for (int i = 0; i < count ; i++)
    {
        const char* propertyName = property_getName(properties[i]);
        NSString *strName = [NSString  stringWithCString:propertyName encoding:NSUTF8StringEncoding];
        NSLog(@"%@",strName);
    }
    
    u_int count2;
    Method * methods= class_copyMethodList([UIView class], &count2);
    for (int i = 0; i < count ; i++)
    {
        SEL name = method_getName(methods[i]);
        NSString *strName = [NSString  stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
        NSLog(@"%@",strName);
    }
    // Do any additional setup after loading the view, typically from a nib.
    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
