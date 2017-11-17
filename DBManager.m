//
//  DBManager.m
//  Akash
//
//  Created by Placement on 11/1/17.
//  Copyright © 2017 NIET. All rights reserved.
//

#import "DBManager.h"
#import "StudentData.h"

static DBManager *sharedInstance = nil;
static sqlite3 *database = nil;
static sqlite3_stmt *statement = nil;

@implementation DBManager

+(DBManager*)getSharedInstance{
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
        [sharedInstance createDB];
    }
    return sharedInstance;
}

-(BOOL)createDB{
    NSString *docsDir;
    NSArray *dirPaths;
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"student.db"]];
    BOOL isSuccess = YES;
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: databasePath ] == NO)
    {
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &database) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt = "create table if not exists studentsDetail (rollNo INTEGER PRIMARY KEY AUTOINCREMENT, firstName text, lastName text, year text, branch text, section text, mobile text, email text, dob text, highSchoolPercent text, intermediatePercent text)";
            if (sqlite3_exec(database, sql_stmt, NULL, NULL, &errMsg)
                != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table");
            }
            sqlite3_close(database);
            return  isSuccess;
        }
        else {
            isSuccess = NO;
            NSLog(@"Failed to open/create database");
        }
    }
    return isSuccess;
}

-(BOOL) saveData:(NSString*)rollNo firstName:(NSString*)firstName lastName:(NSString*)lastName year:(NSString*)year branch:(NSString*)branch section:(NSString*)section mobile:(NSString*)mobile email:(NSString*)email dob:(NSString*)dob highSchoolPercent:(NSString*)highSchoolPercent intermediatePercent:(NSString*)intermediatePercent {
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into studentsDetail (firstName, lastName, year, branch, section, mobile, email, dob, highSchoolPercent, intermediatePercent) values (\"%@\", \"%@\", \"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",
                               firstName, lastName, year,branch,section,mobile,email,dob,highSchoolPercent,intermediatePercent];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            return YES;
        }
        else {
            return NO;
        }
        //        sqlite3_reset(statement);
    }
    return NO;
}
-(NSMutableArray *)loadAllRecords
{
    // setup the reminders array
    NSMutableArray *studentRecords = [[NSMutableArray alloc] init];
    
    //Retrieve the values of database
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt *statement;
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM studentsDetail"];
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(database ,query_stmt , -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                StudentData *studentData = [[StudentData alloc] init];
                
                
                
                studentData.firstName = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                
                studentData.lastName = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                
                studentData.rollNo   = [[[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)] intValue];
                
                studentData.email = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                
                studentData.dob = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                
                studentData.highSchoolPercent = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                
                studentData.intermediatePercent = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                
                studentData.year = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                
                studentData.fathersName = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                
                studentData.motherName = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                
                studentData.techSkills = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                
                studentData.country = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                
                
                
                
                
                
                
                
                
                [studentRecords addObject:studentData];
            }
            
            sqlite3_finalize(statement);
        }
        sqlite3_close(database);
    }
    return studentRecords;
}

- (NSArray*) findByRegisterNumber:(NSString*)registerNumber
{
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat: @"select firstName, lastName, email from studentsDetail where regno=\"%@\"",registerNumber];
        const char *query_stmt = [querySQL UTF8String];
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        if (sqlite3_prepare_v2(database,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSString *name = [[NSString alloc] initWithUTF8String:
                                  (const char *) sqlite3_column_text(statement, 0)];
                [resultArray addObject:name];
                NSString *department = [[NSString alloc] initWithUTF8String:
                                        (const char *) sqlite3_column_text(statement, 1)];
                [resultArray addObject:department];
                NSString *year = [[NSString alloc]initWithUTF8String:
                                  (const char *) sqlite3_column_text(statement, 2)];
                [resultArray addObject:year];
                return resultArray;
            }
            else{
                NSLog(@"Not found");
                return nil;
            }
            //            sqlite3_reset(statement);
        }
    }
    return nil;
}

@end