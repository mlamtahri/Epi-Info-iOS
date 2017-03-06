//
//  YesNo.m
//  EpiInfo
//
//  Created by John Copeland on 11/27/13.
//

#import "YesNo.h"
#import "EnterDataView.h"

@implementation YesNo
@synthesize columnName = _columnName;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 300, 180)];
    if (self) {
        // Initialization code
        //        [self setBackgroundColor:[UIColor colorWithRed:3/255.0 green:36/255.0 blue:77/255.0 alpha:1.0]];
        [self setBackgroundColor:[UIColor clearColor]];
        [self.layer setCornerRadius:4.0];
        picked = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 40, 10)];
        //        [self addSubview:picked];
        picker = [[UIPickerView alloc] initWithFrame:CGRectMake(10, 10, 280, 160)];
        [picker setDelegate:self];
        [picker setDataSource:self];
        [picker setShowsSelectionIndicator:YES];
        [picker setBackgroundColor:[UIColor clearColor]];
        [self addSubview:picker];
    }
    return self;
}

- (NSString *)picked
{
    if ([picked.text length] == 0)
        return @"NULL";
    return picked.text;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 3;
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *tView = (UILabel *)view;
    if (!view)
    {
        tView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    }
    [tView setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0]];
    [tView setTextAlignment:NSTextAlignmentCenter];
    [tView setTextColor:[UIColor blackColor]];
    [tView setText:[NSString stringWithFormat:@"%@", [[NSArray arrayWithObjects:@"", @"Yes", @"No", nil] objectAtIndex:row]]];
    
    return tView;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [picked setText:[NSString stringWithFormat:@"%@", [[NSArray arrayWithObjects:@"", @"1", @"0", nil] objectAtIndex:row]]];
    [(EnterDataView *)[[self superview] superview] fieldResignedFirstResponder:self];
    
}

- (void)reset
{
    [picked setText:nil];
    [picker selectRow:0 inComponent:0 animated:YES];
    [self setIsEnabled:YES];
}

- (void)setYesNo:(NSInteger)yesNo
{
    if (yesNo < 0 || yesNo > 1)
        return;
    if (yesNo == 1)
        [picker selectRow:1 inComponent:0 animated:NO];
    else
        [picker selectRow:2 inComponent:0 animated:NO];
    [picked setText:[NSString stringWithFormat:@"%d", (int)yesNo]];
}
- (void)setFormFieldValue:(NSString *)formFieldValue
{
    if ([formFieldValue isEqualToString:@"(null)"])
        return;
    
    [self setYesNo:[formFieldValue integerValue]];
}

- (NSString *)epiInfoControlValue
{
    return [self picked];
}

- (void)assignValue:(NSString *)value
{
    if ([value isEqualToString:@""] || [value isEqualToString:@"NULL"])
    {
        [self reset];
        return;
    }
    if ([value isEqualToString:@"Yes"] || [value isEqualToString:@"1"])
        [self setYesNo:1];
    else
        [self setYesNo:0];
}

- (void)setIsEnabled:(BOOL)isEnabled
{
    [picker setUserInteractionEnabled:isEnabled];
    [self setAlpha:0.5 + 0.5 * (int)isEnabled];
}

- (void)selfFocus
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:0.1f];
        dispatch_async(dispatch_get_main_queue(), ^{
            float yForBottom = [(EnterDataView *)[[self superview] superview] contentSize].height - [(EnterDataView *)[[self superview] superview] bounds].size.height;
            float selfY = self.frame.origin.y - 80.0f;
            
            CGPoint pt = CGPointMake(0.0f, selfY);
            if (selfY > yForBottom)
                pt = CGPointMake(0.0f, yForBottom);
            
            [(EnterDataView *)[[self superview] superview] setContentOffset:pt animated:YES];
        });
    });
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
