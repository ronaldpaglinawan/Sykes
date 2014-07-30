//
//  ProductSentimentTableViewController.h
//  Sykes1
//
//  Created by Rhenz on 7/24/14.
//  Copyright (c) 2014 Bonafide Infotech Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyFindingsTableViewController.h"

@interface ProductSentimentTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *productSentimentArray;

@property (strong, nonatomic) NSMutableArray *chosenItemsArray;

@end
