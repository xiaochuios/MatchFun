//
//  doublePauseLayer.m
//  MatchFun
//
//  Created by Apple on 8/12/13.
//  Copyright hku.cs.msccs 2013年. All rights reserved.
//

#import "doublePauseLayer.h"

#import "DotGameScene.h"
#import "DotPlayingdoubleScnen.h"
#import "DotdoubleHudController.h"

@implementation doublePauseLayer

- (id)init
{
    self = [super initWithColor:ccc4(255,255,255, 255)];
    if (self) {
        
        
        [self setAnchorPoint:ccp(0,0)];
        [self setPosition:ccp(0, 0)];
        
        m_resume = [CCMenuItemImage itemWithNormalImage:@"resume.png"
                                          selectedImage:@"resume_unselect.png" target:self selector:@selector(resumeDotGame)];
        m_restart =  [CCMenuItemImage itemWithNormalImage:@"restart.png"
                                            selectedImage:@"restart_unselect.png" target:self selector:@selector(restartDotGame)];
        m_exittomain = [CCMenuItemImage itemWithNormalImage:@"exit.png"
                                              selectedImage:@"exit_unselect.png" target:self selector:@selector(exitToMainScnen)];
        m_resume1 = [CCMenuItemImage itemWithNormalImage:@"resume.png"
                                          selectedImage:@"resume_unselect.png" target:self selector:@selector(resumeDotGame)];
        m_restart1 =  [CCMenuItemImage itemWithNormalImage:@"restart.png"
                                            selectedImage:@"restart_unselect.png" target:self selector:@selector(restartDotGame)];
        m_exittomain1 = [CCMenuItemImage itemWithNormalImage:@"exit.png"
                                              selectedImage:@"exit_unselect.png" target:self selector:@selector(exitToMainScnen)];
        
        
        CCMenu * menu = [CCMenu menuWithItems:m_resume, m_restart, m_exittomain, nil];
        CCMenu * menu1 = [CCMenu menuWithItems:m_resume1, m_restart1, m_exittomain1, nil];
        
        [menu setAnchorPoint:ccp(0, 0)];
        [menu setPosition:ccp(0, -250)];
        [menu1 setAnchorPoint:ccp(0, 0)];
        [menu1 setPosition:ccp(775, 1300)];
        [menu1 setRotation:180];
        [self addChild:menu1];
        [self addChild:menu];
        [self setVisible:false];
    }
    return self;
}

-(void)startAnimationDiaplay{
    
    [self setVisible:true];
    CGSize s = [CCDirector sharedDirector].winSize;
    
    [m_resume setPosition:ccp(s.width, s.height/2+100)];
    [m_restart setPosition:ccp(s.width, s.height/2)];
    [m_exittomain setPosition:ccp(s.width, s.height/2-100)];
    [m_resume1 setPosition:ccp(s.width, s.height/2+100)];
    [m_restart1 setPosition:ccp(s.width, s.height/2)];
    [m_exittomain1 setPosition:ccp(s.width, s.height/2-100)];
    
    
    CCMoveTo * moveTo1 = [CCMoveTo actionWithDuration:0.2 position:ccp(s.width/2-15, s.height/2+100)];
    CCMoveTo * moveTo12 = [CCMoveTo actionWithDuration:0.2 position:ccp(s.width/2, s.height/2+100)];
    
    CCMoveTo * moveTo2 = [CCMoveTo actionWithDuration:0.2 position:ccp(s.width/2-35, s.height/2)];
    CCMoveTo * moveTo22 = [CCMoveTo actionWithDuration:0.2 position:ccp(s.width/2, s.height/2)];
    
    CCMoveTo * moveTo3 = [CCMoveTo actionWithDuration:0.2 position:ccp(s.width/2-45, s.height/2-100)];
    CCMoveTo * moveTo32 = [CCMoveTo actionWithDuration:0.2 position:ccp(s.width/2, s.height/2-100)];
    
    CCMoveTo * moveTo11 = [CCMoveTo actionWithDuration:0.2 position:ccp(s.width/2-15, s.height/2+100)];
    CCMoveTo * moveTo121 = [CCMoveTo actionWithDuration:0.2 position:ccp(s.width/2, s.height/2+100)];
    
    CCMoveTo * moveTo21 = [CCMoveTo actionWithDuration:0.2 position:ccp(s.width/2-35, s.height/2)];
    CCMoveTo * moveTo221 = [CCMoveTo actionWithDuration:0.2 position:ccp(s.width/2, s.height/2)];
    
    CCMoveTo * moveTo31 = [CCMoveTo actionWithDuration:0.2 position:ccp(s.width/2-45, s.height/2-100)];
    CCMoveTo * moveTo321 = [CCMoveTo actionWithDuration:0.2 position:ccp(s.width/2, s.height/2-100)];
    
    [m_resume runAction:[CCSequence actions:moveTo11,moveTo121, nil]];
    [m_restart runAction:[CCSequence actions:moveTo21, moveTo221 , nil]];
    [m_exittomain runAction:[CCSequence actions:moveTo31, moveTo321, nil]];
    [m_resume1 runAction:[CCSequence actions:moveTo1,moveTo12, nil]];
    [m_restart1 runAction:[CCSequence actions:moveTo2, moveTo22 , nil]];
    [m_exittomain1 runAction:[CCSequence actions:moveTo3, moveTo32, nil]];
}



-(void) resumeDotGame{
    if (self.parent) {
        DotdoubleHudController *hc = (DotdoubleHudController*)self.parent;
        [hc gamePause];
    }
}

-(void) restartDotGame{
    CCScene * playingScene = [DotPlayingdoubleScnen scene];
    
    [[CCDirector sharedDirector] replaceScene:[CCTransitionMoveInR transitionWithDuration:0.2 scene:playingScene]];
    
}

-(void) exitToMainScnen{
    DotGameScene * scene = [DotGameScene node];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionProgressOutIn transitionWithDuration:0.2 scene:scene]];
}


@end
