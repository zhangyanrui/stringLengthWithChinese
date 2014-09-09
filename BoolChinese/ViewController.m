//
//  ViewController.m
//  BoolChinese
//
//  Created by Will on 14-9-9.
//  Copyright (c) 2014年 Will. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *lengthLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChange) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Observer Method
- (void)textFieldTextDidChange
{
    NSString *textStr = self.textField.text;
    NSInteger length = [self lengthOfStringWithChinese:textStr];
    self.lengthLabel.text = [NSString stringWithFormat:@"字符长度:%d",length];
}


#pragma mark - Tools


- (NSInteger)lengthOfStringWithChinese:(NSString *)aStr
{
    NSInteger length = 0;
    for(int i = 0; i < [aStr length]; i++) {
        int a = [aStr characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){//是汉字
            length += 2;
        }else{//普通字符
            length += 1;
        }
    }
    
    return length;
}

@end
