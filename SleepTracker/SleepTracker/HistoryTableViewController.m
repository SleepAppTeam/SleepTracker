//
//  HistoryTableViewController.m
//  SleepTracker
//
//  Created by 蘇健豪1 on 2014/12/23.
//  Copyright (c) 2014年 蘇健豪. All rights reserved.
//

#import "HistoryTableViewController.h"

#import "SleepDataModel.h"
#import "SleepData.h"

@interface HistoryTableViewController ()

@property (nonatomic, strong) SleepDataModel *sleepDataModel;
@property (nonatomic, strong) NSArray *fetchDataArray;
@property (nonatomic, strong) SleepData *sleepData;

@end

@implementation HistoryTableViewController

@synthesize fetchDataArray;

- (SleepDataModel *)sleepDataModel
{
    if (!_sleepDataModel) {
        _sleepDataModel = [[SleepDataModel alloc] init];
    }
    
    return _sleepDataModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    fetchDataArray = [self.sleepDataModel fetchSleepDataSortWithAscending:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [fetchDataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    self.sleepData = fetchDataArray[indexPath.row];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy/M/d ah:mm";
    
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"yyyy/M/d EEE ah:mm"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ ~ %@",[dateFormatter stringFromDate:self.sleepData.goToBedTime], [dateFormatter2 stringFromDate:self.sleepData.wakeUpTime]];
    
    NSDateFormatter *dateFormatter5 = [[NSDateFormatter alloc] init];
    [dateFormatter5 setDateFormat:@"DDD"];
    NSInteger day = [[dateFormatter5 stringFromDate:self.sleepData.wakeUpTime] integerValue];
    if (day % 2 == 0) {
        cell.textLabel.textColor = [UIColor colorWithRed:0.267 green:0.486 blue:0.843 alpha:1] /*#447cd7*/;
    } else {
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    /*self.showData = [[SLShowData alloc] init];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", self.sleepData.sleepType,[self.showData stringFromTimeInterval:[self.sleepData.sleepTime floatValue] withDigit:2]];//*/

    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
