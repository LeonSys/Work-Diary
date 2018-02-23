//
//  HistoryViewController.h
//  work_diary
//
//  Created by Kozak, Luca on 2018. 01. 30..
//  Copyright © 2018. Kozak, Luca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryViewController : UIViewController <UITableViewDelegate, UITableViewDelegate> {
    
}
@property (weak, nonatomic) IBOutlet UIButton *DeleteButton;
@property (copy, nonatomic) NSArray *tasks;
@property (copy, nonatomic) NSArray *estimatedhour;
@property (strong, nonatomic) NSArray *seged;
@end
