//
//  doubleScoreLayer.m
//  MatchFun
//
//  Created by Apple on 8/12/13.
//  Copyright hku.cs.msccs 2013年. All rights reserved.
//

#import "doubleScoreLayer.h"

#import "DataController.h"
#import "DotPlayingdoubleScnen.h"
#import "DotGameScene.h"

@implementation doubleScoreLayer

+(CCScene *)scene{
    CCScene * scene = [CCScene node];
    
    doubleScoreLayer * layer = [doubleScoreLayer node];
    
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
        [m_logoLabel setPosition:ccp(s.width/2, s.height/2 - 50)];
        [self addChild:m_logoLabel];
        
        m_logoLabel1 = [CCLabelTTF labelWithString:@"Score" fontName:@"Arial" fontSize:32];
        [m_logoLabel1 setColor:ccc3(0, 0, 0)];
        [m_logoLabel1 setPosition:ccp(s.width/2, s.height - 450)];
         [m_logoLabel1 setRotation:180];
        [self addChild:m_logoLabel1];
        
        //        CCSprite * levelSprite
//        CCSprite * thisRound = [CCSprite spriteWithFile:@"thisRoundScore.png"];
//        [thisRound setPosition:ccp(s.width/2, s.height-130)];
//        [self addChild:thisRound];
        m_thisRound = [CCLabelTTF labelWithString:@"" fontName:@"Arial" fontSize:25];
        [m_thisRound setColor:ccc3(0, 0, 0)];
    [m_thisRound setPosition:ccp(s.width/2, s.height/2 - 150)];
        [self addChild:m_thisRound];
        m_thisRound1 = [CCLabelTTF labelWithString:@"" fontName:@"Arial" fontSize:25];
        [m_thisRound1 setColor:ccc3(0, 0, 0)];
        [m_thisRound1 setPosition:ccp(s.width/2, s.height/2+150 )];
        [m_thisRound1 setRotation:180];
        [self addChild:m_thisRound1];
        

        m_exittomain = [CCMenuItemImage itemWithNormalImage:@"TopExit.png"
                                              selectedImage:@"TopExit.png" target:self selector:@selector(exitToMainScnen)];
        
        m_imageItem = [CCMenuItemImage itemWithTarget:self selector:@selector(imageItemPressed)];
        m_exittomain1 = [CCMenuItemImage itemWithNormalImage:@"TopExit.png"
                                              selectedImage:@"TopExit.png" target:self selector:@selector(exitToMainScnen)];
        
        m_imageItem1 = [CCMenuItemImage itemWithTarget:self selector:@selector(imageItemPressed1)];
        
        CCMenu *menu = [CCMenu menuWithItems:m_exittomain,m_imageItem, nil];
        CCMenu *menu1 = [CCMenu menuWithItems:m_exittomain1,m_imageItem1, nil];
        
        [menu setAnchorPoint:ccp(0, 0)];
        [menu setPosition:ccp(0, -250)];
        [menu1 setAnchorPoint:ccp(0, 0)];
        [menu1 setPosition:ccp(775, 1300)];
        [menu1 setRotation:180];
        
        [m_imageItem setPosition:ccp(s.width/2, s.height/2+50)];
        [m_exittomain setPosition:ccp(s.width/2, s.height/2-100)];
        [m_imageItem1 setPosition:ccp(s.width/2, s.height/2+50)];
        [m_exittomain1 setPosition:ccp(s.width/2, s.height/2-100)];
        [self addChild:menu];
        [self addChild:menu1];
        
        
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
-(void)startAnimationDisplay:(NSInteger)score score2:(NSInteger)score2{
    
    m_imageButtonResponseType = true;//play again
    
    [self setVisible:true];
    CGSize s = [CCDirector sharedDirector].winSize;
    [self stopAllActions];
    [self setPosition:ccp(s.width, 0 )];
    
    CCMoveTo  * moveTo = [CCMoveTo actionWithDuration:0.2 position:ccp(0, 0)];
    
    CCCallBlock * callB = [CCCallBlock actionWithBlock:^{
        [self loadAnimation:score :[[DataController getSharedDataController] readPlayerDefaultProperty] score2:score2];

    }];
    
    [self runAction:[CCSequence actionOne:moveTo two:callB]];
    
    
    CCTexture2D * texture = [[CCTextureCache sharedTextureCache] addImage:@"TopPlayingNow.png"];
    //    [m_imageItem setNormalImage:texture];
    CCSpriteFrame *frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(0, 0, texture.contentSize.width, texture.contentSize.height)];
    [m_imageItem setNormalSpriteFrame:frame];
    [m_imageItem1 setNormalSpriteFrame:frame];
    
    
    [self setTouchEnabled:true];
}

-(void)setscore2:(NSInteger)score{
      [m_thisRound1 setString:[NSString stringWithFormat:@"Winner:%d",score]];

}
-(void)startAnimationDisplay{
    m_imageButtonResponseType = false;//return back
    [self setVisible:true];
   // [self loadAnimation:0 :[[DataController getSharedDataController] readPlayerDefaultProperty]];
    
    CCTexture2D * texture = [[CCTextureCache sharedTextureCache] addImage:@"TopExit.png"];
    //    [m_imageItem setNormalImage:texture];
    CCSpriteFrame *frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(0, 0, texture.contentSize.width, texture.contentSize.height)];
    [m_imageItem setNormalSpriteFrame:frame];
    
    [self setTouchEnabled:true];
}

-(void) imageItemPressed{
    
    if (m_imageButtonResponseType) {
        
        CCScene * playingScene = [DotPlayingdoubleScnen scene];
        
        [[CCDirector sharedDirector] replaceScene:[CCTransitionMoveInR transitionWithDuration:0.2 scene:playingScene]];
    }else{
        [[CCDirector sharedDirector]popScene];
    }
}
-(void) imageItemPressed1{
    
    if (m_imageButtonResponseType) {
        
        CCScene * playingScene = [DotPlayingdoubleScnen scene];
        
        [[CCDirector sharedDirector] replaceScene:[CCTransitionMoveInR transitionWithDuration:0.2 scene:playingScene]];
    }else{
        [[CCDirector sharedDirector]popScene];
    }
}


-(void) loadAnimation:(NSInteger)score :(NSArray*) array score2:(NSInteger)score2{
    

    
    if(score>score2){
     [m_thisRound setString:[NSString stringWithFormat:@"You WIN（%d）",score]];
     [m_thisRound1 setString:[NSString stringWithFormat:@"You lose（%d）",score2]];
    }
    else if (score==score2){
        [m_thisRound setString:[NSString stringWithFormat:@"Draw（%d）",score]];
        [m_thisRound1 setString:[NSString stringWithFormat:@"Draw（%d）",score2]];
    }
    else{
        [m_thisRound setString:[NSString stringWithFormat:@"You lose（%d）",score]];
        [m_thisRound1 setString:[NSString stringWithFormat:@"You WIN（%d）",score2]];
    
    }
  
    

    
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
