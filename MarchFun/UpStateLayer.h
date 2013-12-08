//
//  UpStateLayer.h
//  MatchFun
//
//  Created by Apple on 8/12/13.
//  Copyright hku.cs.msccs 2013年. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface UpStateLayer : CCLayerColor {
    
    CCLabelTTF * m_labelTime;
    CCLabelTTF * m_labelScore;
    CCLabelTTF * timelabel;
    CCLabelTTF * scorelabel;
    
    
    
    CCMenuItemImage * m_scoreItem;
    CCMenuItemImage * m_timeItem;
}

-(void) resetTimeString:(NSString*)string;
-(void) resetScoreString:(NSString*) string;

-(void) startAnimationDisplay;

@end
