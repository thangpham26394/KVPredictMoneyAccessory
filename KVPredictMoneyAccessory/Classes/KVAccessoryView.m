//
//  KVAccessoryView.m
//  AcessoryViewCustom
//
//  Created by citigo on 6/17/17.
//  Copyright © 2017 citigo. All rights reserved.
//

#import "KVAccessoryView.h"
#import "KVMoneyCell.h"

static const double MINWIDTH = 52;
static const double PADDING = 20;

@implementation KVAccessoryView

- (instancetype)init {
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] objectAtIndex:0];
    }
    UINib *cellNib = [UINib nibWithNibName:@"KVMoneyCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"KVMoneyCell"];
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 40)];
    self.backgroundColor = [UIColor clearColor];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.layer.cornerRadius = self.collectionView.frame.size.height/2 - 1 ;
    self.collectionView.layer.masksToBounds = YES;
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:self.bounds];
    toolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    toolbar.translucent = YES;
    [self insertSubview:toolbar atIndex:0];
    self.lastAnimateTime = 0;
    self.fullOptionValues = [[NSMutableArray alloc] init];
    return self;
}


- (IBAction)doneButtonTapped:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didFinishEditting)]) {
        [self.delegate didFinishEditting];
    }
}



#pragma mark collectionView delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.potentialValues.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KVMoneyCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"KVMoneyCell" forIndexPath:indexPath];
    
    cell.label.text = [[self priceFormatter] stringFromNumber:self.potentialValues[indexPath.row]];
    if (self.shouldAnimate) {
        CGFloat currentXValue = cell.frame.origin.x;
        
        CGRect frame = cell.frame;
        double startPlace = 500;
        for (int i = 0 ; i < self.fullOptionValues.count; i ++) {
            NSArray *arrayValue = self.fullOptionValues[i];
            if (arrayValue[0] == self.potentialValues[indexPath.row]) {
                
                //Chỉ gán lại vị trí start animation của cell nếu giá trị tương ứng trong fullOptionValues đang khác -1
                if (![arrayValue[1]  isEqual: @(-1)]) {
                    startPlace = [arrayValue[1] doubleValue];
                }

                NSArray *replaceObject = @[arrayValue[0],@(currentXValue)];
                [self.fullOptionValues replaceObjectAtIndex:i withObject:replaceObject];
            }
        }

        frame.origin.x = startPlace;
        cell.frame = frame;
        
        double delayDefault = indexPath.row == 0? 0 : 0.1;
        double duration = self.lastAnimateTime == 0 ? 0.35 : [NSDate timeIntervalSinceReferenceDate] - self.lastAnimateTime;
        self.lastAnimateTime = [NSDate timeIntervalSinceReferenceDate];
        BOOL shouldStopAnimate = duration > 0.35;

        [UIView animateWithDuration:shouldStopAnimate ? 0 : 0.35 delay: shouldStopAnimate ? 0 :delayDefault + indexPath.row * 0.05 options:UIViewAnimationOptionTransitionNone animations:^{
            CGRect frame = cell.frame;
            frame.origin.x = currentXValue;
            cell.frame = frame;
        } completion:nil];
        
        if (shouldStopAnimate) {
            self.shouldAnimate = NO;
        }
    }
    
    if (indexPath.row == self.potentialValues.count - 1) {
        self.shouldAnimate = NO;
    }

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize labelSize = [[[self priceFormatter] stringFromNumber:self.potentialValues[indexPath.row]] sizeWithAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:17]}];
    
    if (labelSize.width < MINWIDTH ) {
        return CGSizeMake(MINWIDTH + PADDING, 30);
    }
    return CGSizeMake(labelSize.width + PADDING, 30);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0 , 10, 0, 10);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelecteValue:)]) {
        [self.delegate didSelecteValue:[self.potentialValues[indexPath.row] doubleValue]];
    }
}

- (NSNumberFormatter *)priceFormatter {
    static NSNumberFormatter *priceFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        priceFormatter = [[NSNumberFormatter alloc] init];
        priceFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        priceFormatter.roundingMode = NSNumberFormatterRoundHalfUp;
        priceFormatter.maximumFractionDigits = 2;
        priceFormatter.decimalSeparator = @".";
        priceFormatter.groupingSeparator = @",";
    });
    return priceFormatter;
}

@end
