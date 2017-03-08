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
    CommonDrugCalculationsManager *manager;
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
    drugArray = [CommonDrugCalculationsManager loadDataWithWeight:weight];
    NSLog(@"%@", drugArray);
    
    
    NSMutableArray *Drugs = [[NSMutableArray alloc] init];
    
    
    for (NSString *drug in drugArray) {
        NSMutableArray *paths = [[NSMutableArray alloc] init];
        for (NSString *path  in [drugArray objectForKey:drug]) {
            NSMutableArray *methods     = [[NSMutableArray alloc] init];
            
            for (NSString *method in [[drugArray objectForKey:drug] objectForKey:path]) {
                
                float doseInt           = [[[[[drugArray objectForKey:drug] objectForKey:path] objectForKey:method] objectForKey:@"dose"] integerValue] * weight;
                RADataObject *dose      = [RADataObject dataObjectWithName:[NSString stringWithFormat:@"Dose: %0.1f",doseInt]  children:nil];
                
                RADataObject *content;
                if ([[[[drugArray objectForKey:drug] objectForKey:path] objectForKey:@"remarks"] isEqualToString:@""]) {
                    content             = [RADataObject dataObjectWithName:[[[[drugArray objectForKey:drug] objectForKey:path] objectForKey:method]objectForKey:@"content"] children:nil];
                }else{
                    content             = [RADataObject dataObjectWithName:[[[[drugArray objectForKey:drug] objectForKey:path] objectForKey:method]objectForKey:@"remarks"] children:nil];
                }
                
                RADataObject *unit      = [RADataObject dataObjectWithName: [NSString stringWithFormat:@"Unit: %@", [[[[drugArray objectForKey:drug] objectForKey:path] objectForKey:method]objectForKey:@"unit"] ]children:nil];
                RADataObject *methodObj = [RADataObject dataObjectWithName:method children:@[dose,content,unit]];
                [methods addObject:methodObj];
            }
            RADataObject *pathObj       = [RADataObject dataObjectWithName:path children:methods];
            [paths addObject:pathObj];
        }
        RADataObject *drugObject        = [RADataObject dataObjectWithName:drug children:paths];
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
    NSLog(@"%lu",(unsigned long)[data.children count]);
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
            [cell.morelabel setText:@"-"];
            [cell.morelabel setFont:[UIFont fontWithName:cell.morelabel.font.fontName size:23]];
            [cell setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
            
            [cell.title setFont:[UIFont fontWithName:cell.title.font.fontName size:19]];
            break;
        case 2:
            cell.leftMargin.constant = 30;
            [cell.morelabel setText:@"Tap for details"];
            [cell.morelabel setFont:[UIFont fontWithName:cell.morelabel.font.fontName size:11]];
            [cell.title setFont:[UIFont fontWithName:cell.title.font.fontName size:17]];
            [cell setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
            
            break;
        case 3:
            cell.leftMargin.constant = 40;
            [cell.morelabel setText:@""];
            [cell setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
            [cell.title setFont:[UIFont fontWithName:cell.title.font.fontName size:15]];
            
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

-(UITableViewCellEditingStyle)treeView:(RATreeView *)treeView editingStyleForRowForItem:(id)item{
    return UITableViewCellEditingStyleNone;
    
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
