//
//  NoticeListViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "NoticeListViewController.h"
#import "NoticeListTableViewCell.h"
#import "Time.h"

@implementation NoticeListViewController

- (instancetype)init {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        [self setTitle:@"公告"];
        self.data = [[NoticeListModel alloc] init];
        [self.data fetchDataOnPage:1];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AAA) name:NOTIFICATION_NOTICE_LIST_REFRESHED object:nil];
    }
    return self;
}

- (void)AAA {
//    NSLog(@"%@", self.data.pageInfo);
//    NSLog(@"%@", self.data.list);
    [self.tableView reloadData];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [NoticeListTableViewCell height];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NoticeListTableViewCell* cell = [[NoticeListTableViewCell alloc] init];
    [cell.title setText:[NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"title"]]];
    [cell.content setText:[NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"content"]]];
    [cell.updateTime setText:getTimeString([NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"time"]])];
    [cell.author setText:[NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"ownerName"]]];
    return cell;
}

@end
