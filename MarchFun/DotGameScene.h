//
//  DotGameScene.h
//  MatchFun
//
//  Created by Apple on 8/12/13.
//  Copyright hku.cs.msccs 2013年. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import <GameKit/GameKit.h>

@interface DotGameScene : CCScene<UIActionSheetDelegate,
                                  GKGameCenterControllerDelegate,
                                  GKAchievementViewControllerDelegate,
                                  GKLeaderboardViewControllerDelegate>
{
    CCMenuItemImage * m_playnow;
    CCMenuItemImage * m_logo;
    CCMenuItemImage * m_singleplay;
}

@end
