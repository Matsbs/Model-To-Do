#import "Class1ViewController.h"

@interface Class1ViewController ()

@end

@implementation Class1ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
	    
    self.tasks = [self.dbManager getAllTasks];
	self.title = @"mainscreenname";

    self.listSearchBar = [[UISearchBar alloc]init];
    self.listSearchBar.delegate = self;
    //Set the size and position and add to view. The order in which widgets are added to the
    //view affect the application, as view can be on top of each other.
    //self.listSearchBar.frame = CGRectMake(x-origin, y-origin, width, height);
    //[self.view addSubview:self.listSearchBar];
    self.listTableView = [[UITableView alloc]init];
    self.listTableView.rowHeight = 50;
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    self.listTableView.scrollEnabled = YES;
    //Set the size and position and add to view. The order in which widgets are added to the
    //view affect the application, as view can be on top of each other.
    //self.listTableView.frame = CGRectMake(x-origin, y-origin, width, height);
    //[self.view addSubview:self.listTableView];
    
    self.labelLabel = [[UILabel alloc] init];
    //Set the size and position and add to view. The order in which widgets are added to the
    //view affect the application, as view can be on top of each other.
    //self.labelLabel.frame = CGRectMake(x-origin, y-origin, width, height);
    //[self.view addSubview:self.labelLabel];

    NSMutableArray *barButtons = [[NSMutableArray alloc]init];
    UIBarButtonItem *item2Button = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(operation2:)];    
    [barButtons addObject:item2Button];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *item1Button = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(operation1:)];    
    [barButtons addObject:item1Button];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItems = barButtons;
}

- (void)reloadTableData:(NewTaskViewController *)controller{
    self.tasks = [self.dbManager getAllTasks];
    [self.tableView reloadData];
}


- (IBAction)operation2:(id)sender {
    //OK operation
	
    NewTaskViewController *newTaskView = [[NewTaskViewController alloc] init];
    newTaskView.delegate = self;
    [self.navigationController pushViewController:newTaskView animated:YES];	
}
- (IBAction)operation1:(id)sender {
    //Cancel operation, navigate to mainscreen
    [self.navigationController popToRootViewControllerAnimated:YES];
	
    NewTaskViewController *newTaskView = [[NewTaskViewController alloc] init];
    newTaskView.delegate = self;
    [self.navigationController pushViewController:newTaskView animated:YES];	
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //TODO Domain binding
	NSInteger count = self.tasks.count;
    if(self.editing) {
        count = count + 1;
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    if (indexPath.row < self.tasks.count ) {
        self.task= [self.tasks objectAtIndex:indexPath.row];
        cell.textLabel.text = self.task.name;
        cell.detailTextLabel.text = self.task.date;

        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.textLabel.text = @"Add New Task";
        cell.detailTextLabel.text = @"";
        cell.editingAccessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


//TableView functions
 (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {

}

-(void)setEditing:(BOOL)editing animated:(BOOL) animated {

}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle) editing
 forRowAtIndexPath:(NSIndexPath *)indexPath {

}
//Searchbar functions
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    return YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{

}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{

}



