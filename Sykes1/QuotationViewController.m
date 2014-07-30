//
//  QuotationViewController.m
//  Sykes1
//
//  Created by Rhenz on 7/24/14.
//  Copyright (c) 2014 Bonafide Infotech Inc. All rights reserved.
//

#import "QuotationViewController.h"
#import "ReadMoreViewController.h"
#import "Quotation.h"
#import "MediaTypeTableViewController.h"


@interface QuotationViewController ()
{
    NSArray *mediaTypeArray;
    NSArray *mentionTypeArray;
}


@end

@implementation QuotationViewController




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated. gofluent
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




- (IBAction)readMoreButtonPressed:(id)sender
{
    NSLog(@"readMore Button Pressed");
    
}

- (IBAction)dismiss:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"essentialReadMoreSegue"])
    {
        NSLog(@"Essentials!");
        ReadMoreViewController *RMVC = [segue destinationViewController];
        
        RMVC.mainServiceString = @"Essentials";
        RMVC.mediaTypeDetailString = essentialMediaTypeDesc;
        RMVC.mentionDetailString = essentialMentionTypeDesc;
        RMVC.topicTrendsDetailString = essentialTopicTrendsDesc;
        RMVC.attributeDetailString = essentialAttributeSentimentDesc;
        RMVC.productSentimentDetailString = essentialProductSentimentDesc;
        RMVC.keyFindingsDetailString = essentialKeyFindingsDesc;
        
    } else if ([[segue identifier] isEqualToString:@"comprehensiveReadMoreSegue"])
    {
        NSLog(@"Comprehensive!");
        ReadMoreViewController *RMVC = [segue destinationViewController];
        
        RMVC.mainServiceString = @"Comprehensive";
        RMVC.mediaTypeDetailString = comprehensiveMediaTypeDesc;
        RMVC.mentionDetailString = comprehensiveMentionTypeDesc;
        RMVC.topicTrendsDetailString = comprehensiveTopicTrendsDesc;
        RMVC.attributeDetailString = comprehensiveAttributeSentimentDesc;
        RMVC.productSentimentDetailString = comprehensiveProductSentimentDesc;
        RMVC.keyFindingsDetailString = comprehensiveKeyFindingsDesc;
        
    } else if ([[segue identifier] isEqualToString:@"industryReadMoreSegue"])
    {
        NSLog(@"Industry!");
        ReadMoreViewController *RMVC = [segue destinationViewController];
        
        RMVC.mainServiceString = @"Industry";
        RMVC.mediaTypeDetailString = industryMediaTypeDesc;
        RMVC.mentionDetailString = industryMentionTypeDesc;
        RMVC.topicTrendsDetailString = industryTopicTrendsDesc;
        RMVC.attributeDetailString = industryAttributeSentimentDesc;
        RMVC.productSentimentDetailString = industryProductSentimentDesc;
        RMVC.keyFindingsDetailString = industryKeyFindingsDesc;
    } else if ([[segue identifier] isEqualToString:@"essentialSegue"])
    {
        NSLog(@"Essential Table View");
        
//        MediaTypeTableViewController *MTVC = [segue destinationViewController];
//        mediaTypeArray = [NSArray arrayWithObjects:@"Facebook", @"Twitter", @"MySpace", @"News Site", @"Blogs", @"Forums", @"Buy & Sell Sites", @"Comments", @"Images", @"Videos", nil];
        mentionTypeArray = [NSArray arrayWithObjects:@"Brand Mention", @"Criticism",@"Complain", @"Gratitude", @"Compliment", @"Marketing", @"Media Relations", @"News", @"Query", @"Review", @"Suggestion", @"Support", nil];
//        [MTVC setMediaTypeArray:mediaTypeArray];
//        [MTVC setMentionTypeArray:mentionTypeArray];
        

        
        
        
        
    } else if ([[segue identifier] isEqualToString:@"comprehensiveSegue"])
    {
        NSLog(@"Comprehensive Table View");
        
    } else if ([[segue identifier] isEqualToString:@"industrySegue"])
    {
        
        NSLog(@"Industry Table View");
        
    }
    
}


@end
