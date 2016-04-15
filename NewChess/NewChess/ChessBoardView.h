//
//  ChessBoardView.h
//  NewChess
//
//  Created by Karthick Ramesh on 23/02/16.
//  Copyright © 2016 Karthick Ramesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "enumConstants.h"
#import "StringConstants.h"

@interface ChessBoardView : UIView
{
    int previousSelectedIndex;
    NSArray *chessPiecesImageArray;
    NSArray *normalChessPiecesImageArray;
    NSArray *woodenChessPiecesImageArray;
    ColorAssignedToPlayer colorAssignedToPlayer;
    ChessBoardType chessBoardType;
    
}
@property (nonatomic, strong) UIButton *persistedUserTappedButton;
@property (nonatomic, strong) NSArray *chessBoardButtonArray;

@property (nonatomic, strong) IBOutlet UIView *view;
@property (nonatomic, strong) IBOutlet UIButton *a8;
@property (nonatomic, strong) IBOutlet UIButton *b8;
@property (nonatomic, strong) IBOutlet UIButton *c8;
@property (nonatomic, strong) IBOutlet UIButton *d8;
@property (nonatomic, strong) IBOutlet UIButton *e8;
@property (nonatomic, strong) IBOutlet UIButton *f8;
@property (nonatomic, strong) IBOutlet UIButton *g8;
@property (nonatomic, strong) IBOutlet UIButton *h8;

@property (nonatomic, strong) IBOutlet UIButton *a7;
@property (nonatomic, strong) IBOutlet UIButton *b7;
@property (nonatomic, strong) IBOutlet UIButton *c7;
@property (nonatomic, strong) IBOutlet UIButton *d7;
@property (nonatomic, strong) IBOutlet UIButton *e7;
@property (nonatomic, strong) IBOutlet UIButton *f7;
@property (nonatomic, strong) IBOutlet UIButton *g7;
@property (nonatomic, strong) IBOutlet UIButton *h7;

@property (nonatomic, strong) IBOutlet UIButton *a6;
@property (nonatomic, strong) IBOutlet UIButton *b6;
@property (nonatomic, strong) IBOutlet UIButton *c6;
@property (nonatomic, strong) IBOutlet UIButton *d6;
@property (nonatomic, strong) IBOutlet UIButton *e6;
@property (nonatomic, strong) IBOutlet UIButton *f6;
@property (nonatomic, strong) IBOutlet UIButton *g6;
@property (nonatomic, strong) IBOutlet UIButton *h6;

@property (nonatomic, strong) IBOutlet UIButton *a5;
@property (nonatomic, strong) IBOutlet UIButton *b5;
@property (nonatomic, strong) IBOutlet UIButton *c5;
@property (nonatomic, strong) IBOutlet UIButton *d5;
@property (nonatomic, strong) IBOutlet UIButton *e5;
@property (nonatomic, strong) IBOutlet UIButton *f5;
@property (nonatomic, strong) IBOutlet UIButton *g5;
@property (nonatomic, strong) IBOutlet UIButton *h5;

@property (nonatomic, strong) IBOutlet UIButton *a4;
@property (nonatomic, strong) IBOutlet UIButton *b4;
@property (nonatomic, strong) IBOutlet UIButton *c4;
@property (nonatomic, strong) IBOutlet UIButton *d4;
@property (nonatomic, strong) IBOutlet UIButton *e4;
@property (nonatomic, strong) IBOutlet UIButton *f4;
@property (nonatomic, strong) IBOutlet UIButton *g4;
@property (nonatomic, strong) IBOutlet UIButton *h4;

@property (nonatomic, strong) IBOutlet UIButton *a3;
@property (nonatomic, strong) IBOutlet UIButton *b3;
@property (nonatomic, strong) IBOutlet UIButton *c3;
@property (nonatomic, strong) IBOutlet UIButton *d3;
@property (nonatomic, strong) IBOutlet UIButton *e3;
@property (nonatomic, strong) IBOutlet UIButton *f3;
@property (nonatomic, strong) IBOutlet UIButton *g3;
@property (nonatomic, strong) IBOutlet UIButton *h3;

@property (nonatomic, strong) IBOutlet UIButton *a2;
@property (nonatomic, strong) IBOutlet UIButton *b2;
@property (nonatomic, strong) IBOutlet UIButton *c2;
@property (nonatomic, strong) IBOutlet UIButton *d2;
@property (nonatomic, strong) IBOutlet UIButton *e2;
@property (nonatomic, strong) IBOutlet UIButton *f2;
@property (nonatomic, strong) IBOutlet UIButton *g2;
@property (nonatomic, strong) IBOutlet UIButton *h2;

@property (nonatomic, strong) IBOutlet UIButton *a1;
@property (nonatomic, strong) IBOutlet UIButton *b1;
@property (nonatomic, strong) IBOutlet UIButton *c1;
@property (nonatomic, strong) IBOutlet UIButton *d1;
@property (nonatomic, strong) IBOutlet UIButton *e1;
@property (nonatomic, strong) IBOutlet UIButton *f1;
@property (nonatomic, strong) IBOutlet UIButton *g1;
@property (nonatomic, strong) IBOutlet UIButton *h1;

-(NSArray *) returnInitialArrayOfChessGame;
-(void) setInitialPiecesWithArray:(NSArray *)positionArray;
-(void) setBoardParametersWithPlayerColor:(ColorAssignedToPlayer)colorAssigned withBoardType:(ChessBoardType)boardType;

@end
