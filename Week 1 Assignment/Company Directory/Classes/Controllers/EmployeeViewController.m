//
//  EmployeeViewController.m
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/10.
//  Copyright (c) 2011年 Gowalla. All rights reserved.
//

enum {
    GenericSectionIndex,
    SpecificSectionIndex,
} EmployeeViewControllerSectionIndexes;

enum {
    NameRowIndex,
    JobTitleRowIndex,
} EmployeeViewControllerGenericRowIndexes;

enum {
    BirthdayRowIndex,
    SalaryRowIndex,
} EmployeeViewControllerSpecificRowIndexes;

#import "EmployeeViewController.h"

#import "Employee.h"

@interface EmployeeViewController ()
@property (readwrite, nonatomic, retain) Employee *employee;

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@implementation EmployeeViewController
@synthesize employee = _employee;

- (id)initWithEmployee:(Employee *)employee {
    self = [self initWithStyle:UITableViewStyleGrouped];
    if (!self) {
        return nil;
    }
    
    self.employee = employee;
    
    return self;
}

- (void)dealloc {
    [_employee release];
    [super dealloc];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.employee.name;
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case GenericSectionIndex:
            switch (indexPath.row) {
                case NameRowIndex:
                    cell.textLabel.text = NSLocalizedString(@"Name", nil);
                    cell.detailTextLabel.text = self.employee.name;
                    break;
                case JobTitleRowIndex:
                    cell.textLabel.text = NSLocalizedString(@"Job Title", nil);
                    cell.detailTextLabel.text = self.employee.jobTitle;
                    break;
            }
            break;
        case SpecificSectionIndex:
            switch (indexPath.row) {
                case BirthdayRowIndex:
                    cell.textLabel.text = NSLocalizedString(@"Birthday", nil);
                    cell.detailTextLabel.text = [self.employee formattedBirthdayString];
                    break;
                case JobTitleRowIndex:
                    cell.textLabel.text = NSLocalizedString(@"Salary", nil);
                    cell.detailTextLabel.text = [self.employee formattedSalaryString];
                    break;
            }
            break;
    }
}

@end
