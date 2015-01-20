//
//  MLFirstVC.m
//  EJianZhi
//
//  Created by RAY on 15/1/19.
//  Copyright (c) 2015年 麻辣工作室. All rights reserved.
//

#import "MLFirstVC.h"

@interface MLFirstVC ()
{
    UIView *_weiguanView;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation MLFirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchBar"]];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"一键兼职" style:UIBarButtonItemStylePlain target:self action:@selector(clickFind)];
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提现记录" style:UIBarButtonItemStylePlain target:self action:@selector(cashRecord)];
    self.navigationItem.rightBarButtonItem.tintColor=[UIColor whiteColor];
    
    [self initSwpieView];
    
    
}

- (void)initSwpieView{
    
    _weiguanView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    [self.scrollView addSubview:_weiguanView];
    
    float gap=([[UIScreen mainScreen] bounds].size.width-180-16)/8;
    
    //存储我的围观选项
    NSArray *arr=[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4", nil];
    
    NSInteger num=[arr count];
    int temp=1;
    for (int j=0; j<=2; j++) {
        for (int i=j+1; i<=j+4; i++) {
            if (temp<=num) {
                UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake((2*(i-j)-1)*gap+(i-j-1)*45, 5+j*75, 45, 45)];
                [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"weiguan_%@",[arr objectAtIndex:temp-1]]] forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(weiguan:) forControlEvents:UIControlEventTouchUpInside];
                [_weiguanView addSubview:btn];
                btn.tag=temp;
                
                UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(btn.center.x-30, btn.center.y+30, 60, 15)];
                lbl.text=@"19116人在线";
                lbl.textAlignment=NSTextAlignmentCenter;
                lbl.font=[UIFont systemFontOfSize:9.0];
                lbl.textColor=[UIColor darkGrayColor];
                [_weiguanView addSubview:lbl];
                
                temp++;
                
            }else{
                
                UIButton *btn1=[[UIButton alloc]initWithFrame:CGRectMake((2*(i-j)-1)*gap+(i-j-1)*45, 5+j*75, 45, 45)];
                [btn1 setImage:[UIImage imageNamed:@"tianjia"] forState:UIControlStateNormal];
                [btn1 addTarget:self action:@selector(tianjia:) forControlEvents:UIControlEventTouchUpInside];
                [_weiguanView addSubview:btn1];
                btn1.tag=temp;
                
                UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(btn1.center.x-30, btn1.center.y+30, 60, 15)];
                lbl.text=@"添加围观";
                lbl.textAlignment=NSTextAlignmentCenter;
                lbl.font=[UIFont systemFontOfSize:9.0];
                lbl.textColor=[UIColor darkGrayColor];
                [_weiguanView addSubview:lbl];
                
                j=999;
                break;
            }
        }
    }
}

- (void)cashRecord{
    
}

- (void)clickFind{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
