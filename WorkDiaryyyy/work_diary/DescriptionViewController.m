//
//  DescriptionViewController.m
//  work_diary
//
//  Created by Horvath, Leon on 2018. 02. 22..
//  Copyright © 2018. Kozak, Luca. All rights reserved.
//

#import "DescriptionViewController.h"
#import "HistoryViewController.h"
#import "LoginViewController.h"
@interface DescriptionViewController ()

@end

@implementation DescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    _titleLabel.text = [defaults objectForKey:@"cellTitle"];
    
  
    _estimatedHours.text = [NSString stringWithFormat:@"Estimated Hours: %@", [defaults objectForKey:@"cellNumber"]];
    
    
    _cellNumber = [defaults objectForKey:@"cellNumber"];

    NSLog(@"asd %@",[defaults objectForKey:@"workedhours"]);
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
    
}

- (IBAction)saveButton:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject: _descriptionLongText.text forKey:@"Desclongtext"];
    
    UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Success" message:@"You have saved your task details" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [success show];
    
   [self performSegueWithIdentifier:@"descSave" sender:self];
    NSLog(@"Valamit %@",[defaults objectForKey:@"descSave"]);

}



@end
