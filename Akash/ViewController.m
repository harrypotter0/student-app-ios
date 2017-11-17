
//  ViewController.m
//  Akash
//
//  Created by Placement on 9/20/17.
//  Copyright © 2017 NIET. All rights reserved.
//

#import "ViewController.h"
#import "SecViewController.h"
#define xOffset 10.0f
#define yOffset 20.0f
#define componentHeight 50.0f

@interface ViewController (){
    UITextField *firstName;
    UITextField *lastName;
    UITextField *rollNo;
    UITextField *email;
    UITextField *dob;
    UITextField *highSchoolPercent;
    UITextField *intermediatePercent;
    UITextField *year;
    UITextField *fathersName;
    UITextField *motherName;
    UITextField *techSkills;
    UITextField *country;
    UIButton *submitButton;
}

@end

@implementation ViewController
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}


-(void)showAlertWithMsg:(NSString *) msg{
    if([UIAlertController class])
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok;
        if([msg isEqualToString:@"Saved !!!"]){
            ok= [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action )
                 {
                     //    [self moveToRecords];
                 }];
        }
        else{
            ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        }
        [alertController addAction:ok];
        [self presentViewController:alertController animated :YES completion:nil];
    }
}

-(void )moveToRecords{
    SecViewController *secviewcontroller = [[SecViewController alloc]initWithNibName:@"SecViewController" bundle:nil];
    [self.navigationController pushViewController:secviewcontroller animated:YES];
}


- (void)viewDidLoad {
  [super viewDidLoad];
    // UIBarButtonItem rightbutton
    [self.view setBackgroundColor:[UIColor greenColor]];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat componentWidth = self.view.frame.size.width-(xOffset *2);
    CGFloat componentHt = 30.0f;
    CGFloat scrollHt=yOffset;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"View All Records" style:UIBarButtonItemStyleDone target:self action:@selector(moveToRecords)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    
    //moveToRecords
    
    scrollHt = scrollHt+componentHt+yOffset;
    
    firstName = [[UITextField alloc]init];
    [firstName setFrame:CGRectMake(xOffset, scrollHt, componentWidth, componentHt)];
    [firstName setBorderStyle:UITextBorderStyleRoundedRect];
    [firstName setPlaceholder:@"First name"];
    [scroller addSubview:firstName];
    
    scrollHt = scrollHt+componentHt+yOffset;
    
    lastName = [[UITextField alloc]init];
    [lastName setFrame:CGRectMake(xOffset, scrollHt, componentWidth, componentHt)];
    [lastName setBorderStyle:UITextBorderStyleRoundedRect];
    [lastName setPlaceholder:@"Last name"];
    [scroller addSubview:lastName];
    
    scrollHt = scrollHt+componentHt+yOffset;
    
    
    rollNo = [[UITextField alloc]init];
    [rollNo setFrame:CGRectMake(xOffset, scrollHt, componentWidth, componentHt)];
    [rollNo  setBorderStyle:UITextBorderStyleRoundedRect];
    [rollNo setPlaceholder:@"rollno"];
    [scroller addSubview:rollNo];
    
    scrollHt = scrollHt+componentHt+yOffset;
    
    email = [[UITextField alloc]init];
    [email setFrame:CGRectMake(xOffset, scrollHt, componentWidth, componentHt)];
    [email setBorderStyle:UITextBorderStyleRoundedRect];
    [email setPlaceholder:@"Email"];
    [scroller addSubview:email];
    
    scrollHt = scrollHt+componentHt+yOffset;
    
    dob = [[UITextField alloc]init];
    [dob setFrame:CGRectMake(xOffset, scrollHt, componentWidth, componentHt)];
    [dob setBorderStyle:UITextBorderStyleRoundedRect];
    [dob setPlaceholder:@"Date of Birth"];
    [scroller addSubview:dob];
    
    scrollHt = scrollHt+componentHt+yOffset;
    
    highSchoolPercent = [[UITextField alloc]init];
    [highSchoolPercent setFrame:CGRectMake(xOffset, scrollHt, componentWidth, componentHt)];
    [highSchoolPercent setBorderStyle:UITextBorderStyleRoundedRect];
    [highSchoolPercent setPlaceholder:@"High School Percentage"];
    [scroller addSubview:highSchoolPercent];
    
    scrollHt = scrollHt+componentHt+yOffset;
    
    intermediatePercent = [[UITextField alloc]init];
    [intermediatePercent setFrame:CGRectMake(xOffset, scrollHt, componentWidth, componentHt)];
    [intermediatePercent setBorderStyle:UITextBorderStyleRoundedRect];
    [intermediatePercent setPlaceholder:@"Intermidiate percentage"];
    [scroller addSubview:intermediatePercent];
    
    scrollHt = scrollHt+componentHt+yOffset;
    
    year = [[UITextField alloc]init];
    [year setFrame:CGRectMake(xOffset, scrollHt, componentWidth, componentHt)];
    [year setBorderStyle:UITextBorderStyleRoundedRect];
    [year setPlaceholder:@"Passing Year"];
    [scroller addSubview:year];
    
    scrollHt = scrollHt+componentHt+yOffset;
    
    fathersName = [[UITextField alloc]init];
    [fathersName setFrame:CGRectMake(xOffset, scrollHt, componentWidth, componentHt)];
    [fathersName setBorderStyle:UITextBorderStyleRoundedRect];
    [fathersName setPlaceholder:@"Father's Name"];
    [scroller addSubview:fathersName];
    
    scrollHt = scrollHt+componentHt+yOffset;
    
    motherName = [[UITextField alloc]init];
    [motherName setFrame:CGRectMake(xOffset, scrollHt, componentWidth, componentHt)];
    [motherName setBorderStyle:UITextBorderStyleRoundedRect];
    [motherName setPlaceholder:@"Mother's Name"];
    [scroller addSubview:motherName];
    
    scrollHt = scrollHt+componentHt+yOffset;
    
    techSkills = [[UITextField alloc]init];
    [techSkills setFrame:CGRectMake(xOffset, scrollHt, componentWidth, componentHt)];
    [techSkills setBorderStyle:UITextBorderStyleRoundedRect];
    [techSkills setPlaceholder:@"Technical Skills"];
    [scroller addSubview:techSkills];
    
    scrollHt = scrollHt+componentHt+yOffset;
    
    country = [[UITextField alloc]init];
    [country setFrame:CGRectMake(xOffset, scrollHt, componentWidth, componentHt)];
    [country setBorderStyle:UITextBorderStyleRoundedRect];
    [country setPlaceholder:@"Country"];
    [scroller addSubview:country];
    
    scrollHt = scrollHt+componentHt+yOffset;
    
    submitButton = [[UIButton alloc]initWithFrame:CGRectMake(xOffset, scrollHt, componentWidth, componentHt)];
    [submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    [submitButton addTarget:self action:@selector(clickAction:)forControlEvents:UIControlEventTouchUpInside] ;
    [submitButton setTintColor:[UIColor blueColor]];
    [submitButton setBackgroundColor:[UIColor orangeColor]];
    [scroller addSubview:submitButton];
    
    scrollHt = scrollHt+componentHt+yOffset;
    
    [scroller setContentSize:CGSizeMake(self.view.frame.size.width, scrollHt)];

    
}

-(BOOL)checkData{
    BOOL isDataOk = TRUE;
    if ([rollNo.text isEqualToString:@""]) {
        isDataOk = FALSE;
        [self showAlertWithMsg:@"Please enter the Roll Number"];
    }
    if (isDataOk) {
        if ([firstName.text isEqualToString:@""]) {
            isDataOk = FALSE;
            [self showAlertWithMsg:@"Please enter first name"];
        }
    }
    if (isDataOk) {
        if ([lastName.text isEqualToString:@""]) {
            isDataOk = FALSE;
            [self showAlertWithMsg:@"Please enter last name"];
        }
    }
    if (isDataOk) {
        if ([email.text isEqualToString:@""]) {
            isDataOk = FALSE;
            [self showAlertWithMsg:@"Please enter email name"];
        }
    }
    
    if (isDataOk) {
        if ([dob.text isEqualToString:@""]) {
            isDataOk = FALSE;
            [self showAlertWithMsg:@"Please dob  name"];
        }
    }
    
    if (isDataOk) {
        if ([highSchoolPercent.text isEqualToString:@""]) {
            isDataOk = FALSE;
            [self showAlertWithMsg:@"Please enter highSchoolPercent name"];
        }
    }
    
    if (isDataOk) {
        if ([intermediatePercent.text isEqualToString:@""]) {
            isDataOk = FALSE;
            [self showAlertWithMsg:@"Please enter intermediatePercent name"];
        }
    }
    
    if (isDataOk) {
        if ([year.text isEqualToString:@""]) {
            isDataOk = FALSE;
            [self showAlertWithMsg:@"Please enter year name"];
        }
    }
    
    if (isDataOk) {
        if ([fathersName.text isEqualToString:@""]) {
            isDataOk = FALSE;
            [self showAlertWithMsg:@"Please enter fathersName name"];
        }
    }
    
    if (isDataOk) {
        if ([motherName.text isEqualToString:@""]) {
            isDataOk = FALSE;
            [self showAlertWithMsg:@"Please enter motherName name"];
        }
    }
    
    if (isDataOk) {
        if ([techSkills.text isEqualToString:@""]) {
            isDataOk = FALSE;
            [self showAlertWithMsg:@"Please enter techSkills name"];
        }
    }
    
    if (isDataOk) {
        if ([country.text isEqualToString:@""]) {
            isDataOk = FALSE;
            [self showAlertWithMsg:@"Please enter country name"];
        }
    }
    return isDataOk;
}


-(IBAction)clickAction:(id)sender{
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
     

     
