//
//  HelloWorldLayer.h
//  MatchFun
//
//  Created by Apple on 8/12/13.
//  Copyright hku.cs.msccs 2013年. All rights reserved.
//




// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

@class DataHandle;

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    DataHandle *m_data;
    
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
