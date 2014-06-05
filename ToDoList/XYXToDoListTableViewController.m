//
//  XYXToDoListTableViewController.m
//  ToDoList
//
//  Created by Neeraj on 6/4/14.
//  Copyright (c) 2014 SubtleCreation. All rights reserved.
//

#import "XYXToDoListTableViewController.h"
#import "XYZToDoList.h"
#import "XYZAddToDoItemViewController.h"
@interface XYXToDoListTableViewController ()

@property NSMutableArray *toDoItems;

@end

@implementation XYXToDoListTableViewController

-(void)	loadInitialData{
    XYZToDoList *item1 = 	[[XYZToDoList alloc] init];
    item1.itemName = @"Build character";
    [self.toDoItems addObject:item1];
    XYZToDoList *item2 = [[XYZToDoList alloc] init];
    item2.itemName = @"Set goals";
    [self.toDoItems addObject:item2];
    XYZToDoList *item3 = [[XYZToDoList alloc] init];
    item3.itemName = @"Achieve the goals";
    [self.toDoItems addObject:item3];
}

-(IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    XYZAddToDoItemViewController *source = [segue sourceViewController];
    XYZToDoList *toDoListItem = source.toDoItem;
    if (toDoListItem!=nil) {
        [self.toDoItems addObject:toDoListItem];
        [self.tableView reloadData];
    }
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString	*CellIdentifier = @"ListPrototypeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    XYZToDoList *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    if (toDoItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    XYZToDoList *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}
























@end
