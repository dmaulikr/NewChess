//
//  ViewController.h
//  NewChess
//
//  Created by Karthick Ramesh on 21/02/16.
//  Copyright © 2016 Karthick Ramesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopBarView.h"
#import "ChessBoardView.h"

@interface ViewController : UIViewController

@property (nonatomic,strong) IBOutlet TopBarView *topBarView;
@property (nonatomic,strong) IBOutlet ChessBoardView *chessBoardView;
@property (nonatomic,strong) IBOutlet UIView *bottomView;

@end

