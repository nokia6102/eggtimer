//
//  EggTimerLayer.m
//  eggtimer
//
//  Created by Cheng Leon on 12/8/4.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//


// Import the interfaces
#import "EggTimerLayer.h"
#import "CCShake.h"
#import "SimpleAudioEngine.h"
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
    count=0;
      labelf = [ [ NSMutableArray alloc ] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];//宣告一陣列放入aa、bb字串        
    
//#if defined (DEBUG)
    [[CCDirector sharedDirector] setDisplayFPS:NO];
//#endif
    
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

-(void)showMessage:(id)sender;
{   
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
  diffy=touchLocation.y-startlocation.y;

  if (diffx<-10) {
     [self leftrotate ];
     CCLOG(@"diffx:%f ",diffx);
    [self cleanNumber];
    [self showNumber];
  }
  
  if (diffx>10){
    [self rightrotate ];
    CCLOG(@"diffx:%f ",diffx);
    [self cleanNumber];
    [self showNumber];
    }
    
  if (diffy<-30) {
    [self settimer];
    CCLOG(@"diffy:%f ",diffy);
    [self cleanNumber];
    [self showNumber];
  }
  
  if (diffy>30){
    [self stoptimer ];
    CCLOG(@"diffy:%f ",diffy);
    [self cleanNumber];
    [self showNumber];
  }
  
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

-(void)leftrotate{
     [[SimpleAudioEngine sharedEngine] playEffect:@"turn.mp3"];
  NSString *tempString;
  tempString=[labelf objectAtIndex: 0];
  for (int i=0;i<=8;i++) [labelf replaceObjectAtIndex:i withObject:[labelf objectAtIndex: i+1]];  
  [labelf replaceObjectAtIndex:9 withObject:tempString];
}

-(void)rightrotate{
     [[SimpleAudioEngine sharedEngine] playEffect:@"turn.mp3"];
  NSString *tempString;
  tempString=[labelf objectAtIndex: 9];
  for (int i=9;i>=1;i--) [labelf replaceObjectAtIndex:i withObject:[labelf objectAtIndex: i-1]];  
  [labelf replaceObjectAtIndex:0 withObject:tempString]; 
}

-(void)cleanNumber
{
  [self removeChild:label cleanup:YES];
  [self removeChild:label1 cleanup:YES];
  [self removeChild:label2 cleanup:YES];
  [self removeChild:label_1 cleanup:YES];
  [self removeChild:label_2 cleanup:YES];
  [self removeChild:label_siler cleanup:YES];
  
  [self removeChild:leftrightd cleanup:YES];
  [self removeChild:updownd cleanup:YES];
 
  [self removeChild:mainMenu cleanup:YES];
}

-(void)showNumber
{
   CGSize screenSize=[CCDirector sharedDirector].winSize;
  bg=[CCSprite spriteWithFile:@"bg.png"];
  [self addChild:bg z:0 tag:1];
  bg.position=CGPointMake(screenSize.width/2, screenSize.height/2);
  
  egg=[CCSprite spriteWithFile:@"egg2.png"];
  
  [self addChild:egg z:1 tag:2];
  egg.position=CGPointMake(screenSize.width/2, screenSize.height/2-50);  
  
  leftrightd=[CCSprite spriteWithFile:@"leftright-d.png"];
  [self addChild:leftrightd z:11 tag:11];
  leftrightd.position=CGPointMake(screenSize.width/2, screenSize.height/2+132);
    
  updownd=[CCSprite spriteWithFile:@"updownd.png"];
  [self addChild:updownd z:12 tag:12];
  updownd.position=CGPointMake(screenSize.width/2, screenSize.height/2+100);
  
  
  label = [CCLabelTTF labelWithString:[labelf objectAtIndex: 0] fontName:@"Marker Felt" fontSize:32];
  label1 = [CCLabelTTF labelWithString:[labelf objectAtIndex: 1] fontName:@"Marker Felt" fontSize:32];
  label2 = [CCLabelTTF labelWithString:[labelf objectAtIndex: 2] fontName:@"Marker Felt" fontSize:32];
  label_1 = [CCLabelTTF labelWithString:[labelf objectAtIndex: 9] fontName:@"Marker Felt" fontSize:32];
  label_2 = [CCLabelTTF labelWithString:[labelf objectAtIndex: 8] fontName:@"Marker Felt" fontSize:32]; 
  label_siler = [CCLabelTTF labelWithString:@"slide" fontName:@"Marker Felt" fontSize:32];

  
  label.color = ccc3(60,60,60);
  label1.color = ccc3(60,60,60);
  label2.color = ccc3(60,60,60);
  label_1.color = ccc3(60,60,60);
  label_2.color = ccc3(60,60,60);
  label_siler.color = ccc3(255,255,255);
  
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

  label_siler.position =  ccp( size.width /2 , size.height/2 +132);		
  [self addChild: label_siler z:5 tag:6];
  

 
  
  howplayimage = [CCSprite spriteWithFile:@"howplay.png"];
  howplayitem = [CCMenuItemImage itemFromNormalSprite:howplayimage selectedSprite:nil target:self selector:@selector(showMessage:)];      //showMessage 一定要有 (id) sender 收
  howplayitem.tag = 23;
  howplayitem.position=ccp(size.width/2+80, size.height/2-182);    
  mainMenu =[CCMenu menuWithItems:howplayitem,nil];
  mainMenu.position=CGPointZero;
  [self addChild:mainMenu z:23 tag:23];


  }

-(void)settimer
{
// [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(step:) userInfo:nil repeats:YES]; 
//  [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"clock1.mp3" loop:YES];
//  [egg runAction:[CCShake actionWithDuration:1.05f amplitude:ccp(16,16) dampening:false shakes:1]];
  [self schedule:@selector(step:) interval:1];
  
}

-(void)stoptimer
{
//  [self unscheduleAllSelectors];
  [self unschedule:@selector(step:)];
  CCLOG(@"stop unschedule");
  count=0;
    
// [egg runAction:[CCShake actionWithDuration:1.05f amplitude:ccp(16,16) dampening:false shakes:1]];
 
}

-(void)et
{
  CCLOG(@"empty ");  
}

-(void) step:(ccTime) dt
{      
  
  count++;
  
  if (count %2==0)
    [egg setTexture:[[CCTextureCache sharedTextureCache] addImage:@"egg2.png"]];
  else
    [egg setTexture:[[CCTextureCache sharedTextureCache] addImage:@"egg2-red.png"]];
  
  if (count!=60) [[SimpleAudioEngine sharedEngine] playEffect:@"clock1.mp3"];
  if (count==60) 
  {
    [[SimpleAudioEngine sharedEngine] playEffect:@"clock2.mp3"];
    [self rightrotate ];
    CCLOG(@"diffx:%f ",diffx);
    [self cleanNumber];
    [self showNumber];
    if([[labelf objectAtIndex: 0] intValue ]==0) 
    {
      [[SimpleAudioEngine sharedEngine] playEffect:@"cuckoo4.wav"];
      AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);  //Virate sound

     [egg runAction:[CCShake actionWithDuration:.05f amplitude:ccp(16,16) dampening:false shakes:10]];
     [egg runAction:[CCShake actionWithDuration:1.05f amplitude:ccp(16,16) dampening:false shakes:5]];
     [egg runAction:[CCShake actionWithDuration:1.05f amplitude:ccp(16,16) dampening:false shakes:10]];
      [self stoptimer];
    }
      count=0;
  }
  CCLOG(@"runing step ,count %d",count);
}



#ifdef _FOR_DEBUG_
-(BOOL) respondsToSelector : (SEL)aSelector {
  printf("SELECTOR: %s\n", [NSStringFromSelector(aSelector) UTF8String]);
  return [super respondsToSelector:aSelector];
}
#endif


@end
