//
//  SNInteractionTableViewController.m
//  InteractionTableViewExample
//
//  Created by Simon Nickel on 08.02.14.
//  Copyright (c) 2014 simonnickel. All rights reserved.
//

#import "SNInteractionTableViewController.h"
#import "SNInteractionTableView.h"
#import "SNInteractionCell.h"

@interface SNInteractionTableViewController ()

@end

@implementation SNInteractionTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    /*
    SNInteractionTableView *tableView = (SNInteractionTableView *)self.tableView;
    [tableView deselectSelectedRow];
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView indexPathForSelectedRow] && indexPath.row == [tableView indexPathForSelectedRow].row)
        return self.tableView.rowHeight + actionPanelHeight;
    else
        return self.tableView.rowHeight;
}

/*
 *  Reload cell when de/selected to de/increase size of it.
 *  Cancel selection if cell is already selected.
 */
- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath;
}
- (NSIndexPath *)tableView:(SNInteractionTableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SNInteractionCell *cell = (SNInteractionCell *)[tableView cellForRowAtIndexPath:indexPath];
    if ([cell isSelected]) {
        [tableView deselectSelectedRow];
        return nil;
    }
    return indexPath;
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
}

@end
