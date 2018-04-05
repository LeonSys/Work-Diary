//
//  DescriptionViewController.h
//  work_diary
//
//  Created by Horvath, Leon on 2018. 02. 22..
//  Copyright © 2018. Kozak, Luca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DescriptionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) NSString *cellTitle;
@property (weak, nonatomic) NSMutableString *cellNumber;
@property (weak, nonatomic) NSString *workedHours;
@property (weak, nonatomic) IBOutlet UILabel *estimatedHours;
@property (weak, nonatomic) IBOutlet UITextView *descriptionLongText;
@property (weak, nonatomic) IBOutlet UILabel *hoursWorked;

@end
