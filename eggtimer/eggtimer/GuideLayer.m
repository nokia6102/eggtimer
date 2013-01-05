//
//  GuideLayer.m
//  eggtimer
//
//  Created by Cheng Leon on 13/1/5.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "GuideLayer.h"
#import "EggTimerLayer.h"


@implementation GuideLayer


+(CCScene *) scene;
{
  CCScene *scene=[CCScene node];
  GuideLayer *layer=[GuideLayer node];
  [scene addChild:layer];
  return scene;
}


-(id)init
{
  if((self=[super init]))
  {
     CGSize size=[CCDirector sharedDirector].winSize;
     CGSize screenSize=size;
    
    bg=[CCSprite spriteWithFile:@"guide.png"];
    [self addChild:bg z:0 tag:1];
    bg.position=CGPointMake(screenSize.width/2, screenSize.height/2);
    
    howplayimage = [CCSprite spriteWithFile:@"back.png"];
    howplayitem = [CCMenuItemImage itemFromNormalSprite:howplayimage selectedSprite:nil target:self selector:@selector(returnMain:)];      //showMessage 一定要有 (id) sender 收
    howplayitem.tag = 23;
    howplayitem.position=ccp(size.width/2+80, size.height/2-182);    
    mainMenu =[CCMenu menuWithItems:howplayitem,nil];
    mainMenu.position=CGPointZero;
    [self addChild:mainMenu z:23 tag:23];
    

    
  }
  return self;
}

-(void)returnMain:(id)sender
{
  [[CCDirector sharedDirector] replaceScene:[EggTimerLayer scene]];
}
@end
