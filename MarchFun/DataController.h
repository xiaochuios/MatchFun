//
//  DataController.h
//  MarchFun
//
//  Created by Apple on 8/12/13.
//  Copyright hku.cs.msccs 2013年. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataController : NSObject{
    
    NSString * m_filePath;
    
    NSDictionary * m_dataDic;
    
}


+(DataController*) getSharedDataController;

+(void) releaseSharedDataController;

-(void) savePlayerTemplateData:(NSInteger) score;


-(NSArray*) readLoaclScoreTopList;

-(NSDictionary*) readWorldScpreTopList;

-(NSArray *) readPlayerDefaultProperty;

-(NSInteger) getHighScore;



@end
