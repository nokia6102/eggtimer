//
//  GuideLayer.h
//  eggtimer
//
//  Created by Cheng Leon on 13/1/5.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GuideLayer : CCLayer {
  CCSprite *bg;
  CCMenu *mainMenu;
  CCSprite *howplayimage;
  CCMenuItem *howplayitem; 
}
-(void)returnMain:(id)sender;
+(CCScene *) scene;

@end
