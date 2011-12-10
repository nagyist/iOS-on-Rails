//
//  EmployeeViewController.h
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/10.
//  Copyright (c) 2011年 Gowalla. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Employee;

@interface EmployeeViewController : UITableViewController

@property (readonly, nonatomic, retain) Employee *employee;

- (id)initWithEmployee:(Employee *)employee;

@end
