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
@property (weak, nonatomic) IBOutlet UILabel *estimatedHours;

@end
