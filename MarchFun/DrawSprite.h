//
//  DrawSprite.h
//  MarchFun
//
//  Created by Apple on 8/12/13.
//  Copyright hku.cs.msccs 2013年. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "cocos2d.h"
#include "config.h"

@interface DrawSprite : CCNode {
    
    int m_w;
    int m_h;
    
    BOOL m_hasSelected;//可否被选择
    
    CCDrawNode * m_drawNode;// 画当前颜色的圆点
    
    CCDrawNode * m_selectNode;// 用于 被选中时播放动画
    
    int m_dropCount;
}

@property(nonatomic,readonly) NSInteger m_x;
@property(nonatomic,readonly) NSInteger m_y;
@property(nonatomic,readonly) NSInteger addWidth2;
@property(nonatomic,readonly) NSInteger AddHeigh2;
@property(nonatomic,readonly) ccColor4F m_color;
@property(nonatomic,readonly) BOOL m_disappear;//是否消失

//生成 该节点 x y 宽和高
-(void) spawnAtX:(NSInteger)x Y:(NSInteger)y Width:(CGFloat)w Height:(CGFloat) h addWidth2:(NSInteger)a AddHeigh2:(NSInteger)b;
-(void) spawnAtX2:(NSInteger)x Y:(NSInteger)y Width:(CGFloat)w Height:(CGFloat) h addWidth2:(NSInteger)a AddHeigh2:(NSInteger)b;
-(void) respawn;// 重新生成
-(void)respawn2;

-(void) spawnDropdown;//生成后掉落下来
-(void)  spawnDropdown2;
-(void) resetPropertyA:(NSInteger)x Y:(NSInteger)y;// 重置属性 x和y坐标值

-(void) resetDropdown;// 重置后掉落函数
-(void)resetDropdown2;

-(BOOL) positionInContent:(CGPoint) pos;// 判断是移动的点是否在 检查范围内

-(BOOL) selectedType;// 被选中调用该方法

-(void) disappear:(bool) callf;// 消失

-(void) unselected;// 取消选中状态

-(CGPoint) getDrawNodePosition;//得到当前 绘制节点的位置

-(void) KeepSelected;//保持被选中状态

-(void) unKeepSelected;// 取消保持被选中状态

@end
