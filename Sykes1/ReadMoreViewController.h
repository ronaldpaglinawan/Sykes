//
//  ReadMoreViewController.h
//  Sykes1
//
//  Created by Rhenz on 7/24/14.
//  Copyright (c) 2014 Bonafide Infotech Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReadMoreViewController : UIViewController <UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;

// Main Service Label
@property (strong, nonatomic) IBOutlet UILabel *mainServiceLabel;

// Sub-Services Labels
//@property (strong, nonatomic) IBOutlet UILabel *mediaTypeLabel;
//@property (strong, nonatomic) IBOutlet UILabel *mentionTypeLabel;
//@property (strong, nonatomic) IBOutlet UILabel *topicTrendsLabel;
//@property (strong, nonatomic) IBOutlet UILabel *attributeSentimentLabel;
//@property (strong, nonatomic) IBOutlet UILabel *productSentimentLabel;
//@property (strong, nonatomic) IBOutlet UILabel *keyFindingsLabel;


// Sub-Services Details Labels
@property (strong, nonatomic) IBOutlet UILabel *mediaDetailLabel;
@property (strong, nonatomic) IBOutlet UILabel *mentionDetailLabel;
@property (strong, nonatomic) IBOutlet UILabel *topicTrendsDetailLabel;
@property (strong, nonatomic) IBOutlet UILabel *attributeDetailLabel;
@property (strong, nonatomic) IBOutlet UILabel *productSentimentDetailLabel;
@property (strong, nonatomic) IBOutlet UILabel *keyFindingsDetailLabel;


// Strings for Services
//@property (strong, nonatomic) NSString *mediaTypeString;
//@property (strong, nonatomic) NSString *topicTrendsString;
//@property (strong, nonatomic) NSString *attributeSentimentString;
//@property (strong, nonatomic) NSString *productSentimentString;
//@property (strong, nonatomic) NSString *keyFindingsString;

// Strings for Services' Details
@property (strong, nonatomic) NSString *mainServiceString;
@property (strong, nonatomic) NSString *mediaTypeDetailString;
@property (strong, nonatomic) NSString *mentionDetailString;
@property (strong, nonatomic) NSString *topicTrendsDetailString;
@property (strong, nonatomic) NSString *attributeDetailString;
@property (strong, nonatomic) NSString *productSentimentDetailString;
@property (strong, nonatomic) NSString *keyFindingsDetailString;

// Button/Outlet to proceed to Quotation View Controller
//- (IBAction)proceedToQuotationVCButton:(id)sender;
- (IBAction)serviceTitleButtonPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *serviceTitleButtonOutlet;

@end
