//
//  DescriptionViewController.m
//  work_diary
//
//  Created by Horvath, Leon on 2018. 02. 22..
//  Copyright © 2018. Kozak, Luca. All rights reserved.
//

#import "DescriptionViewController.h"
#import "HistoryViewController.h"
@interface DescriptionViewController ()

@end

@implementation DescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableString *seged = [defaults objectForKey:@"taskname"];
    
   // _estimatedHours.text = @"estimated time: %@",_seged;
    
    NSLog(@"%@",seged);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}



@end
