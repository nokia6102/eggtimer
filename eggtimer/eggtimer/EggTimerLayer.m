//
//  EggTimerLayer.m
//  eggtimer
//
//  Created by Cheng Leon on 12/8/4.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//


// Import the interfaces
#import "EggTimerLayer.h"

// EggTimerLayer implementation
@implementation EggTimerLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	EggTimerLayer *layer = [EggTimerLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {

    bg=[CCSprite spriteWithFile:@"bg.png"];
    [self addChild:bg z:0 tag:1];
    CGSize screenSize=[CCDirector sharedDirector].winSize;
    
    bg.position=CGPointMake(screenSize.width/2, screenSize.height/2);

    
    egg=[CCSprite spriteWithFile:@"egg.png"];
    [self addChild:egg z:1 tag:2];

    egg.position=CGPointMake(screenSize.width/2, screenSize.height/2-50);
    
      NSArray *labelf = [ [ NSArray alloc ] initWithObjects:0,1,nil];//宣告一陣列放入aa、bb字串    
//    
		// create and initialize a Label
    
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"0" fontName:@"Marker Felt" fontSize:32];
    CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"1" fontName:@"Marker Felt" fontSize:32];
    CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"2" fontName:@"Marker Felt" fontSize:32];
    CCLabelTTF *label_1 = [CCLabelTTF labelWithString:@"9" fontName:@"Marker Felt" fontSize:32];
    CCLabelTTF *label_2 = [CCLabelTTF labelWithString:@"8" fontName:@"Marker Felt" fontSize:32];
    //     
    
    
//    
    
    label.color = ccc3(60,60,60);
    label1.color = ccc3(60,60,60);
    label2.color = ccc3(60,60,60);
    label_1.color = ccc3(60,60,60);
    label_2.color = ccc3(60,60,60);
    
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 -65);
	
    
		// add the label as a child to this Layer
		[self addChild: label z:2 tag:3];
   
    label1.position =  ccp( size.width /2+30 , size.height/2 -60);		
    [self addChild: label1 z:3 tag:4];
    
    label2.position =  ccp( size.width /2+60 , size.height/2 -55);		
    [self addChild: label2 z:4 tag:5];

    label_1.position =  ccp( size.width /2-30 , size.height/2 -60);		
    [self addChild: label_1 z:3 tag:4];
    
    label_2.position =  ccp( size.width /2-60 , size.height/2 -55);		
    [self addChild: label_2 z:4 tag:5];
    
    
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
