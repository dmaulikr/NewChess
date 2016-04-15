//
//  TopBarView.m
//  NewChess
//
//  Created by Karthick Ramesh on 22/02/16.
//  Copyright © 2016 Karthick Ramesh. All rights reserved.
//

#import "TopBarView.h"

@implementation TopBarView

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
        [[[NSBundle mainBundle] loadNibNamed:@"TopBarView" owner:self options:nil] objectAtIndex:0];
        [self addSubview:self.view];
    }
    return self;
}

@end
