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
	self.title = @"some titlesaaaaaaa";

	TO DO!!!! Define all widgets!!! Call alloc init.
	TO DO!!!! Define all widgets!!! Call alloc init.
	TO DO!!!! Define all widgets!!! Call alloc init.
	//TODO change!
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight) style:UITableViewStylePlain];
    self.tableView.rowHeight = 50;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
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
    Check for all actions!! TODO --> template, webservice, cancel, all actions
	NewTaskViewController *newTaskView = [[NewTaskViewController alloc] init];
    newTaskView.delegate = self;
    [self.navigationController pushViewController:newTaskView animated:YES];
	
}
- (IBAction)operation1:(id)sender {
    Check for all actions!! TODO --> template, webservice, cancel, all actions
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

