//
//  PauseLayer.h
//  MatchFun
//
//  Created by Apple on 8/12/13.
//  Copyright hku.cs.msccs 2013年. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface PauseLayer : CCLayerColor {
    
    CCMenuItemImage * m_resume;
    CCMenuItemImage * m_restart;
    CCMenuItemImage * m_exittomain;
    
}

-(void) startAnimationDiaplay;

@end
