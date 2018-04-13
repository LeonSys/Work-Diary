//
//  NewTaskViewController.m
//  work_diary
//
//  Created by Kozak, Luca on 2018. 01. 25..
//  Copyright © 2018. Kozak, Luca. All rights reserved.

#import "NewTaskViewController.h"
#import "AppDelegate.h"
#import "CoreData/CoreData.h"
@interface NewTaskViewController () 

@property (weak, nonatomic) IBOutlet UITextField *tasknameField;
@property (weak, nonatomic) IBOutlet UITextField *estimatedhourField;

@end

@implementation NewTaskViewController

-(BOOL) validateHour:(NSString *)candidate {
    NSString *hourRegex = @"[0-9]{1,10}";
    NSPredicate *hourTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", hourRegex];
    
    return [hourTest evaluateWithObject:candidate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)savenewtask:(id)sender {
    
    if ([ _tasknameField.text isEqualToString:@""] ||
        [ _estimatedhourField.text isEqualToString:@""] ||
        ![self validateHour:_estimatedhourField.text])
        
    {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"OOops!" message:@"Something is wrong" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }
    else {
        [self saveNewTask];
    }
}
    
- (void) saveNewTask {
    NSManagedObjectContext *moc = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Tasks"];
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    NSManagedObject *task = [results objectAtIndex:0];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray * tasksFromMemory = [task valueForKey:@"task"];
    NSMutableArray *tasks;
    NSArray * estimatedhourFromMemory = [task valueForKey:@"estimatedhour"];
    NSMutableArray *estimatedhour;
    
    if (!tasksFromMemory) {
        tasks= [[NSMutableArray alloc] initWithArray:tasksFromMemory];
    }
    else {
        tasks= [[NSMutableArray alloc] initWithArray:tasksFromMemory];
    }
   
    if (!estimatedhourFromMemory) {
        estimatedhour = [[NSMutableArray alloc] initWithArray:estimatedhourFromMemory];
    }
    else {
        estimatedhour = [[NSMutableArray alloc] initWithArray:estimatedhourFromMemory];
    }
    
        [tasks addObject:self.tasknameField.text];
        [estimatedhour addObject:self.estimatedhourField.text];
    
    NSManagedObjectContext *context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    
    NSManagedObject *newtask = [NSEntityDescription insertNewObjectForEntityForName:@"Tasks" inManagedObjectContext:context];
    
    
    [newtask setValue:tasks forKey:@"task"];
    [newtask setValue:estimatedhour forKey:@"estimatedhour"];
    
    /* [defaults setObject:tasks forKey:@"taskname"];
        [defaults setObject:estimatedhour forKey:@"estimatedhour"];*/
    
    //[defaults setObject:_estimatedhourField.text forKey:@"estimatedhour"];
        
        [defaults synchronize];
    
        UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Success" message:@"You have added a new task, go back to home." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
        [success show];
    
}




@end

