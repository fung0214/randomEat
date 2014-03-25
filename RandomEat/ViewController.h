//
//  ViewController.h
//  RandomEat
//
//  Created by Mac on 25/3/14.
//  Copyright (c) 2014 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic,weak) IBOutlet UISegmentedControl* segmentSpeed;
@property (nonatomic,weak) IBOutlet UISegmentedControl* segmentDistance;
@property (nonatomic,weak) IBOutlet UISegmentedControl* segmentPrice;
@property (nonatomic,weak) IBOutlet UIButton* randomButton;
@property (nonatomic,weak) IBOutlet UILabel* resultLabel;
-(IBAction) randomClick:(id) sender;
@end
