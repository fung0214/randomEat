//
//  ViewController.m
//  RandomEat
//
//  Created by Mac on 25/3/14.
//  Copyright (c) 2014 Mac. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.eatArrayCMS = [NSMutableArray array];
    PFQuery* query = [PFQuery queryWithClassName:@"eatObject"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        self.eatArrayCMS = [objects mutableCopy];
    }];
    //self.eatArrayCMS = [[query findObjects] mutableCopy];
    
    /*
    [query getObjectInBackgroundWithId:nil block:^(PFObject* object,NSError *error) {
        [self.eatArrayCMS addObject:object];
    }];
     */
    /*
    [query getFirstObjectInBackgroundWithBlock:^(PFObject* object,NSError *error) {
        [self.eatArrayCMS addObject:object];
    }];
*/
    
    PFObject *testObject = [PFObject objectWithClassName:@"Good"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
}

-(IBAction) randomClick:(id) sender {
    
    
    //NSArray* eatArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"eatlist" ofType:@"plist"]];
    NSArray* eatArray = self.eatArrayCMS;
    
    /*
    for(NSDictionary* dict in eatArray) {
        PFObject* eatObject = [PFObject objectWithClassName:@"eatObject"];
        eatObject[@"name"] = dict[@"name"];
        eatObject[@"price"] = dict[@"price"];
        eatObject[@"distance"] = dict[@"distance"];
        eatObject[@"speed"] = dict[@"speed"];
        [eatObject saveInBackground];
    }
    */
    NSMutableArray* goodEatArray = [NSMutableArray array];
    
    for(NSDictionary* dict in eatArray) {
        float price = [dict[@"price"] floatValue];
        int speed = [dict[@"speed"] integerValue];
        int distance = [dict[@"distance"] integerValue];
        
        BOOL good = YES;
        if(_segmentSpeed.selectedSegmentIndex == 0) {
            if(speed > 1) {
                good = NO;
            }
        }else if(_segmentSpeed.selectedSegmentIndex == 1) {
            if(speed < 1) {
                good = NO;
            }
        }
        
        if(_segmentDistance.selectedSegmentIndex == 0) {
            if(distance > 1) {
                good = NO;
            }
        }else if(_segmentDistance.selectedSegmentIndex == 1) {
            if(distance < 1) {
                good = NO;
            }
        }
        
        if(_segmentPrice.selectedSegmentIndex == 0) {
            if(price > 70.0) {
                good = NO;
            }
        }else if(_segmentPrice.selectedSegmentIndex == 1) {
            if(price < 60.0) {
                good = NO;
            }
        }
        
        if(good) {
            [goodEatArray addObject:dict];
        }
    }
    
    
    if([goodEatArray count] == 0) {
        self.resultLabel.text = @"No Result!";
        return;
    }
    
    int randomIndex = arc4random() % [goodEatArray count];
    
    
    
    NSDictionary* resultDict = [goodEatArray objectAtIndex:randomIndex];
    
    self.resultLabel.text = resultDict[@"name"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
