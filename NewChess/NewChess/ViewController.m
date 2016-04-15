//
//  ViewController.m
//  NewChess
//
//  Created by Karthick Ramesh on 21/02/16.
//  Copyright © 2016 Karthick Ramesh. All rights reserved.
//

#import "ViewController.h"
#import "enumConstants.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    [self setAutoLayoutConstraints];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)setAutoLayoutConstraints {
    //Should review this logic
    //[self.view removeConstraints:self.view.constraints];
    
    //Top Bar View
    //[self.topBarView removeConstraints:self.topBarView.constraints];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.topBarView
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.topBarView
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.topBarView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:20.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.topBarView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:50.0]];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat deviceWidth = screenRect.size.width;
    NSLog(@"deviceWidth is %f",deviceWidth);
    
    //Chess Board View
    //[self.chessBoardView removeConstraints:self.chessBoardView.constraints];
    [self.chessBoardView setBoardParametersWithPlayerColor:black withBoardType:Wooden];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.chessBoardView
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.chessBoardView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.topBarView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.chessBoardView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:deviceWidth]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.chessBoardView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:deviceWidth]];
    
    [self.chessBoardView setInitialPiecesWithArray:[self.chessBoardView returnInitialArrayOfChessGame]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
