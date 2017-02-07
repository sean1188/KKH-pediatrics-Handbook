//
//  HyperK.m
//  KKH app
//
//  Created by Guest User on 2/12/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "HyperK.h"
#import "HyperKCollectionViewCell.h"

@interface HyperK ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation HyperK

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 7;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HyperKCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"cellxd" forIndexPath:indexPath];
    int weight = [[[NSUserDefaults standardUserDefaults] objectForKey:@"Cweight"] intValue];
    float Insulin = 0.1 *weight;
    float dextrose10 = 5 *weight;
    float dextrose50 = 1 *weight;
    float CG = 0.5 *weight;
    float Cacl = 0.2 *weight;
    float NAHCO3 = 1 *weight;
    //
    switch (indexPath.row) {
        case 0:
            [cell.title setText:@"Salbutamol 0.5-percent solution"];
            [cell.amount setText:@"Nebulise with 8 L oxygen"];
            [cell.message setText:@"< 25 KG: 2.5 MG in 4 ML of NS Q1-2H  > 25 KG: 5 MG in 4 ML of NS Q1-2H.	"];
            break;
        case 1:
            [cell.title setText:@"Regular Insulin (Actrapid)"];
            [cell.amount setText:[NSString stringWithFormat:@"IV, %0.1f IU",Insulin]];
            [cell.message setText:@"Onset 15-20 min for 4-6 h, administer together with DEXTROSE, 1 IU to every 5 g glucose, administer in 1 IU/ML dilution, MAX: 10 IU per dose, check H/C; may cause hypoglycaemia, may be repeated."];
            break;
        case 2:
            [cell.title setText:@"Dextrose 10-Percent"];
            [cell.amount setText:[NSString stringWithFormat:@"IV, %0.1f ML",dextrose10]];
            [cell.message setText:@"Administer together with INSULIN."];
            break;
        case 3:
            [cell.title setText:@"Dextrose 50-Percent"];
            [cell.amount setText:[NSString stringWithFormat:@"IV, %0.1f ML",dextrose50]];
            [cell.message setText:@"Administer via large bore peripheral IV or central venous access, administer together with insulin "];
            break;
        case 4:
            [cell.title setText:@"10-Percent Calcium Gluconate"];
            [cell.amount setText:[NSString stringWithFormat:@"IV, %0.1f ML",CG]];
            [cell.message setText:@"Onset 5-10 min for 30-60 min, may cause hypercalcaemia & tissue necrosis may be repeated."];
            break;
        case 5:
            [cell.title setText:@"10-Percent Calcium Chloride"];
            [cell.amount setText:[NSString stringWithFormat:@"IV, %0.1f ML",Cacl]];
            [cell.message setText:@"-"];
            break;
        case 6:
            [cell.title setText:@"4-percent NaHCO3"];
            [cell.amount setText:[NSString stringWithFormat:@"IV, %0.1f ML",NAHCO3]];
            [cell.message setText:@"Onset 15 mins for 1-2 Hr, give over 10 min. DO NOT mix with Calcium, Max: 50 mmol/dose."];
            break;
            
        default:
            break;
    }
    //
    cell.backgroundColor = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]];
    cell.layer.cornerRadius = 10;
    return cell;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
}

-(void) setcolor {
    for (UIView *view in _secondaryViewHK) {
        [view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
    }
    [self.view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"primaryColor"]]];
    [_instructView setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"primaryColor"]]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setcolor];
    [_collectionView setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]];
    [_weightLabel setText:[NSString stringWithFormat:@"%@ KG", [[NSUserDefaults standardUserDefaults] objectForKey:@"Cweight"]]];
    _treatmentB.layer.cornerRadius = 15.0f;
    _managementAlgorithm_Button.layer.cornerRadius = 15.0f;
    _checkListView.layer.cornerRadius = 10.0f;
    _AlgorithmBlur.alpha = 0; _instructView.alpha = 0; _checkListView.alpha = 0; _algorithmView.alpha = 0; _blurViewBack.alpha = 0;
    _algorithmView.delegate = self;
    _algorithmView.contentSize = _algorithmImg.frame.size;
    _algorithmView.scrollEnabled = YES;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.algorithmImg;
}


- (IBAction)managementAlgorithm_Pressed:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _AlgorithmBlur.alpha = 1;
        _algorithmView.alpha = 1;
        _blurViewBack.alpha = 1;
    }];
}

- (IBAction)treatment:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _AlgorithmBlur.alpha = 1;
        _checkListView.alpha = 1;
    }];
}

- (IBAction)checkListNext_Pressed:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _checkListView.alpha = 0;
    }completion:^(BOOL s ){
        [UIView animateWithDuration:0.3 animations:^{
            _AlgorithmBlur.alpha = 0;
            _instructView.alpha = 1;
        }];
    }];
}

- (IBAction)blurViewBack:(id)sender {
    //back from management algorithm
    [UIView animateWithDuration:0.3 animations:^{
        _AlgorithmBlur.alpha = 0;
        _algorithmView.alpha = 0;
        _blurViewBack.alpha = 0;
    }];
}

- (IBAction)back:(id)sender {
    if (_instructView.alpha == 1) {
        [UIView animateWithDuration:0.3 animations:^{
            _instructView.alpha = 0;
        }];
    }
    else{
        [self dismissViewControllerAnimated:YES completion:nil];}
}

#pragma mark - checklist methods
- (IBAction)check1a:(id)sender{
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_c1 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_c1 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}
- (IBAction)check2:(id)sender{
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_c2 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_c2 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}
- (IBAction)check3:(id)sender{
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_c3 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_c3 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
    
}
- (IBAction)check4:(id)sender{
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_c4 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_c4 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
    
}
- (IBAction)check5:(id)sender{
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_c5 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_c5 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
    
}
- (IBAction)check6:(id)sender{
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_c6 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_c6 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
    
}
- (IBAction)check7:(id)sender{
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_c7 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_c7 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
    
}
- (IBAction)check8:(id)sender{
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_c8 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_c8 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
    
}
@end
