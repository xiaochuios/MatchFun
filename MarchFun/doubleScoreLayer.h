//
//  doubleScoreLayer.h
//  MatchFun
//
//  Created by Apple on 8/12/13.
//  Copyright hku.cs.msccs 2013年. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface doubleScoreLayer : CCLayerColor {
    
    CCLabelTTF * m_logoLabel;
    CCLabelTTF * m_logoLabel1;
    
    //    CCLabelTTF * m_levelLabel;
    //
    //    CCLabelTTF * m_goldlabel;
    //
    //    CCLabelTTF * m_highScore;
    CCMenuItemImage * m_exittomain;
        CCMenuItemImage * m_exittomain1;
    
    CCLabelTTF * m_thisRound;
     CCLabelTTF * m_thisRound1;
    
    CCProgressTimer * m_expProgress;
    
    
    
    CCMenuItemImage * m_imageItem;
    CCMenuItemImage * m_imageItem1;
    
    CGPoint m_touchStartLocation;
    
    BOOL m_imageButtonResponseType;
    
    BOOL m_canTriggerAction;
}

+(CCScene*) scene;

-(void) startAnimationDisplay:(NSInteger) score score2:(NSInteger) score2;

-(void) startAnimationDisplay;
-(void) setscore2:(NSInteger) score;

@end
