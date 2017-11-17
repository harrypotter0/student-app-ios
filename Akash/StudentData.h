//
//  StudentData.h
//  Akash
//
//  Created by Placement on 11/8/17.
//  Copyright © 2017 NIET. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentData : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (assign)int rollNo;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *dob;
@property (nonatomic, strong) NSString *highSchoolPercent;
@property (nonatomic, strong) NSString *intermediatePercent;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *fathersName;
@property (nonatomic, strong) NSString *motherName;
@property (nonatomic, strong) NSString *techSkills;
@property (nonatomic, strong) NSString *country;

@end
