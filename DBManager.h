//
//  DBManager.h
//  Akash
//
//  Created by Placement on 11/1/17.
//  Copyright © 2017 NIET. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager : NSObject
{
    NSString *databasePath;
}

+(DBManager*)getSharedInstance;

-(BOOL)createDB;
-(BOOL) saveData:(NSString*)rollNo firstName:(NSString*)lastName year:(NSString*)year branch:(NSString*)section mobile:(NSString*)mobile email:(NSString*)email dob:(NSString*)dob highSchoolPercent:(NSString*)highSchoolPercent intermediatePercent:(NSString*)intermediatePercent;
-(NSArray*)findByRegisterNumber:(NSString*)registerNumber;
- (NSArray*) loadAllRecords;

@end
