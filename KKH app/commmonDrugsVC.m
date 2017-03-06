//
//  commmonDrugsVC.m
//  KKH app
//
//  Created by Seannn! on 28/2/17.
//  Copyright © 2017 tangentinc. All rights reserved.
//

#import "commmonDrugsVC.h"
#import "KKH_app-Swift.h"
#import "RADataObject.h"
#import "RATableViewCell.h"
#import <RATreeView/RATreeView.h>


@interface commmonDrugsVC ()<RATreeViewDelegate, RATreeViewDataSource>{
    DrugCalculationsManager *manager;
}

@property (weak, nonatomic) IBOutlet UIView *placeholder;


@end

@implementation commmonDrugsVC

NSMutableArray *dataTree;
RATreeView *treeView;

-(UIStatusBarStyle) preferredStatusBarStyle {
    return  UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *drugArray = [[NSMutableDictionary alloc] init];

    int weight = [[NSUserDefaults standardUserDefaults] integerForKey:@"DCweight"];
    drugArray = [[[DrugCalculationsManager alloc] initWithWeight:weight] getDrugList];
    NSLog(@"%@", drugArray);
    

    NSMutableArray *Drugs = [[NSMutableArray alloc] init];

   
    for (NSString *drug in drugArray) {
        NSMutableArray *paths = [[NSMutableArray alloc] init];
        for (NSString *path  in [drugArray objectForKey:drug]) {
            
            RADataObject *amount = [RADataObject dataObjectWithName:[NSString stringWithFormat:@"Amount: %@",[[[drugArray objectForKey:drug] objectForKey:path] objectForKey:@"AMOUNT"]]  children:nil];
            RADataObject *Dosekg = [RADataObject dataObjectWithName:[NSString stringWithFormat:@"Dose/KG: %@",[[[drugArray objectForKey:drug] objectForKey:path] objectForKey:@"DOSE/KG"]] children:nil];
            RADataObject *unit = [RADataObject dataObjectWithName: [NSString stringWithFormat:@"Unit: %@", [[[drugArray objectForKey:drug] objectForKey:path] objectForKey:@"UNIT"] ]children:nil];
            NSLog(@"%@, %@, %@",[[[drugArray objectForKey:drug] objectForKey:path] objectForKey:@"AMOUNT"],[[[drugArray objectForKey:drug] objectForKey:path] objectForKey:@"DOSE/KG"], [[[drugArray objectForKey:drug] objectForKey:path] objectForKey:@"UNIT"]);
            RADataObject *pathOBJ = [RADataObject dataObjectWithName:path children:@[amount,Dosekg,unit]];
            [paths addObject:pathOBJ];
            
             
        }
        RADataObject *drugObject = [RADataObject dataObjectWithName:drug children:paths];
        [Drugs addObject:drugObject];
    }
    
    dataTree = Drugs;
    
    
    treeView = [[RATreeView alloc] initWithFrame:_placeholder.bounds];
    treeView.delegate = self;
    treeView.dataSource = self;
    treeView.separatorColor = [UIColor clearColor];
    [treeView registerNib:[UINib nibWithNibName:NSStringFromClass([RATableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([RATableViewCell class])];
    [_placeholder addSubview:treeView];
    [treeView reloadData];
    
}

//MARK: - ratreeview
- (NSInteger)treeView:(RATreeView *)treeView numberOfChildrenOfItem:(id)item
{
    if (item == nil) {
        return [dataTree count];
    }
    
    RADataObject *data = item;
    NSLog(@"%i",[data.children count]);
    return [data.children count];
}

-(CGFloat)treeView:(RATreeView *)treeView heightForRowForItem:(id)item{
    return 60;
}
- (UITableViewCell *)treeView:(RATreeView *)treeView cellForItem:(id)item {
    RADataObject *data = item;
    RATableViewCell *cell = [treeView dequeueReusableCellWithIdentifier:NSStringFromClass([RATableViewCell class])];
    [cell.title setText:data.name];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]];
    switch ([treeView levelForCellForItem:item]) {
        case 0:
            cell.leftMargin.constant = 5;
            [cell.morelabel setText:@"+"];
            [cell.morelabel setFont:[UIFont fontWithName:cell.morelabel.font.fontName size:23]];
             [cell.title setFont:[UIFont fontWithName:cell.title.font.fontName size:23]];
            
            break;
        case 1:
            cell.leftMargin.constant = 20;
            [cell.morelabel setText:@"Tap for details"];
            [cell.morelabel setFont:[UIFont fontWithName:cell.morelabel.font.fontName size:14]];
            [cell.title setFont:[UIFont fontWithName:cell.title.font.fontName size:19]];
            break;
        case 2:
            cell.leftMargin.constant = 30;
            [cell.morelabel setText:@""];
            [cell.title setFont:[UIFont fontWithName:cell.title.font.fontName size:17]];

            break;

        default:
            break;
    }
    
    cell.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        cell.alpha = 1;
    }];
    return cell;
}

- (id)treeView:(RATreeView *)treeView child:(NSInteger)index ofItem:(id)item
{
    RADataObject *data = item;
    if (item == nil) {
        return [dataTree objectAtIndex:index];
    }
    
    return data.children[index];
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
