//
//  ViewController.m
//  Initials Avatar
//
//  Created by Toto Tvalavadze on 2/23/15.
//  Copyright (c) 2015 Toto Tvalavadze. All rights reserved.
//

#import "ViewController.h"
#import "CDFInitialsAvatar.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *topLeft;
@property (weak, nonatomic) IBOutlet UIImageView *topRight;
@property (weak, nonatomic) IBOutlet UIImageView *bottomLeft;
@property (weak, nonatomic) IBOutlet UIImageView *bottomRight;

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (strong, nonatomic) NSArray *defaultNames;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // random names for initial load, from http://uinames.com
    self.defaultNames = @[@"Toto Tvalavadze",
                          @"Marilyn Grant",
                          @"Diane Edwards",
                          @"Keith Robinson",
                          @"Janet Wheeler",
                          @"Melissa Rivera",
                          @"Jeremy Torres",
                          @"Nicole Green",
                          @"Christopher Davidson",
                          @"Jordan Peterson"];
    
    self.nameField.delegate = self;
    self.nameField.text = self.defaultNames[arc4random()%self.defaultNames.count];
    
    [self nameChanged:nil]; // initial load
}

- (IBAction)nameChanged:(UITextField *)sender {
    
    CDFInitialsAvatar *topLeftAvatar = [[CDFInitialsAvatar alloc] initWithRect:self.topLeft.bounds fullName:self.nameField.text];
    self.topLeft.image = topLeftAvatar.imageRepresentation;
    
    
    CDFInitialsAvatar *topRightAvatar = [[CDFInitialsAvatar alloc] initWithRect:self.topLeft.bounds fullName:self.nameField.text];
    topRightAvatar.backgroundColor = [UIColor colorWithRed:0.843 green:0.788 blue:0.667 alpha:1]; // custom background color
    CALayer *mask = [CALayer layer]; // this will become a mask for UIImageView
    UIImage *maskImage = [UIImage imageNamed:@"AvatarMask"]; // circle, in this case
    mask.contents = (id)[maskImage CGImage];
    mask.frame = self.topLeft.bounds;
    self.topRight.layer.mask = mask;
    self.topRight.layer.masksToBounds = YES;
    self.topRight.image = topRightAvatar.imageRepresentation;
    
    
    CDFInitialsAvatar *bottomLeftAvatar = [[CDFInitialsAvatar alloc] initWithRect:self.topLeft.bounds fullName:self.nameField.text];
    bottomLeftAvatar.backgroundColor = [UIColor colorWithRed:0.941 green:0.58 blue:0.341 alpha:1]; // custom background color
    bottomLeftAvatar.initialsColor = [UIColor colorWithRed:0.965 green:0.973 blue:0.875 alpha:1]; // custom text color
    self.bottomLeft.image = bottomLeftAvatar.imageRepresentation;
    
    
    CDFInitialsAvatar *bottomRightAvatar = [[CDFInitialsAvatar alloc] initWithRect:self.topLeft.bounds fullName:self.nameField.text];
    bottomRightAvatar.initialsFont = [UIFont fontWithName:@"MarkerFelt-Thin" size:40.0]; // custom font and font size, for more info see FAQ in README
    self.bottomRight.image = bottomRightAvatar.imageRepresentation;
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
