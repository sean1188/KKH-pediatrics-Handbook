//
//  crisisVC.m
//  KKH app
//
//  Created by Sean Lim on 25/11/16.
//  Copyright © 2016 ;. All rights reserved.
//

#import "crisisVC.h"
#import "CrisisCell.h"
@interface crisisVC ()

@end

@implementation crisisVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setcolor];
    [_weight setTitle:[NSString stringWithFormat:@"Weight : %@KG",[[NSUserDefaults standardUserDefaults] objectForKey:@"Cweight"]] forState:UIControlStateNormal];
    
}
-(void) setcolor{
    for (UIView *view in _secondaryViewws) {
        [view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
    }
    [self.view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"primaryColor"]]];
    for (UIView *views in _primaryViewws) {
        [views setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]];
    }

}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CrisisCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.layer.cornerRadius = 15.0f;
    [cell.index setText:[NSString stringWithFormat:@"%li", indexPath.row +1]];
    cell.index.textColor = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]];
    cell.name.textColor = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]];
    switch (indexPath.row) {
        case 0:
            [cell.name setText:@"Basic Life Support"];
            break;
        case 1:
            [cell.name setText:@"Cardiac Arrest"];
            break;
        case 2:
            [cell.name setText:@"LA Toxicity"];
            break;
        case 3:
            [cell.name setText:@"Hyperkalaemia"];
            break;
        case 4:
            [cell.name setText:@"Malignant Hyperthermia"];
            break;
        case 5:
            [cell.name setText:@"Anaphylaxis"];
            break;
        default:
            break;
    }
    return cell;
    
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CGRectGetWidth(collectionView.frame), 60);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"BLS" sender:self];
    }
    else if (indexPath.row == 1){
        [self performSegueWithIdentifier:@"CA" sender:self];
    }
    
}


- (IBAction)editWeight:(id)sender {
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
