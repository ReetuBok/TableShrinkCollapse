//
//  MainController.m
//  Template1
//
//  Created by Reetu Raj on 12/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainController.h"


@implementation MainController
@synthesize  MIMtableView;
@synthesize  MIMtoolbar;
@synthesize  MIMsegmentControl;
@synthesize  MIMsearchBar;
@synthesize  MIMview;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    //Init the Arrays of the tableview
    sectionArray=[[NSMutableArray alloc]initWithObjects:@"Section 1",@"Section 2",@"Section 3",@"Section 4",@"Section 5", nil];
    cellArray=[[NSMutableArray alloc]init];
    cellCount=[[NSMutableArray alloc]init];
    
    for(int i=0;i< [sectionArray count];i++)
    {
        NSMutableArray *_cellArray=[[NSMutableArray alloc]initWithObjects:@" Row 1",@" Row 2",@" Row 3",@" Row 4",@" Row 5", nil];
        [cellArray addObject:_cellArray];
        [cellCount addObject:[NSNumber numberWithInt:[_cellArray count]]];
    }
    
    [MIMtableView reloadData];
   
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

#pragma mark-
#pragma mark Table Delegate Methods
#pragma mark -

-(IBAction)MIMeditButtonPressed:(id)sender
{
    if([[(UIBarButtonItem *)sender title]  isEqualToString:@"Edit"]){
        [(UIBarButtonItem *)sender setTitle:@"Done"];
        [(UIBarButtonItem *)sender setStyle:UIBarButtonItemStyleDone];
    }else{
        [(UIBarButtonItem *)sender setTitle:@"Edit"];
        [(UIBarButtonItem *)sender setStyle:UIBarButtonItemStyleBordered];
    }
    
    [MIMtableView setEditing:![MIMtableView isEditing]];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  rowHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return sectionHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    //View with the button to expand and shrink and 
    //Label to display the Heading.
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 323, 44)];
    
    
    //Background Image
    UIImageView *headerBg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sectionBg.png"]];
    [headerView addSubview:headerBg];
    
    //Button
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 7, 30, 30);
    button.tag=section+1;
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"shrink.png"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"disclosure.png"] forState:UIControlStateSelected];
    
    if([[cellCount objectAtIndex:section] intValue]==0) button.selected=YES;
    else button.selected=NO;
    
    [headerView addSubview:button];
    
    //Label
    UILabel *headerTitle=[[UILabel alloc]initWithFrame:CGRectMake(30, 7, 300, 30)];
    [headerTitle setBackgroundColor:[UIColor clearColor]];
    [headerTitle setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]];
    [headerTitle setTextColor:[UIColor darkGrayColor]];
    [headerTitle setText:[sectionArray objectAtIndex:section]];
    [headerView addSubview:headerTitle];
    
    
    return  headerView;
}

-(IBAction)buttonClicked:(id)sender
{
    UIButton *button=(UIButton *)sender;
    NSInteger _index=[sender tag]-1;

    if(![button isSelected])
        [cellCount replaceObjectAtIndex:_index withObject:[NSNumber numberWithInt:0]];
    else
        [cellCount replaceObjectAtIndex:_index withObject:[NSNumber numberWithInt:[[cellArray objectAtIndex:_index]count]]];
    
    [MIMtableView reloadData];
    
}


//datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    

    return [sectionArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    


    return [[cellCount objectAtIndex:section] intValue];

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[[UITableViewCell alloc]  initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    
    //Add the Bg Image to the cell
    
    
    
    
    //Add the Label
    UILabel *cellTitle=[[UILabel alloc]initWithFrame:CGRectMake(15, 7, 300, 30)];
    [cellTitle setBackgroundColor:[UIColor clearColor]];
    [cellTitle setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]];
    [cellTitle setTextColor:[UIColor darkGrayColor]];
    [cellTitle setText:[[cellArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    [cell.contentView addSubview:cellTitle];
    
    return  cell;
    
    
}






- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  YES;
}


/*
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    
}


- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    
}
*/


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    

    
}



- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    

    //Do the reordering in the cellArray and print it.
    int _index1=sourceIndexPath.row;    int _section1=sourceIndexPath.section;
    int _index2=destinationIndexPath.row;    int _section2=destinationIndexPath.section;

    
    //index1 is going to swap with index2 if they are in same section
    if(_section1 == _section2)
    {
        NSString *_tempString1=[[cellArray objectAtIndex:_section1] objectAtIndex:_index1];
        NSString *_tempString2=[[cellArray objectAtIndex:_section1] objectAtIndex:_index2];
        
        [[cellArray objectAtIndex:_section1] replaceObjectAtIndex:_index1 withObject:_tempString2];
        [[cellArray objectAtIndex:_section1] replaceObjectAtIndex:_index2 withObject:_tempString1];
    }
    else 
    {
        // remove the item from section 1 and add it into section 2
        NSString *_tempString1=[[cellArray objectAtIndex:_section1] objectAtIndex:_index1];
        [[cellArray objectAtIndex:_section2] insertObject:_tempString1 atIndex:_index2];
        [[cellArray objectAtIndex:_section1] removeObjectAtIndex:_index1];
        
        //Change the cellCount values too !
        [cellCount replaceObjectAtIndex:_section1 withObject:[NSNumber numberWithInt:[[cellArray objectAtIndex:_section1] count]]];
        [cellCount replaceObjectAtIndex:_section2 withObject:[NSNumber numberWithInt:[[cellArray objectAtIndex:_section2] count]]];
    }
    
    NSLog(@"%@",cellArray);
    //Now its your job to save the updated cellArray into somewhere
    //so that changes can be reflected back when you open the app next time
    //and when it loads up the cellArray again on the screen.
}


#pragma mark-
#pragma mark ToolBarButton Methods
#pragma mark -
-(IBAction)savePressed:(id)sender{

}
-(IBAction)printPressed:(id)sender{


}
@end
