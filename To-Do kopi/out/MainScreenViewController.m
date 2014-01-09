#import "MainScreenViewController.h"

@interface MainScreenViewController ()

@end

@implementation MainScreenViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
	    
    

    self.listTableView = [[UITableView alloc]init];
    self.listTableView.rowHeight = 50;
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    self.listTableView.scrollEnabled = YES;
    self.listSearchBar = [[UISearchBar alloc]init];
    self.listSearchBar.delegate = self;
    self.listSearchBar.frame = CGRectMake(0, 0, 0, 50);
    [self.view addSubview:self.listSearchBar];
    self.listTableView.frame = CGRectMake(0, 0+50, 0, 0-50);
    [self.view addSubview:self.listTableView];
    

}

- (void)reloadTableData:(NewTaskViewController *)controller{
    self.tasks = [self.dbManager getAllTasks];
    [self.tableView reloadData];
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


