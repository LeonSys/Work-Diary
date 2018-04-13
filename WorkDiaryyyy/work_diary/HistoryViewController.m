//
//  HistoryViewController.m
//  work_diary
//
//  Created by Kozak, Luca on 2018. 01. 30..
//  Copyright © 2018. Kozak, Luca. All rights reserved.
//

#import "HistoryViewController.h"
#import "DescriptionViewController.h"
#import "AppDelegate.h"
#import "CoreData/CoreData.h"
@interface HistoryViewController () {
    NSMutableArray *tasksToDelete;
    NSMutableArray *tasksData;
}
@property (weak, nonatomic) IBOutlet UITableView *table;


@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    NSManagedObjectContext *moc = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Tasks"];
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    NSManagedObject *task = [results objectAtIndex:0];
    
    
    
    self.tasks= [task valueForKey:@"taskname"];
    self.estimatedhour = [task valueForKey:@"estimatedhour"];
    
    [self.table beginUpdates];
    
    
    NSArray *arr = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:_tasks.count-1 inSection:0]];
    
    [self.table insertRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self.table endUpdates];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_tasks> 0) {
    return [self.tasks count];
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.tasks[indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    
    
    DescriptionViewController *descriptionController = [[DescriptionViewController alloc] init];
    descriptionController.cellTitle = selectedCell.textLabel.text;
   [defaults setObject:descriptionController.cellTitle forKey:@"cellTitle"];
  
    DescriptionViewController *descriptionControllerNumber = [[DescriptionViewController alloc] init];
    descriptionControllerNumber.cellNumber = self.estimatedhour[indexPath.row];
    [defaults setObject:descriptionControllerNumber.cellNumber forKey:@"cellNumber"];
    
    
   // [tasksToDelete addObject:tasksData[indexPath.row]];
    
    [self performSegueWithIdentifier:@"Description" sender:self];
    
}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    [tasksToDelete removeObject:tasksData[indexPath.row]];
}

-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 3;
}



-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }
}
 

- (IBAction)buttonDelete:(UIButton*)sender {
    [tasksData removeAllObjects];
    [self.table reloadData];
    
}
    
    



@end
