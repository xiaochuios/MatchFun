//
//  DotdoubleHudController.m
//  MatchFun
//
//  Created by Apple on 8/12/13.
//  Copyright hku.cs.msccs 2013年. All rights reserved.
//

#import "DotdoubleHudController.h"

#import "DotPlayingdoubleScnen.h"

#import "doubleDownStateLayer.h"
#import "doubleUpStateLayer.h"
#import "doublePauseLayer.h"
#import "doubleScoreLayer.h"

@implementation DotdoubleHudController


- (id)init
{
    self = [super init];
    if (self) {
        
        m_downStateLayer    = [doubleDownStateLayer node];
        m_upstateLayer      = [doubleUpStateLayer node];
        m_pauseLayer        = [doublePauseLayer node];
        m_topScoreLayer     = [doubleScoreLayer node];
        
        
        [self addChild:m_downStateLayer z:2];
        [self addChild:m_upstateLayer z:2];
        [self addChild:m_pauseLayer z:1];
        [self addChild:m_topScoreLayer];
    }
    return self;
}

-(void)onEnter{
    [super onEnter];
    
    [m_upstateLayer startAnimationDisplay];
    [m_downStateLayer startAnimationDisplay];
}

-(void)startGame{
    if (self.parent) {
        DotPlayingdoubleScnen * dps = (DotPlayingdoubleScnen*)self.parent;
        [dps startDotGame];
    }
}

-(void)gamePause{
    if (m_pause) {
        if (self.parent) {
            [m_pauseLayer setVisible:false];
            DotPlayingdoubleScnen * playing = (DotPlayingdoubleScnen*)self.parent;
            [playing resumeGame];
            m_pause = false;
        }
    }else{
        if (self.parent) {
            [m_pauseLayer startAnimationDiaplay];
            DotPlayingdoubleScnen * playing = (DotPlayingdoubleScnen*)self.parent;
            [playing pauseGame];
            m_pause = true;
        }
    }
}

-(void) currentGameOver:(NSInteger)score score2:(NSInteger)score2{
    
    
    [m_downStateLayer setVisible:false];;
    [m_upstateLayer setVisible:false];
    [m_pauseLayer setVisible:false];
    [m_topScoreLayer startAnimationDisplay:score score2:score2];
     //[m_topScoreLayer setscore2:score2];
    
}


-(void)resetTimeString:(NSString *)string{
    [m_upstateLayer resetTimeString:string];
}
-(void)resetScoreString:(NSString *)string{
    [m_upstateLayer resetScoreString:string];
}

-(void)resetTimeString2:(NSString *)string{
    [m_upstateLayer resetTimeString2:string];
}
-(void)resetScoreString2:(NSString *)string{
    [m_upstateLayer resetScoreString2:string];
}

-(void)playerUseSkill:(PLAYERTOOLTYPE)skillTpye{
    if (self.parent) {
        DotPlayingdoubleScnen * playing = (DotPlayingdoubleScnen*)self.parent;
        if (playing) {
            [playing playerUsedToolDisappear:skillTpye];
        }
    }
}
-(void)playerUseSkill2:(PLAYERTOOLTYPE)skillTpye{
    if (self.parent) {
        DotPlayingdoubleScnen * playing = (DotPlayingdoubleScnen*)self.parent;
        if (playing) {
            [playing playerUsedToolDisappear2:skillTpye];
        }
    }
}

@end
