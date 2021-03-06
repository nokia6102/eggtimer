//
//  EggTimerLayer.h
//  eggtimer
//
//  Created by Cheng Leon on 12/8/4.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// EggTimerLayer
@interface EggTimerLayer : CCLayer
{
  CCSprite *bg;
  CCSprite *egg;
  CCSprite *leftrightd,*updownd;
  
  NSMutableArray *labelf;
  CGPoint startlocation;
   UIAlertView *alert;
  double diffx,diffy;  
  CCLabelTTF *label;
  CCLabelTTF *label1;
  CCLabelTTF *label2;
  CCLabelTTF *label_1;
  CCLabelTTF *label_2;
  NSInteger count;
}

// returns a CCScene that contains the EggTimerLayer as the only child
+(CCScene *) scene;
-(void)showMessage;
-(void)leftrotate;
-(void)rightrotate;
-(void)showNumber;
-(void)cleanNumber;
-(void)settimer;
-(void)stoptimer;
-(void)et;
@end
