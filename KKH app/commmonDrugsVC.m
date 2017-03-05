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

    int weight = [[NSUserDefaults standardUserDefaults] integerForKey:@""];
    drugArray = [[[DrugCalculationsManager alloc] initWithWeight:69] getDrugList];
    NSLog(@"%@", drugArray);
    

    NSMutableArray *Drugs = [[NSMutableArray alloc] init];

   
    for (NSString *drug in drugArray) {
        NSMutableArray *paths = [[NSMutableArray alloc] init];
        for (NSString *path  in [drugArray objectForKey:drug]) {
            RADataObject *amount = [RADataObject dataObjectWithName:[[[drugArray objectForKey:drug] objectForKey:path] objectForKey:@"AMOUNT"]  children:nil];
            RADataObject *Dosekg = [RADataObject dataObjectWithName:[[[drugArray objectForKey:drug] objectForKey:path] objectForKey:@"DOSE/KG"] children:nil];
            RADataObject *unit = [RADataObject dataObjectWithName:  [[[drugArray objectForKey:drug] objectForKey:path] objectForKey:@"UNIT"] children:nil];
            NSLog(@"%@, %@, %@",[[[drugArray objectForKey:drug] objectForKey:path] objectForKey:@"AMOUNT"],[[[drugArray objectForKey:drug] objectForKey:path] objectForKey:@"DOSE/KG"], [[[drugArray objectForKey:drug] objectForKey:path] objectForKey:@"UNIT"]);
            RADataObject *pathOBJ = [RADataObject dataObjectWithName:path children:@[amount,Dosekg,unit]];
            [paths addObject:pathOBJ];
            
             
        }
        RADataObject *drugObject = [RADataObject dataObjectWithName:drug children:paths];
        [Drugs addObject:drugObject];
    }
    
    dataTree = Drugs;
    
    
    treeView = [[RATreeView alloc] initWithFrame:self.view.bounds];
    treeView.delegate = self;
    treeView.dataSource = self;
    [self.view addSubview:treeView];
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

- (UITableViewCell *)treeView:(RATreeView *)treeView cellForItem:(id)item {
    RATableViewCell *cell = [treeView dequeueReusableCellWithIdentifier:NSStringFromClass([RATableViewCell class])];
    
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


@end
