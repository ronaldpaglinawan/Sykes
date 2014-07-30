//
//  KeyFindingsTableViewController.m
//  Sykes1
//
//  Created by Rhenz on 7/24/14.
//  Copyright (c) 2014 Bonafide Infotech Inc. All rights reserved.
//

#import "KeyFindingsTableViewController.h"



@interface KeyFindingsTableViewController ()
{
    int itemCounter;
    
}
@end

@implementation KeyFindingsTableViewController

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
    
    _keyFindingsArray = [NSArray arrayWithObjects:@"Social Media Presence", @"Listening Activity", @"Brand Management", @"Further Research", nil];
    
    NSLog(@"chosenItemsArray value at KeyFindingsTableViewController: %@", _chosenItemsArray);
    
    // set itemCounter to 0
    itemCounter = 0;
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
    return [_keyFindingsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"keyFindingCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [_keyFindingsArray objectAtIndex:indexPath.row];
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
        
       // NSLog(@"array size: %i", _chosenItemsArray.count);
       // NSLog(@"chosenItemsArray: %@", _chosenItemsArray);
        
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
    if ([segue.identifier isEqualToString:@"toPDFSegue"])
    {
        // open KeyFindingsTableViewController
        PDFViewController *pdfVC = [segue destinationViewController];
        [pdfVC setChosenItemsArray:_chosenItemsArray];
    }
}



@end
