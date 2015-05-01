//
//  GRViewController.m
//  GitReference
//
//  Created by Warren Goh on 5/1/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "GRViewController.h"

//declaring global margins and height to be applicable.
static CGFloat heightForLabel = 20;
static CGFloat margin = 15;
static NSString * const bill = @"command";
// we are converting bill which was command previously into a string to be recalled easier in the future. 
static NSString * const Reference = @"reference";

@interface GRViewController ()
@end

@implementation GRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Creating the scroll view controller
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20)];
    [self.view addSubview:scrollView];
    
    
    CGFloat topMargin = 20;
    CGFloat widthMinusMargin = self.view.frame.size.width - 2 * margin;
    CGFloat top = topMargin + heightForLabel + margin * 2;
    
    //declaring the title.
//    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin, widthMinusMargin, heightForLabel)];
//    title.text = @"GitReference";
//    title.textColor = [UIColor orangeColor];
//    title.font = [UIFont boldSystemFontOfSize:25];
//    [scrollView addSubview:title];
    
    //declaring the title in the navigation controller.
    self.title = @"Git Reference";
    
    //Add a for loop to iterate through the dictionaries in the gitCommands method provided
    //there are 2 commands, one is command and one is reference, do both.
    //the array is called by gitCommand. 
    
    
    
    //declaring NSDictionary GITcommand to pull records from git commands dictionary.
    for (NSDictionary *gitCommand in [self gitCommands]) {
        
        NSString *command = gitCommand[bill];
        NSString *reference = gitCommand[Reference];
        
        UILabel *gitCommand = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, widthMinusMargin, heightForLabel)];
        gitCommand.font = [UIFont boldSystemFontOfSize:17];
        gitCommand.text = command;
        [scrollView addSubview:gitCommand];
        
        top += (heightForLabel + margin);
        
        CGFloat heightForReference = [self heightOfReferenceString:reference];
        
        UILabel *gitReference = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, widthMinusMargin, heightForReference)];
        gitReference.numberOfLines = 0;
        gitReference.font = [UIFont systemFontOfSize:15];
        gitReference.text = reference;
        [scrollView addSubview:gitReference];
        
        top += (heightForReference + margin * 2);
    }
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, top);
    
}


- (NSArray *)gitCommands {
    
    return @[@{bill: @"git status", Reference: @": shows changed files"},
             @{bill: @"git diff", Reference: @": shows actual changes"},
             @{bill: @"git add .", Reference: @": adds changed files to the commit"},
             @{bill: @"git commit -m \"notes\"", Reference: @": commits the changes"},
             @{bill: @"git push origin _branch_", Reference: @": pushes commits to branch named _branch_"},
             @{bill: @"git log", Reference: @": displays progress log"},
             @{bill: @"git comment --amend", Reference: @": re-enter last commit message"}
             ];
    
}

- (CGFloat)heightOfReferenceString:(NSString *)reference {
    
    CGRect bounding = [reference boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, 0)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                              context:nil];
    
    return bounding.size.height;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
