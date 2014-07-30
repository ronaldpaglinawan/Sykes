//
//  SearchViewController.h
//  Sykes1
//
//  Created by Rhenz on 7/30/14.
//  Copyright (c) 2014 Bonafide Infotech Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

- (IBAction)dismissButton:(id)sender;
@end
