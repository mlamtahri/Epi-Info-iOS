//
//  EpiInfoViewForRounding.m
//  EpiInfo
//
//  Created by John Copeland on 9/16/14.
//  Copyright (c) 2014 John Copeland. All rights reserved.
//

#import "EpiInfoViewForRounding.h"

@implementation EpiInfoViewForRounding

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame AndIsSquareLeft:(BOOL)isSquareLeft AndIsSquareRight:(BOOL)isSquareRight
{
    self = [self initWithFrame:frame];
    if (self)
    {
        top = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height / 2.0)];
        [self addSubview:top];
        if (isSquareLeft)
        {
            left = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 2.0, frame.size.height)];
            [self addSubview:left];
        }
        if (isSquareRight)
        {
            right = [[UIView alloc] initWithFrame:CGRectMake(frame.size.width / 2.0, 0, frame.size.width / 2.0, frame.size.height)];
            [self addSubview:right];
        }
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [top setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height / 2.0)];
    if (left)
        [left setFrame:CGRectMake(0, 0, frame.size.width / 2.0, frame.size.height)];
    if (right)
        [right setFrame:CGRectMake(frame.size.width / 2.0, 0, frame.size.width / 2.0, frame.size.height)];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    [top setBackgroundColor:backgroundColor];
    if (left)
        [left setBackgroundColor:backgroundColor];
    if (right)
        [right setBackgroundColor:backgroundColor];
}

- (void)removeLeft
{
    if (left)
        [left removeFromSuperview];
}
- (void)removeRight
{
    if (right)
        [right removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
