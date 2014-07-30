//
//  KeyFindingsTableViewController.h
//  Sykes1
//
//  Created by Rhenz on 7/24/14.
//  Copyright (c) 2014 Bonafide Infotech Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "PDFViewController.h"


@interface KeyFindingsTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *keyFindingsArray;

@property (strong, nonatomic) NSMutableArray *chosenItemsArray;

@end
