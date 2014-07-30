//
//  PDFViewController.m
//  Sykes1
//
//  Created by Ronald F. Paglinawan on 7/29/14.
//  Copyright (c) 2014 Bonafide Infotech Inc. All rights reserved.
//

#import "PDFViewController.h"

@interface PDFViewController ()

@end

@implementation PDFViewController

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
    
    NSLog(@"chosenItemsArray value at PDFViewController: %@", _chosenItemsArray);
    
    [self generatePDF];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)chooseAction:(id)sender
{
    // Codes to open the action sheet with set of Actions to choose:
    
    UIActionSheet *selectPopup = [[UIActionSheet alloc] initWithTitle:@""
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil  //@"Reset Selection"
                                                    otherButtonTitles:@"Send PDF", @"Send Email", nil];
    
    [selectPopup showInView:self.view];
}

// CUSTOM METHOD
- (void)generatePDF
{
    // -- codes to setup the PDF file
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    NSString* documentDirectory = [documentDirectories objectAtIndex:0];
    NSString *pdfFileName = [documentDirectory stringByAppendingPathComponent:@"Quotation.pdf"];
    
    
    
    
    
    // -- codes for drawing the PDF file
    UIGraphicsBeginPDFContextToFile(pdfFileName, CGRectZero, nil);

    // PDF page size
    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 612, 792), nil);
    
    
    // draw the company logo
    UIImage *myImage = [UIImage imageNamed:@"Sykes_logo"];
    [myImage drawInRect:CGRectMake(250, 50, myImage.size.width, myImage.size.height)];
    
    
    // draw the dateLabel
    NSString *dateLabel = @"Date/Time:";
    [dateLabel drawInRect:CGRectMake(450, 15, 600, 50) withAttributes:nil];
    
    
    // draw time and date
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    NSString *currentTime = [dateFormatter stringFromDate:[NSDate date]];
    [currentTime drawInRect:CGRectMake(450, 30, 600, 50) withAttributes:nil];
    
    
    // draw the device id label
    NSString* uniqueIdentifierLabel = [[NSString alloc] initWithFormat:@"UDID: \n%@", [[[UIDevice currentDevice] identifierForVendor] UUIDString]]; // IOS 6+
   [uniqueIdentifierLabel drawInRect:CGRectMake(20, 15, 150, 50) withAttributes:nil];
    NSLog(@"UDID:: %@", uniqueIdentifierLabel);
    
    
    // draw the titleLabel
    NSString *titleLabel = @"Research Type Inquiry";
    [titleLabel drawInRect:CGRectMake(240, 125, 700, 700) withAttributes:nil];  // x, y, width, height
    
    // draw the userPreferencesLabel
    NSString *userPreferencesLabel = @"User Preferences:";
    [userPreferencesLabel drawInRect:CGRectMake(250, 190, 700, 700) withAttributes:nil];  // x, y, width, height
    
    
    float yPos = 220;
    // trial print all contents in array
    for (id object in _chosenItemsArray)
    {
        NSLog(@"%@", object);
        
        NSString *itemString = object;
        [itemString drawInRect:CGRectMake(260, yPos, 200, 100) withAttributes:nil];
        
        // increment yPos by 15
        yPos += 15;
        
    }
    
    
    // draw companyDetailsLabel
    NSString *companyDetailsLabel = @"       Sykes Enterprises \n\n             Main Office\n       Tampa, Florida, USA\n              508-9371\n    	www.sykes.com";
    [companyDetailsLabel drawInRect:CGRectMake(250, 660, 700, 700) withAttributes:nil];
    
    
    
    
    
    
    
    UIGraphicsEndPDFContext();
    
    
    
    
    
    
    
    
    
    // -- Codes for acquiring the directory for the generated PDF file inside the iDevice:
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *pdfFile = [docDir stringByAppendingPathComponent:@"Quotation.pdf"];
    
    
    
    //code to check if the PDF file exist inside the directory:
    if ([[NSFileManager defaultManager] fileExistsAtPath:pdfFile])
    {
        NSLog(@"PDF data found");
        
        //Codes for loading the PDF file in the UIWebVew:
        NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *path = [docDir stringByAppendingPathComponent:@"Quotation.pdf"];
        
        NSURL *url = [NSURL fileURLWithPath:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_pdfWebView loadRequest:request];
        
    }
    
    else
    {
        //No pdf data found in the directory!!!
        NSLog(@"No pdf data found in the directory!!!");
    }

}



#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:@"Send PDF"])
    {
        NSLog(@"Send PDF here");
    }
    
    else if ([buttonTitle isEqualToString:@"Send Email"])
    {
        NSLog(@"User tapped 'Send Email'");
        
        // Codes to open the Mail app with pre-configured email message
        
        
        if ([MFMailComposeViewController canSendMail])
        {
            
            //Set-up the mailView with predefined message:
            MFMailComposeViewController *mailView = [[MFMailComposeViewController alloc] init];
            mailView.mailComposeDelegate = self;
            
            [mailView setSubject:@"Customer Inquiry"];
            [mailView setToRecipients:[NSArray arrayWithObject:@"info.sykes@bonafideinfotech.ph"]]; //to recipients email address
            [mailView setMessageBody:@""  isHTML:NO]; // preset body message
            
            [mailView addAttachmentData:[NSData dataWithContentsOfFile:@"Quotation.pdf"] mimeType:@"application/pdf" fileName:@"myQuotation.pdf"];
            
            [self presentViewController:mailView animated:YES completion:nil];
        }
        
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                            message:@"Your device doesn't support the mail composer sheet"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        
    }
    
    else
    {
        NSLog(@"User tapped 'Cancel'");
    }
}



#pragma mark - MFMailComposeViewControllerDelegate

- (void) mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail Cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail Saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail Sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail Failed");
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
