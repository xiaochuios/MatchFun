//
//  TopScoreLayer.m
//  MatchFun
//
//  Created by Apple on 8/12/13.
//  Copyright hku.cs.msccs 2013年. All rights reserved.
//
#import "TopScoreLayer.h"

#import "DataController.h"
#import "DotPlayingScnen.h"
#import "DotGameScene.h"

@implementation TopScoreLayer

+(CCScene *)scene{
    CCScene * scene = [CCScene node];
    
    TopScoreLayer * layer = [TopScoreLayer node];
    
    [scene addChild:layer];
    [layer startAnimationDisplay];
    return scene;
}

- (id)init
{
    self = [super initWithColor:ccc4(255,255,255, 255)];
    
    if (self) {
        CGSize s= [CCDirector sharedDirector].winSize;
        
        [self setAnchorPoint:ccp(0, 0)];
        m_logoLabel = [CCLabelTTF labelWithString:@"Score" fontName:@"Arial" fontSize:32];
        [m_logoLabel setColor:ccc3(0, 0, 0)];
        [m_logoLabel setPosition:ccp(s.width/2, s.height - 50)];
        [self addChild:m_logoLabel];
        
//        CCSprite * levelSprite
//        CCSprite * thisRound = [CCSprite spriteWithFile:@"thisRoundScore.png"];
//        [thisRound setPosition:ccp(s.width/2, s.height-130)];
//        [self addChild:thisRound];
        m_thisRound = [CCLabelTTF labelWithString:@"" fontName:@"Arial" fontSize:25];
        [m_thisRound setColor:ccc3(0, 0, 0)];
        [m_thisRound setPosition:ccp(s.width/2, s.height - 150)];
        [self addChild:m_thisRound];

        m_exittomain = [CCMenuItemImage itemWithNormalImage:@"TopExit.png"
                                              selectedImage:@"TopExit.png" target:self selector:@selector(exitToMainScnen)];
        
        m_imageItem = [CCMenuItemImage itemWithTarget:self selector:@selector(imageItemPressed)];
        
        CCMenu *menu = [CCMenu menuWithItems:m_exittomain,m_imageItem, nil];
       
        [menu setPosition:ccp(0, 0)];
        [m_imageItem setPosition:ccp(s.width/2, s.height/2+150)];
        [m_exittomain setPosition:ccp(s.width/2, s.height/2)];
        [self addChild:menu];
 
        
        [self setVisible:false];
        
        [self setTouchMode:kCCTouchesOneByOne];
        [self setTouchEnabled:false];
    }
    return self;
}
-(void) exitToMainScnen{
    DotGameScene * scene = [DotGameScene node];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionProgressOutIn transitionWithDuration:0.2 scene:scene]];
}
-(void)startAnimationDisplay:(NSInteger)score{
    
    m_imageButtonResponseType = true;//play again
    
    [self setVisible:true];
    CGSize s = [CCDirector sharedDirector].winSize;
    [self stopAllActions];
    [self setPosition:ccp(s.width, 0 )];
    
    CCMoveTo  * moveTo = [CCMoveTo actionWithDuration:0.2 position:ccp(0, 0)];
    
    CCCallBlock * callB = [CCCallBlock actionWithBlock:^{
        [self loadAnimation:score :[[DataController getSharedDataController] readPlayerDefaultProperty]];
    }];
    
    [self runAction:[CCSequence actionOne:moveTo two:callB]];
    
    
    CCTexture2D * texture = [[CCTextureCache sharedTextureCache] addImage:@"TopPlayingNow.png"];
    //    [m_imageItem setNormalImage:texture];
    CCSpriteFrame *frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(0, 0, texture.contentSize.width, texture.contentSize.height)];
    [m_imageItem setNormalSpriteFrame:frame];
    
    
    [self setTouchEnabled:true];
}


-(void)startAnimationDisplay{
    m_imageButtonResponseType = false;//return back
    [self setVisible:true];
    [self loadAnimation:0 :[[DataController getSharedDataController] readPlayerDefaultProperty]];
    
    CCTexture2D * texture = [[CCTextureCache sharedTextureCache] addImage:@"TopExit.png"];
//    [m_imageItem setNormalImage:texture];
    CCSpriteFrame *frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(0, 0, texture.contentSize.width, texture.contentSize.height)];
    [m_imageItem setNormalSpriteFrame:frame];
    
    [self setTouchEnabled:true];
}

-(void) imageItemPressed{
    
    if (m_imageButtonResponseType) {
        
        CCScene * playingScene = [DotPlayingScnen scene];
        
        [[CCDirector sharedDirector] replaceScene:[CCTransitionMoveInR transitionWithDuration:0.2 scene:playingScene]];
    }else{
        [[CCDirector sharedDirector]popScene];
    }
}


-(void) loadAnimation:(NSInteger)score :(NSArray*) array{
    
    NSInteger level = 1;
    NSInteger gold = 1;
    long int exp = 0;
 
    
    if (array) {
        NSNumber * l = [array objectAtIndex:0];
        NSNumber * g = [array objectAtIndex:1];
        NSNumber * e = [array objectAtIndex:2];
        
        level = l.integerValue;
        gold = g.integerValue;
        exp = e.longValue;
    }

    [m_thisRound setString:[NSString stringWithFormat:@"Winner:%d",score]];
    

    
//    if (m_imageButtonResponseType) {
//        [m_thisRound setString:[NSString stringWithFormat:@"%d",score]];
//    }else{
//        [m_thisRound setString:@"--"];
//    }
    

}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    
    if (!self.visible) {
        return false;
    }
    
    CGPoint touchLocation = [touch locationInView: [touch view]];
	touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
    
    m_touchStartLocation = [self convertToNodeSpace:touchLocation];
    
    m_canTriggerAction = true;
    
    return true;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    
    if (!m_canTriggerAction) {
        return;
    }
    
    CGPoint touchLocation = [touch locationInView: [touch view]];
	touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
    
    CGPoint local = [self convertToNodeSpace:touchLocation];
    
    CGFloat distance = ccpDistance(local, m_touchStartLocation);
    
    if (distance>=20) {
        m_canTriggerAction = false;
        
        if (m_touchStartLocation.x < local.x) {

        }else{

        }
    }
}

//-(void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event{
//    NSLog(@"toch cancel!");
//}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
//    NSLog(@"TOUCH END!");
    
    if (m_canTriggerAction) {
        return;
    }
    
    CGPoint touchLocation = [touch locationInView: [touch view]];
	touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
    
    CGPoint local = [self convertToNodeSpace:touchLocation];
    
    CGFloat distance = ccpDistance(local, m_touchStartLocation);
    
    if (distance>=5) {
        m_canTriggerAction = false;
        
        if (m_touchStartLocation.x < local.x) {

        }else{
 
        }
    }

}

-(void)onExit{
    [super onExit];
    [self setTouchEnabled:false];
}

@end
