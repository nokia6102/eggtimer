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

//-(void) registerWithTouchDispatcher
//{
//  [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:1 swallowsTouches:YES];
//  [super registerWithTouchDispatcher];
//}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
//    self.isTouchEnabled = YES;
// 
//    bg=[CCSprite spriteWithFile:@"bg.png"];
//    [self addChild:bg z:0 tag:1];
//    CGSize screenSize=[CCDirector sharedDirector].winSize;
//    
//    bg.position=CGPointMake(screenSize.width/2, screenSize.height/2);
//
//
//    
//    egg=[CCSprite spriteWithFile:@"egg.png"];
//    [self addChild:egg z:1 tag:2];
//
//    egg.position=CGPointMake(screenSize.width/2, screenSize.height/2-50);
    
      labelf = [ [ NSMutableArray alloc ] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];//宣告一陣列放入aa、bb字串    
//    
		// create and initialize a Label
    
    [self showNumber];
		
    
//    [self showMessage];
	}
	return self;
}

-(void)onEnter  
{  
  [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];  
  [super onEnter];  

}  

-(void)onExit  
{  
  [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];  
  [super onExit];  
}  

-(void)showMessage{   
  alert = [[UIAlertView alloc] initWithTitle:@" " message:@"    Connecting to App Store,                  please wait" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
  UIActivityIndicatorView *progress= [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(125, 100, 30, 30)];
  progress.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
  [alert addSubview:progress];
  [progress startAnimating];
  [alert show];
  [alert release];
}


-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
  startlocation = [self convertTouchToNodeSpace:touch];
  return YES;
}
-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
//  CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
//  NSLog(@"%f  ,%f",touchLocation.x,touchLocation.y);
}
-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
  CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
  diffx=touchLocation.x-startlocation.x;
  if (diffx>0) {
     [self leftrotate ];
     CCLOG(@"%f ",diffx);
     [self removeChild:label cleanup:YES];
     [self removeChild:label1 cleanup:YES];
     [self removeChild:label2 cleanup:YES];
     [self removeChild:label_1 cleanup:YES];
     [self removeChild:label_2 cleanup:YES];
    [self showNumber];
  }
  
  if (diffx <0){
    [self rightrotate ];
    CCLOG(@"%f ",diffx);
    [self removeChild:label cleanup:YES];
    [self removeChild:label1 cleanup:YES];
    [self removeChild:label2 cleanup:YES];
    [self removeChild:label_1 cleanup:YES];
    [self removeChild:label_2 cleanup:YES];
    [self showNumber];
    }
    
  
//  NSLog(@"%f  ",touchLocation.x-startlocation.x);
}

//-(void)ccTouchesBegan:(NSSet *)touch withEvent:(UIEvent *)event {
//  UITouch *myTouch = [touch anyObject];
//  CGPoint startlocation = [myTouch locationInView:[myTouch view]];
//  //startlocation = [[CCDirector sharedDirector] convertToGL:startlocation];
//}
//
//-(void)ccTouchesMoved:(NSSet *)touch withEvent:(UIEvent *)event
//{
//
//}
//-(void)ccTouchesEnded:(NSSet *)touch withEvent:(UIEvent *)event
//{
//  UITouch *myTouch = [touch anyObject];
//  CGPoint endlocation = [myTouch locationInView:[myTouch view]];
//  // endlocation = [[CCDirector sharedDirector] convertToGL:endlocation];
//  if ( endlocation.x - startlocation.x ) 
//    NSLog(@"+");
//  else
//    NSLog(@"-"); 
//}




// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc" 
	[super dealloc];
}

-(void)leftrotate{
  NSString *tempString;
  tempString=[labelf objectAtIndex: 0];
  for (int i=0;i<=8;i++) [labelf replaceObjectAtIndex:i withObject:[labelf objectAtIndex: i+1]];  
  [labelf replaceObjectAtIndex:9 withObject:tempString];
}

-(void)rightrotate{
//  NSString *tempString;
//  
//  tempString=[labelf objectAtIndex: 9];
//  for (int i=1;i<=9;i++) [labelf replaceObjectAtIndex:i withObject:[labelf objectAtIndex: i-1]];  
//  [labelf replaceObjectAtIndex:0 withObject:tempString]; 
  
}

-(void)showNumber
{
  
  
//  CGSize s = [CCDirector sharedDirector].winSize;
//  glLineWidth( 5.0f );
//  glEnable(GL_LINE_SMOOTH);
//  glColor4ub(255,0,0,255);
//  ccDrawLine( ccp(0, s.height), ccp(s.width, 0) );
  
  
  
  bg=[CCSprite spriteWithFile:@"bg.png"];
  [self addChild:bg z:0 tag:1];
  CGSize screenSize=[CCDirector sharedDirector].winSize;
  
  bg.position=CGPointMake(screenSize.width/2, screenSize.height/2);
  
  
  
  egg=[CCSprite spriteWithFile:@"egg.png"];
  [self addChild:egg z:1 tag:2];
  
  egg.position=CGPointMake(screenSize.width/2, screenSize.height/2-50);
  
  
  label = [CCLabelTTF labelWithString:[labelf objectAtIndex: 0] fontName:@"Marker Felt" fontSize:32];
  label1 = [CCLabelTTF labelWithString:[labelf objectAtIndex: 1] fontName:@"Marker Felt" fontSize:32];
  label2 = [CCLabelTTF labelWithString:[labelf objectAtIndex: 2] fontName:@"Marker Felt" fontSize:32];
  label_1 = [CCLabelTTF labelWithString:[labelf objectAtIndex: 9] fontName:@"Marker Felt" fontSize:32];
  label_2 = [CCLabelTTF labelWithString:[labelf objectAtIndex: 8] fontName:@"Marker Felt" fontSize:32];
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

@end
