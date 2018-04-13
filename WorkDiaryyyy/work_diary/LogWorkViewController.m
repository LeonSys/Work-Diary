//
//  LogWorkViewController.m
//  work_diary
//
//  Created by Kozak, Luca on 2018. 01. 25..
//  Copyright © 2018. Kozak, Luca. All rights reserved.
//

#import "LogWorkViewController.h"
#import "DescriptionViewController.h"
#import "AppDelegate.h"
#import "CoreData/CoreData.h"
@interface LogWorkViewController (){
    NSArray *tasks;
}
@property (weak, nonatomic) IBOutlet UITextField *workhourField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datepickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) NSString *selectedRow;
 @property (weak, nonatomic) NSMutableArray *workedhours;
@end
 NSMutableArray *hours;
@implementation LogWorkViewController


-(BOOL) validateHour:(NSString *)candidate {
    NSString *hourRegex = @"[0-9]{1,10}";
    NSPredicate *hourTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", hourRegex];
    
    return [hourTest evaluateWithObject:candidate];
}


- (void)viewDidLoad {
    
    NSManagedObjectContext *moc = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Tasks"];
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    NSManagedObject *task = [results objectAtIndex:0];
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [super viewDidLoad];
    tasks = [task valueForKey:@"Task"];
      self.pickerView.dataSource = self;
      self.pickerView.delegate = self;
    
  
    self.datepickerView.datePickerMode = UIDatePickerModeDate;
    [self.datepickerView setValue:[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f] forKeyPath:@"textColor"];
    SEL selector = NSSelectorFromString(@"setHighlightsToday:");
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDatePicker instanceMethodSignatureForSelector:selector]];
    BOOL no = NO;
    [invocation setSelector:selector];
    [invocation setArgument:&no atIndex:2];
    [invocation invokeWithTarget:self.datepickerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
   
    _selectedRow = [tasks objectAtIndex:[self.pickerView selectedRowInComponent:0]];
    NSLog(@"%@", _selectedRow);
}


-(NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView {
    return 1;
}
 
-(NSInteger)pickerView: (UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
 {
 return tasks.count;
 }
 
 -(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
 {
     return tasks[row];
 }


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    
    if(component == 0)
    {
        label.text = [tasks objectAtIndex:row];
    }

    return label;
}


/*- (IBAction)savelogwork:(id)sender {
    
    if ([ _workhourField.text isEqualToString:@""] ||
        ![self validateHour:_workhourField.text])
        
    {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"OOops!" message:@"Something is wrong" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }
    //else { [self saveHour];
        
    
    }

//}

/*- (void) saveHour {
    
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *workedhours;
    NSArray * workedhoursFromMemory = [defaults objectForKey:@"workedhours"];
    
    
    if (!workedhoursFromMemory) {
        workedhours = [[NSMutableArray alloc] initWithArray:workedhoursFromMemory];
    }
    else {
        workedhours = [[NSMutableArray alloc] initWithArray:workedhoursFromMemory];
    }
 */
  
   
    
    
    /*[workedhours addObject:_workhourField.text];
    [defaults setObject:workedhours forKey:@"workedhours"];

    [defaults synchronize];
    
    UIAlertView *succes = [[UIAlertView alloc] initWithTitle:@"Nice" message:@"You loged your work" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [succes show];*/
    
  //// NSLog(@".... %@",[defaults objectForKey:@"taskname"]);
    
    
   
    

    
//}

@end
