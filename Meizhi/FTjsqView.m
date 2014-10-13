//
//  FTjsqView.m
//  LCMGYPro
//
//  Created by MacMini01 on 12-10-11.
//  Copyright (c) 2012年 MacMini01. All rights reserved.
//

#import "FTjsqView.h"
#import "FThdjsq.h"
@implementation FTjsqView
@synthesize table,arr,type;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)dealloc{
    [arr release];
    [super dealloc];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jsqbackView.jpg"]];
    imageView.frame = CGRectMake(0, 0, 1024, 768);
    [self addSubview:imageView];
    [imageView release];
    
    UITextField *daikuan = [[UITextField alloc] initWithFrame:CGRectMake(75, 254, 123, 25)];
    daikuan.keyboardType = UIKeyboardTypeNumberPad;
    daikuan.tag = 10;
    daikuan.font = [UIFont fontWithName:@"FZWeiBei-S03S" size:14];
    [self addSubview:daikuan];
    [daikuan release];
    
    UITextField *daikuanqx = [[UITextField alloc] initWithFrame:CGRectMake(75, 366, 123, 25)];
    daikuanqx.keyboardType = UIKeyboardTypeNumberPad;
    daikuanqx.tag = 11;
    daikuanqx.delegate = self;
    daikuanqx.font = [UIFont fontWithName:@"FZWeiBei-S03S" size:14];
    [self addSubview:daikuanqx];
    [daikuanqx release];
    
    UITextField *daikuanll = [[UITextField alloc] initWithFrame:CGRectMake(75, 476, 41, 25)];
    daikuanll.keyboardType = UIKeyboardTypeNumberPad;
    daikuanll.delegate = self;
    daikuanll.tag = 12;
    daikuanll.font = [UIFont fontWithName:@"FZWeiBei-S03S" size:14];
    [self addSubview:daikuanll];
    [daikuanll release];
    
    UILabel *zhifulixi = [[UILabel alloc] initWithFrame:CGRectMake(498, 210, 123, 25)];
    zhifulixi.tag = 13;
    zhifulixi.backgroundColor = [UIColor clearColor];
    zhifulixi.font = [UIFont fontWithName:@"FZWeiBei-S03S" size:14];
    [self addSubview:zhifulixi];
    [zhifulixi release];
    
    UILabel *ljhgze = [[UILabel alloc] initWithFrame:CGRectMake(815, 210, 123, 25)];
    ljhgze.tag = 14;
    ljhgze.backgroundColor = [UIColor clearColor];
    ljhgze.font = [UIFont fontWithName:@"FZWeiBei-S03S" size:14];
    [self addSubview:ljhgze];
    [ljhgze release];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(385, 298, 575, 400)];
    self.table = tableView;
    tableView.allowsSelection = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self addSubview:tableView];
    [tableView release];
    
    UIButton *jisuanbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [jisuanbtn setImage:[UIImage imageNamed:@"jisuanqibtn2.png"] forState:UIControlStateNormal];
    [jisuanbtn addTarget:self action:@selector(jisuan) forControlEvents:UIControlEventTouchUpInside];
    jisuanbtn.frame = CGRectMake(82, 661, 76, 41);
    [self addSubview:jisuanbtn];
    
    UIButton *chongzbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [chongzbtn setImage:[UIImage imageNamed:@"jisuanqibtn3.png"] forState:UIControlStateNormal];
    [chongzbtn addTarget:self action:@selector(chongzhi) forControlEvents:UIControlEventTouchUpInside];
    chongzbtn.frame = CGRectMake(193, 661, 76, 41);
    [self addSubview:chongzbtn];
    
    UIButton *debxbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    debxbtn.tag =1000;
    [debxbtn addTarget:self action:@selector(radio:) forControlEvents:UIControlEventTouchUpInside];
    [debxbtn setImage:[UIImage imageNamed:@"radioBtn1.png"] forState:UIControlStateNormal];
    debxbtn.frame = CGRectMake(65, 582, 30, 30);
    [self addSubview:debxbtn];
    
    UIButton *dbbxbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    dbbxbtn.tag = 1001;
    [dbbxbtn addTarget:self action:@selector(radio:) forControlEvents:UIControlEventTouchUpInside];
    [dbbxbtn setImage:[UIImage imageNamed:@"radioBtn2.png"] forState:UIControlStateNormal];
    dbbxbtn.frame = CGRectMake(176, 582, 30, 30);
    [self addSubview:dbbxbtn];
    
//    UIButton *fanhui = [UIButton buttonWithType:UIButtonTypeCustom];
//    [fanhui setImage:[UIImage imageNamed:@"jisuanqibtn1.png"] forState:UIControlStateNormal];
//    [fanhui addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//    fanhui.frame = CGRectMake(853, 43, 76, 41);
//    [self addSubview:fanhui];

}


-(void)back{
    [self removeFromSuperview];
}

-(void)radio:(id)sender{
    UIButton *btn = (UIButton *)sender;
    if (btn.tag==1000) {
        type = 0;
        [(UIButton *)[self viewWithTag:1000] setImage:[UIImage imageNamed:@"radioBtn1.png"] forState:UIControlStateNormal];
        [(UIButton *)[self viewWithTag:1001] setImage:[UIImage imageNamed:@"radioBtn2.png"] forState:UIControlStateNormal];
    }else{
        type = 1;
        [(UIButton *)[self viewWithTag:1000] setImage:[UIImage imageNamed:@"radioBtn2.png"] forState:UIControlStateNormal];
        [(UIButton *)[self viewWithTag:1001] setImage:[UIImage imageNamed:@"radioBtn1.png"] forState:UIControlStateNormal];
    }
}

-(void)chongzhi{
    [(UITextField *)[self viewWithTag:10] setText:@""];
    [(UITextField *)[self viewWithTag:11] setText:@""];
    [(UITextField *)[self viewWithTag:12] setText:@""];
    [(UILabel *)[self viewWithTag:13] setText:@""];
    [(UILabel *)[self viewWithTag:14] setText:@""];
    self.arr = nil;
    [table reloadData];
}

-(void)jisuan{
    switch (type) {
        case 0:
          self.arr =  [FThdjsq dengEhk:[[(UITextField *)[self viewWithTag:10] text]doubleValue] qixian:[[(UITextField *)[self viewWithTag:11] text]intValue] lilv:[[(UITextField *)[self viewWithTag:12] text]doubleValue]];
            [(UILabel *)[self viewWithTag:13] setText:[NSString stringWithFormat:@"%.2f",[FThdjsq dengeLjhklx:[[(UITextField *)[self viewWithTag:10] text]doubleValue] qixian:[[(UITextField *)[self viewWithTag:11] text]intValue] lilv:[[(UITextField *)[self viewWithTag:12] text]doubleValue]]]];
            [(UILabel *)[self viewWithTag:14] setText:[NSString stringWithFormat:@"%.2f",[FThdjsq dengeLjhkzs:[[(UITextField *)[self viewWithTag:10] text]doubleValue] qixian:[[(UITextField *)[self viewWithTag:11] text]intValue] lilv:[[(UITextField *)[self viewWithTag:12] text]doubleValue]]]];
            break;
        case 1:
            self.arr =  [FThdjsq dengBhk:[[(UITextField *)[self viewWithTag:10] text]doubleValue] qixian:[[(UITextField *)[self viewWithTag:11] text]intValue] lilv:[[(UITextField *)[self viewWithTag:12] text]doubleValue]];
            [(UILabel *)[self viewWithTag:13] setText:[NSString stringWithFormat:@"%.2f",[FThdjsq dengbLjhklx:[[(UITextField *)[self viewWithTag:10] text]doubleValue] qixian:[[(UITextField *)[self viewWithTag:11] text]intValue] lilv:[[(UITextField *)[self viewWithTag:12] text]doubleValue]]]];
            
            [(UILabel *)[self viewWithTag:14] setText:[NSString stringWithFormat:@"%.2f",[FThdjsq dengbLjhkzs:[[(UITextField *)[self viewWithTag:10] text]doubleValue] qixian:[[(UITextField *)[self viewWithTag:11] text]intValue] lilv:[[(UITextField *)[self viewWithTag:12] text]doubleValue]]]];
            break;
    }
    [table reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arr count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
        
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 45, 44)];
        label1.tag = 10;
        label1.backgroundColor = [UIColor clearColor];
        label1.textAlignment = UITextAlignmentCenter;
        label1.font = [UIFont fontWithName:@"FZWeiBei-S03S" size:12];
        [cell.contentView addSubview:label1];
        [label1 release];
        
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(45, 0, 76, 44)];
        label2.tag = 11;
        label2.backgroundColor = [UIColor clearColor];
        label2.textAlignment = UITextAlignmentCenter;
        label2.font = [UIFont fontWithName:@"FZWeiBei-S03S" size:12];
        [cell.contentView addSubview:label2];
        [label2 release];
        
        UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(121, 0, 76, 44)];
        label3.tag = 12;
        label3.backgroundColor = [UIColor clearColor];
        label3.textAlignment = UITextAlignmentCenter;
        label3.font = [UIFont fontWithName:@"FZWeiBei-S03S" size:12];
        [cell.contentView addSubview:label3];
        [label3 release];
        
        UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(197, 0, 76, 44)];
        label4.tag = 13;
        label4.backgroundColor = [UIColor clearColor];
        label4.textAlignment = UITextAlignmentCenter;
        label4.font = [UIFont fontWithName:@"FZWeiBei-S03S" size:12];
        [cell.contentView addSubview:label4];
        [label4 release];
        
        UILabel *label5 = [[UILabel alloc]initWithFrame:CGRectMake(273, 0, 76, 44)];
        label5.tag = 14;
        label5.backgroundColor = [UIColor clearColor];
        label5.textAlignment = UITextAlignmentCenter;
        label5.font = [UIFont fontWithName:@"FZWeiBei-S03S" size:12];
        [cell.contentView addSubview:label5];
        [label5 release];
        
        UILabel *label6 = [[UILabel alloc]initWithFrame:CGRectMake(349, 0, 76, 44)];
        label6.tag = 15;
        label6.backgroundColor = [UIColor clearColor];
        label6.textAlignment = UITextAlignmentCenter;
        label6.font = [UIFont fontWithName:@"FZWeiBei-S03S" size:12];
        [cell.contentView addSubview:label6];
        [label6 release];
        
        UILabel *label7 = [[UILabel alloc]initWithFrame:CGRectMake(425, 0, 76, 44)];
        label7.tag = 16;
        label7.backgroundColor = [UIColor clearColor];
        label7.textAlignment = UITextAlignmentCenter;
        label7.font = [UIFont fontWithName:@"FZWeiBei-S03S" size:12];
        [cell.contentView addSubview:label7];
        [label7 release];
        
        UILabel *label8 = [[UILabel alloc]initWithFrame:CGRectMake(501, 0, 76, 44)];
        label8.tag = 17;
        label8.backgroundColor = [UIColor clearColor];
        label8.textAlignment = UITextAlignmentCenter;
        label8.font = [UIFont fontWithName:@"FZWeiBei-S03S" size:12];
        [cell.contentView addSubview:label8];
        [label8 release];
    }
    
    NSInteger row = [indexPath row];
    FThdjsq *obj = [arr objectAtIndex:row];
    [(UILabel *)[cell.contentView viewWithTag:10] setText:[NSString stringWithFormat:@"%d",obj.qishu]];
    [(UILabel *)[cell.contentView viewWithTag:11] setText:[NSString stringWithFormat:@"%d",obj.houxuqishu]];
    [(UILabel *)[cell.contentView viewWithTag:12] setText:[NSString stringWithFormat:@"%.2f",obj.shiyonglv]];
    [(UILabel *)[cell.contentView viewWithTag:13] setText:[NSString stringWithFormat:@"%.2f",obj.qichuyue]];
    [(UILabel *)[cell.contentView viewWithTag:14] setText:[NSString stringWithFormat:@"%.2f",obj.guihuanbenxi]];
    [(UILabel *)[cell.contentView viewWithTag:15] setText:[NSString stringWithFormat:@"%.2f",obj.guihuanlixi]];
    [(UILabel *)[cell.contentView viewWithTag:16] setText:[NSString stringWithFormat:@"%.2f",obj.guihuanbenjin]];
    [(UILabel *)[cell.contentView viewWithTag:17] setText:[NSString stringWithFormat:@"%.2f",fabs(obj.qimoyue)]];
    return cell;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField.tag == 12) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        self.frame = CGRectMake(0, -218, 1024, 768);
        [UIView commitAnimations];
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag == 12) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        self.frame = CGRectMake(0, 0, 1024, 768);
        [UIView commitAnimations];
    }
    NSInteger qixian = [[textField text] integerValue];
    if (textField.tag == 11) {
        if (qixian>=30) {
            textField.text = @"30";
        }else if (qixian<=1){
            textField.text = @"1";
        }
    }
}
@end
