//
//  DotPlayingScnen.h
//  MatchFun
//
//  Created by Apple on 8/12/13.
//  Copyright hku.cs.msccs 2013年. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#include "config.h"

@class DataHandle;


@class DotHudController;

@interface DotPlayingScnen : CCLayer {
    
    DotHudController * m_hudController;
    
    DataHandle       * m_data;

    
    CGFloat m_delta;
    
    NSInteger m_score;
    NSInteger m_timeCounter;
    
    BOOL m_pause;
}

+(CCScene*)scene;

-(void) startDotGame;

-(void) playingScoreAdd:(NSInteger) score;

-(void) playerUsedToolDisappear:(PLAYERTOOLTYPE) type;

-(void) pauseGame;
-(void) resumeGame;

@end
