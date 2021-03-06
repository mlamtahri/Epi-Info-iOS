//
//  LegalValues.h
//  EpiInfo
//
//  Created by John Copeland on 11/27/13.
//

#import <UIKit/UIKit.h>
#import "EpiInfoControlProtocol.h"

@interface LegalValues : UIView <UIPickerViewDelegate, UIPickerViewDataSource, EpiInfoControlProtocol>
{
    UILabel *picked;
//    UIPickerView *picker;
    NSMutableArray *listOfValues;
}
@property NSString *columnName;
@property BOOL isReadOnly;
@property UIPickerView *picker;
@property UITextField *textFieldToUpdate;
@property UIView *viewToAlertOfChanges;
@property NSNumber *selectedIndex;
- (void)setListOfValues:(NSMutableArray *)lov;
- (NSMutableArray *)listOfValues;
- (NSString *)picked;
- (void)setPicked:(NSString *)pkd;
- (id)initWithFrame:(CGRect)frame AndListOfValues:(NSMutableArray *)lov;
- (id)initWithFrame:(CGRect)frame AndListOfValues:(NSMutableArray *)lov AndTextFieldToUpdate:(UITextField *)tftu;
- (id)initWithFrame:(CGRect)frame AndListOfValues:(NSMutableArray *)lov NoFixedDimensions:(BOOL)nfd;
- (id)initWithFrame:(CGRect)frame AndListOfValues:(NSMutableArray *)lov AndTextFieldToUpdate:(UITextField *)tftu NoFixedDimensions:(BOOL)nfd;
-(void)reset;
-(void)setSelectedLegalValue:(NSString *)selectedLegalValue;
-(void)setFormFieldValue:(NSString *)formFieldValue;
@end
