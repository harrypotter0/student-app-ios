//
//  SecViewController.h
//  Akash
//
//  Created by Placement on 9/20/17.
//  Copyright © 2017 NIET. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecViewController : UIViewController <
UITableViewDataSource, UITableViewDelegate>{
    IBOutlet UITableView *listView;
}

@end
