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
  NSMutableArray *labelf;
  
}

// returns a CCScene that contains the EggTimerLayer as the only child
+(CCScene *) scene;

@end
