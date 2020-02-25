//
//  KVAccessoryView.h
//  AcessoryViewCustom
//
//  Created by citigo on 6/17/17.
//  Copyright © 2017 citigo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KVAccessoryViewDelegate <NSObject>

@optional
- (void)didSelecteValue:(double)value;
- (void)didFinishEditting;
@end


@interface KVAccessoryView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *potentialValues;
@property (strong, nonatomic) NSMutableArray *fullOptionValues;
@property (weak, nonatomic) id<KVAccessoryViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (assign, nonatomic) BOOL shouldAnimate;
@property (assign, nonatomic) NSTimeInterval lastAnimateTime;
-(instancetype)init;
@end
