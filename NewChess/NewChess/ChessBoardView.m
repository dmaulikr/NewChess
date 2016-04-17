//
//  ChessBoardView.m
//  NewChess
//
//  Created by Karthick Ramesh on 23/02/16.
//  Copyright © 2016 Karthick Ramesh. All rights reserved.
//
//Objective of the application is to provide the players with options to play chess with 5 different options.
//Option 1: With all chess pieces at normal scenario
//Option 2: With 2 rooks, 1 queen and 8 pawns in their normal positions. i.e excluding 2 bishops and 2 horses. The chess players use to practice for end games like this.
//Option 3: With 2 rooks and 8 pawns in their normal positions. i.e exluding 2 bishops, 2 horses and 1 queen. The reason is same as above.
//Option 4: With 2 bishops in the left and 2 horses in the right position. The purpose of this play is to get the chess player to think about different combinations rather than usual start positions.
//Option 5: Customizing your own openings and save it. So that the user can try it with their friends.


#import "ChessBoardView.h"

@implementation ChessBoardView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self){
        //ChessBoardView is added in to the view of the application
        [[[NSBundle mainBundle] loadNibNamed:@"ChessBoardView" owner:self options:nil] objectAtIndex:0];
        [self addSubview:self.view];
        //The array contains the 8 x 8 buttons with a8 -> h8 in top and a1 -> h8.
        [self constructInitialArrayWithButtons];
        
        normalChessPiecesImageArray = [NSArray arrayWithObjects:kNormalWhiteElephant, kNormalWhiteHorse, kNormalWhiteBishop, kNormalWhiteKing, kNormalWhiteQueen, kNormalWhitePawn, kNormalBlackElephant, kNormalBlackHorse, kNormalWhiteBishop, kNormalBlackKing, kNormalBlackQueen, kNormalBlackPawn, kNormalWhiteSquare, kNormalBlackSquare, nil];
        woodenChessPiecesImageArray = [NSArray arrayWithObjects:kWoodenWhiteElephant, kWoodenWhiteHorse, kWoodenWhiteBishop, kWoodenWhiteKing, kWoodenWhiteQueen, kWoodenWhitePawn, kWoodenBlackElephant, kWoodenBlackHorse, kWoodenBlackBishop, kWoodenBlackKing, kWoodenBlackQueen, kWoodenBlackPawn, kWoodenWhiteSquare, kWoodenBlackSquare, nil];
        
        //the variable denotes the button the user has tapped in the chess board. the buttons are assigned the tags with 88 to 00 i.e from top left to top right followed by the rest of the rows.
        previousSelectedIndex = -1;
    }
    return self;
}

//The array contains the 8 x 8 buttons with a8 -> h8 in top and a1 -> h8.
//TO DO: Should update the method in such a way that if the player is playing black it should change accordingly
-(void) constructInitialArrayWithButtons
{
    NSArray *rowArray1 = [NSArray arrayWithObjects:self.a8,self.b8, self.c8,self.d8,self.e8,self.f8,self.g8,self.h8, nil];
    NSArray *rowArray2 = [NSArray arrayWithObjects:self.a7,self.b7, self.c7,self.d7,self.e7,self.f7,self.g7,self.h7, nil];
    NSArray *rowArray3 = [NSArray arrayWithObjects:self.a6,self.b6, self.c6,self.d6,self.e6,self.f6,self.g6,self.h6, nil];
    NSArray *rowArray4 = [NSArray arrayWithObjects:self.a5,self.b5, self.c5,self.d5,self.e5,self.f5,self.g5,self.h5, nil];
    NSArray *rowArray5 = [NSArray arrayWithObjects:self.a4,self.b4, self.c4,self.d4,self.e4,self.f4,self.g4,self.h4, nil];
    NSArray *rowArray6 = [NSArray arrayWithObjects:self.a3,self.b3, self.c3,self.d3,self.e3,self.f3,self.g3,self.h3, nil];
    NSArray *rowArray7 = [NSArray arrayWithObjects:self.a2,self.b2, self.c2,self.d2,self.e2,self.f2,self.g2,self.h2, nil];
    NSArray *rowArray8 = [NSArray arrayWithObjects:self.a1,self.b1, self.c1,self.d1,self.e1,self.f1,self.g1,self.h1, nil];
    NSLog(@"desc is %@",self.a7.description);
    self.chessBoardButtonArray = [NSArray arrayWithObjects:rowArray1,rowArray2,rowArray3,rowArray4,rowArray5,rowArray6,rowArray7,rowArray8, nil];
}

-(IBAction)buttonTapped:(id)sender
{
    UIButton *userTappedButton = (UIButton *)sender;
    NSString *tappedButtonImageName = [userTappedButton accessibilityIdentifier];
    if(tappedButtonImageName == nil){
        if(previousSelectedIndex != -1){
            int iIndex = previousSelectedIndex / 10;
            int jIndex = previousSelectedIndex - (iIndex * 10);
            NSLog(@"i and j is %d,%d",iIndex,jIndex);
            UIButton *previouslySelectedButton = (UIButton *)[[self.chessBoardButtonArray objectAtIndex:iIndex] objectAtIndex:jIndex];
            
            NSString *previouslyTappedButtonImageName = [previouslySelectedButton accessibilityIdentifier];
            previouslyTappedButtonImageName = [previouslyTappedButtonImageName substringFromIndex:1];
            [previouslySelectedButton setBackgroundImage:[UIImage imageNamed:previouslyTappedButtonImageName] forState:UIControlStateNormal];
            
            NSLog(@"desc2 is %@",previouslySelectedButton.description);
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:previouslySelectedButton.frame];
            imageView.image = previouslySelectedButton.currentBackgroundImage;
            [self.view addSubview:imageView];
            [self.view bringSubviewToFront:imageView];
            
            [previouslySelectedButton setBackgroundImage:nil forState:UIControlStateNormal];
            [previouslySelectedButton setAccessibilityIdentifier:nil];
            previousSelectedIndex = -1;
            
            [UIView animateWithDuration:0.25 animations:^{
                CGRect frame = imageView.frame;
                frame.origin.x = userTappedButton.frame.origin.x;
                frame.origin.y = userTappedButton.frame.origin.y;
                imageView.frame = frame;
            }completion:^(BOOL finished) {
                [imageView removeFromSuperview];
                [userTappedButton setBackgroundImage:[UIImage imageNamed:previouslyTappedButtonImageName] forState:UIControlStateNormal];
                [userTappedButton setAccessibilityIdentifier:previouslyTappedButtonImageName];

            }];
        }
    }
    else if([tappedButtonImageName containsString:@"F"]){
        tappedButtonImageName = [tappedButtonImageName substringFromIndex:1];
        [userTappedButton setBackgroundImage:[UIImage imageNamed:tappedButtonImageName] forState:UIControlStateNormal];
        [userTappedButton setAccessibilityIdentifier:tappedButtonImageName];
        previousSelectedIndex = -1;
    }
    else{
        [userTappedButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"F%@",tappedButtonImageName]] forState:UIControlStateNormal];
        [userTappedButton setAccessibilityIdentifier:[NSString stringWithFormat:@"F%@",tappedButtonImageName]];
        previousSelectedIndex = (int)userTappedButton.tag;
        NSLog(@"selectedTag is %d",previousSelectedIndex);
    }
}

//In nornal chess game the pieces are arranged with rook, horse, bishop, queen, king, bishop, horse, rook.
//Here abbreviations are as follows
//W - White
//B - Black
//R - Rook
//N - Knight
//B - Bishop
//Q - Queen
//K - King
//P - Pawn
//Empty String indicates that places are empty
-(NSArray *) returnInitialArrayOfChessGame{
    NSArray *rowArray1 = [NSArray arrayWithObjects:kWhiteElephant, kWhiteHorse, kWhiteBishop, kWhiteKing, kWhiteQueen, kWhiteBishop, kWhiteHorse, kWhiteElephant, nil];
    NSArray *rowArray2 = [NSArray arrayWithObjects:kWhitePawn, kWhitePawn, kWhitePawn, kWhitePawn, kWhitePawn, kWhitePawn, kWhitePawn, kWhitePawn, nil];
    NSArray *rowArray3 = [NSArray arrayWithObjects:kEmptySquare, kEmptySquare, kEmptySquare, kEmptySquare, kEmptySquare, kEmptySquare, kEmptySquare, kEmptySquare, nil];
    NSArray *rowArray4 = [NSArray arrayWithObjects:kEmptySquare, kEmptySquare, kEmptySquare, kEmptySquare, kEmptySquare, kEmptySquare, kEmptySquare, kEmptySquare, nil];
    NSArray *rowArray5 = [NSArray arrayWithObjects:kEmptySquare, kEmptySquare, kEmptySquare, kEmptySquare, kEmptySquare, kEmptySquare, kEmptySquare, kEmptySquare, nil];
    NSArray *rowArray6 = [NSArray arrayWithObjects:kEmptySquare, kEmptySquare, kEmptySquare, kEmptySquare, kEmptySquare, kEmptySquare, kEmptySquare, kEmptySquare, nil];
    NSArray *rowArray7 = [NSArray arrayWithObjects:kBlackPawn, kBlackPawn, kBlackPawn, kBlackPawn, kBlackPawn, kBlackPawn, kBlackPawn, kBlackPawn, nil];
    NSArray *rowArray8 = [NSArray arrayWithObjects:kBlackElephant, kBlackHorse, kBlackBishop, kBlackKing, kBlackQueen, kBlackBishop, kBlackHorse, kBlackElephant, nil];
    NSArray *completeArray;
    if(colorAssignedToPlayer == black) {
        completeArray = [NSArray arrayWithObjects:rowArray1,rowArray2,rowArray3,rowArray4,rowArray5,rowArray6,rowArray7,rowArray8, nil];
    }
    else if(colorAssignedToPlayer == white) {
        completeArray = [NSArray arrayWithObjects:rowArray8,rowArray7,rowArray6,rowArray5,rowArray4,rowArray3,rowArray2,rowArray1, nil];
    }
    return completeArray;
}

-(void) setInitialPiecesWithArray:(NSArray *)positionArray {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat deviceWidth = screenRect.size.width;
    
    //[self.view removeConstraints:self.view.constraints];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.view
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1.0
                                                      constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.view
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.view
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1.0
                                                      constant:self.frame.size.width]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.view
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1.0
                                                      constant:self.frame.size.height]];
    
    for(int i=0; i<8; i++){
        NSArray *boardButtonArray = [self.chessBoardButtonArray objectAtIndex:i];
        NSArray *chessPieceArray = [positionArray objectAtIndex:i];
        for(int j=0; j<8; j++){
            UIButton *boardButton = [boardButtonArray objectAtIndex:j];
            float buttonWidth = deviceWidth / 8;
            [self addConstraint:[NSLayoutConstraint constraintWithItem:boardButton
                                                             attribute:NSLayoutAttributeLeading
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeLeading
                                                            multiplier:1.0
                                                              constant:j * buttonWidth]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:boardButton
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1.0
                                                              constant:i * buttonWidth]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:self.view
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:1.0
                                                              constant:buttonWidth]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:self.view
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:1.0
                                                              constant:buttonWidth]];
            
            [boardButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
            boardButton.tag = (i * 10) + j;
            //NSLog(@"tag is %ld",(long)boardButton.tag);
            
            boardButton.layer.borderWidth = 1.0f;
            boardButton.layer.borderColor = [UIColor greenColor].CGColor;
            
            NSString *chessPiece = [chessPieceArray objectAtIndex:j];
            if(i % 2 == 0){
                if(j % 2 == 0){
                    [boardButton setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:[chessPiecesImageArray objectAtIndex:12]]]];
                }
                else{
                    [boardButton setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:[chessPiecesImageArray objectAtIndex:13]]]];
                }
            }
            else{
                if(j % 2 == 0){
                    [boardButton setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:[chessPiecesImageArray objectAtIndex:13]]]];
                }
                else{
                    [boardButton setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:[chessPiecesImageArray objectAtIndex:12]]]];
                }
            }
            
            if([chessPiece isEqualToString:kWhiteElephant]){
                [boardButton setBackgroundImage:[UIImage imageNamed:[chessPiecesImageArray objectAtIndex:0]] forState:UIControlStateNormal];
                [boardButton setAccessibilityIdentifier:[chessPiecesImageArray objectAtIndex:0]];
            }
            else if([chessPiece isEqualToString:kWhiteHorse]){
                [boardButton setBackgroundImage:[UIImage imageNamed:[chessPiecesImageArray objectAtIndex:1]] forState:UIControlStateNormal];
                [boardButton setAccessibilityIdentifier:[chessPiecesImageArray objectAtIndex:1]];
            }
            else if([chessPiece isEqualToString:kWhiteBishop]){
                [boardButton setBackgroundImage:[UIImage imageNamed:[chessPiecesImageArray objectAtIndex:2]] forState:UIControlStateNormal];
                [boardButton setAccessibilityIdentifier:[chessPiecesImageArray objectAtIndex:2]];
            }
            else if([chessPiece isEqualToString:kWhiteKing]){
                [boardButton setBackgroundImage:[UIImage imageNamed:[chessPiecesImageArray objectAtIndex:3]] forState:UIControlStateNormal];
                [boardButton setAccessibilityIdentifier:[chessPiecesImageArray objectAtIndex:3]];
            }
            else if([chessPiece isEqualToString:kWhiteQueen]){
                [boardButton setBackgroundImage:[UIImage imageNamed:[chessPiecesImageArray objectAtIndex:4]] forState:UIControlStateNormal];
                [boardButton setAccessibilityIdentifier:[chessPiecesImageArray objectAtIndex:4]];
            }
            else if([chessPiece isEqualToString:kWhitePawn]){
                [boardButton setBackgroundImage:[UIImage imageNamed:[chessPiecesImageArray objectAtIndex:5]] forState:UIControlStateNormal];
                [boardButton setAccessibilityIdentifier:[chessPiecesImageArray objectAtIndex:5]];
            }
            else if([chessPiece isEqualToString:kBlackElephant]){
                [boardButton setBackgroundImage:[UIImage imageNamed:[chessPiecesImageArray objectAtIndex:6]] forState:UIControlStateNormal];
                [boardButton setAccessibilityIdentifier:[chessPiecesImageArray objectAtIndex:6]];
            }
            else if([chessPiece isEqualToString:kBlackHorse]){
                [boardButton setBackgroundImage:[UIImage imageNamed:[chessPiecesImageArray objectAtIndex:7]] forState:UIControlStateNormal];
                [boardButton setAccessibilityIdentifier:[chessPiecesImageArray objectAtIndex:7]];
            }
            else if([chessPiece isEqualToString:kBlackBishop]){
                [boardButton setBackgroundImage:[UIImage imageNamed:[chessPiecesImageArray objectAtIndex:8]] forState:UIControlStateNormal];
                [boardButton setAccessibilityIdentifier:[chessPiecesImageArray objectAtIndex:8]];
            }
            else if([chessPiece isEqualToString:kBlackKing]){
                [boardButton setBackgroundImage:[UIImage imageNamed:[chessPiecesImageArray objectAtIndex:9]] forState:UIControlStateNormal];
                [boardButton setAccessibilityIdentifier:[chessPiecesImageArray objectAtIndex:9]];
            }
            else if([chessPiece isEqualToString:kBlackQueen]){
                [boardButton setBackgroundImage:[UIImage imageNamed:[chessPiecesImageArray objectAtIndex:10]] forState:UIControlStateNormal];
                [boardButton setAccessibilityIdentifier:[chessPiecesImageArray objectAtIndex:10]];
            }
            else if([chessPiece isEqualToString:kBlackPawn]){
                [boardButton setBackgroundImage:[UIImage imageNamed:[chessPiecesImageArray objectAtIndex:11]] forState:UIControlStateNormal];
                [boardButton setAccessibilityIdentifier:[chessPiecesImageArray objectAtIndex:11]];
            }
        }
    }
}

//colorAssgined: Indicates which color the player is going to take whether white or black. None is passed if the match is not live match.
//boardType    : Indicates the board type which the user has selected. Currently we support normal and wooden board type
-(void)setBoardParametersWithPlayerColor:(ColorAssignedToPlayer)colorAssigned withBoardType:(ChessBoardType)boardType
{
    colorAssignedToPlayer = colorAssigned;
    chessBoardType = boardType;
    if(chessBoardType == Normal){
        chessPiecesImageArray = normalChessPiecesImageArray;
    }
    else if(chessBoardType == Wooden){
        chessPiecesImageArray = woodenChessPiecesImageArray;
    }
}

@end
