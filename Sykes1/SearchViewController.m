//
//  SearchViewController.m
//  Sykes1
//
//  Created by Rhenz on 7/30/14.
//  Copyright (c) 2014 Bonafide Infotech Inc. All rights reserved.
//

#import "SearchViewController.h"

#define kOFFSET_FOR_KEYBOARD 220

@interface SearchViewController () <UITextFieldDelegate>

@end

@implementation SearchViewController

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
//    [_nameTextField setDelegate:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)dismissButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma Keyboard Move UP
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == _nameTextField) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        _nameTextField.frame = CGRectMake(_nameTextField.frame.origin.x, (_nameTextField.frame.origin.y - 220.0), _nameTextField.frame.size.width, _nameTextField.frame.size.height);
        
        _nameLabel.frame = CGRectMake(_nameLabel.frame.origin.x, (_nameLabel.frame.origin.y - 220.0), _nameLabel.frame.size.width, _nameLabel.frame.size.height);
        [UIView commitAnimations];
    } else if (textField == _nameTextField) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        _nameTextField.frame = CGRectMake(_nameTextField.frame.origin.x, (_nameTextField.frame.origin.y - 220.0), _nameTextField.frame.size.width, _nameTextField.frame.size.height);
        
        _nameLabel.frame = CGRectMake(_nameLabel.frame.origin.x, (_nameLabel.frame.origin.y - 220.0), _nameLabel.frame.size.width, _nameLabel.frame.size.height);
        [UIView commitAnimations];
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField == _nameTextField) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        _nameTextField.frame = CGRectMake(_nameTextField.frame.origin.x, (_nameTextField.frame.origin.y + 220.0), _nameTextField.frame.size.width, _nameTextField.frame.size.height);
        
        _nameLabel.frame = CGRectMake(_nameLabel.frame.origin.x, (_nameLabel.frame.origin.y + 220.0), _nameLabel.frame.size.width, _nameLabel.frame.size.height);
        [UIView commitAnimations];
    } else if (textField == _nameTextField) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        _nameTextField.frame = CGRectMake(_nameTextField.frame.origin.x, (_nameTextField.frame.origin.y + 220.0), _nameTextField.frame.size.width, _nameTextField.frame.size.height);
        
        _nameLabel.frame = CGRectMake(_nameLabel.frame.origin.x, (_nameLabel.frame.origin.y + 220.0), _nameLabel.frame.size.width, _nameLabel.frame.size.height);
        [UIView commitAnimations];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[_nameTextField resignFirstResponder];
}
@end