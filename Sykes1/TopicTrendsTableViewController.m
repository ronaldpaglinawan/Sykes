//
//  TopicTrendsTableViewController.m
//  Sykes1
//
//  Created by Rhenz on 7/24/14.
//  Copyright (c) 2014 Bonafide Infotech Inc. All rights reserved.
//

#import "TopicTrendsTableViewController.h"

@interface TopicTrendsTableViewController ()
{
    int itemCounter;
}
@end

@implementation TopicTrendsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _topicTrendsArray = [NSArray arrayWithObjects:@"Brand Mention", @"Criticism", @"Complaint", @"Gratitude", @"Compliment", @"Marketing", @"Media Relations", @"News", @"Query", @"Review", @"Suggestion", @"Support", nil];
    
    
    NSLog(@"chosenItemsArray value at TopicTrends: %@", _chosenItemsArray);
    
    // set itemCounter to 0
    itemCounter = 0;

    
    _chosenItemsArray = [[NSMutableArray alloc] init];
    _mediaItemsArray = [[NSMutableArray alloc] init];
    _mentionItemsArray = [[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_topicTrendsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"topicTrendsCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [_topicTrendsArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:NO];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    // Static Ctr
    static int ctr = 3;
    
    // Accessory Checkmark
    if ((cell.accessoryType == UITableViewCellAccessoryNone) && ctr != 0)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        ctr--;
        NSLog(@"ctr: %d", ctr);
        
        
        // save current cell textLabel value to chosenItemsArray:
        [_chosenItemsArray addObject:cell.textLabel.text];
        
        itemCounter++;
    }
    
    else if (cell.accessoryType == UITableViewCellAccessoryCheckmark)
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        ctr++;
        NSLog(@"ctr: %d", ctr);
        
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toAttributeSentimentSegue"])
    {
        // open AttributeSentimentTableViewController
        AttributeSentimentTableViewController *attributeVC = [segue destinationViewController];
        [attributeVC setChosenItemsArray:_chosenItemsArray];
    }
}


@end
