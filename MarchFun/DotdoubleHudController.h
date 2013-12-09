//
//  DotdoubleHudController.h
//  MatchFun
//
//  Created by Apple on 8/12/13.
//  Copyright hku.cs.msccs 2013年. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "configdouble.h"

@class doubleUpStateLayer;
@class doubleDownStateLayer;
@class doublePauseLayer;
@class doubleScoreLayer;

@interface DotdoubleHudController : CCNode {
    
    doubleUpStateLayer * m_upstateLayer;
    doubleDownStateLayer * m_downStateLayer;
    doublePauseLayer * m_pauseLayer;
    
    doubleScoreLayer * m_topScoreLayer;
    
    BOOL m_pause;
}

-(void) gamePause;

-(void) currentGameOver:(NSInteger)score score2:(NSInteger)score2;

-(void) resetTimeString:(NSString*)string;
-(void) resetScoreString:(NSString*) string;
-(void) resetTimeString2:(NSString*)string;
-(void) resetScoreString2:(NSString*) string;

-(void) startGame;

-(void) playerUseSkill:(PLAYERTOOLTYPE) skillTpye;
-(void) playerUseSkill2:(PLAYERTOOLTYPE) skillTpye;

@end
