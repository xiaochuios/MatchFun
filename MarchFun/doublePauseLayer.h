//
//  doublePauseLayer.h
//  MatchFun
//
//  Created by Apple on 8/12/13.
//  Copyright hku.cs.msccs 2013年. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface doublePauseLayer : CCLayerColor {
    
    CCMenuItemImage * m_resume;
    CCMenuItemImage * m_restart;
    CCMenuItemImage * m_exittomain;
    CCMenuItemImage * m_resume1;
    CCMenuItemImage * m_restart1;
    CCMenuItemImage * m_exittomain1;
    
}

-(void) startAnimationDiaplay;

@end
