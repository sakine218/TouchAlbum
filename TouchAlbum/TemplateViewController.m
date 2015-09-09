//
//  TemplateViewController.m
//  TouchAlbum
//
//  Created by 西林咲音 on 2015/07/15.
//  Copyright (c) 2015年 西林咲音. All rights reserved.
//

#import "TemplateViewController.h"

@interface TemplateViewController ()

@end

@implementation TemplateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    templateView.dataSource = self;
    templateView.delegate = self;
    
    if (!templateArray) {
        templateArray = [[NSMutableArray alloc] init];
    }
    
    /*
     NSDictionary *temp1 = @{@"title" : @"a",
     @"bgImageName" : @"a",
     @"a" : @"b",
     @"a" : @"a",
     @"a" : @"a",
     @"a" : @"a"};
     
     [templateArray addObject:temp1];
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.layer.masksToBounds = NO; //必須
    cell.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
    cell.layer.shadowOpacity = 0.9f;
    cell.layer.shadowRadius = 2.0f;
    
    UIImageView *bgImageView = (UIImageView *)[cell viewWithTag:1];
    UIImageView *titleImageView = (UIImageView *)[cell viewWithTag:2];
    
    //bgImageView.image = [UIImage imageNamed:@"simple.png"];
    
    bgImageView.backgroundColor = [UIColor redColor];
    titleImageView.image = [UIImage imageNamed:@""];
    
    titleImageView.layer.shouldRasterize = YES;  //レイヤーをラスタライズする
    titleImageView.layer.rasterizationScale = 0.2;  //ラスタライズ時の縮小率
    titleImageView.layer.minificationFilter = kCAFilterTrilinear;
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%d",indexPath.row);
    //[self showActionSheet];
    //[self performSegueWithIdentifier:@"toSource" sender:nil];
}

/*
 - (void)showActionSheet {
 UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"画像を選ぶ"
 delegate:self
 cancelButtonTitle:@"キャンセル"
 destructiveButtonTitle:nil
 otherButtonTitles:@"写真を撮る", @"カメラロールから選択する", nil];
 [actionSheet showInView:self.view];
 }
 
 -(void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
 QBImagePickerController *imagePickerController = [QBImagePickerController new];
 imagePickerController.delegate = self;
 imagePickerController.allowsMultipleSelection = YES;
 
 switch (buttonIndex) {
 case 0:
 
 // １番目のボタンが押されたときの処理を記述する
 break;
 case 1:
 [self presentViewController:imagePickerController animated:YES completion:NULL];
 break;
 case 2:
 // ３番目のボタンが押されたときの処理を記述する
 break;
 }
 
 }
 
 - (void)qb_imagePickerController:(QBImagePickerController *)imagePickerController didFinishPickingAssets:(NSArray *)assets {
 for (PHAsset *asset in assets) {
 // Do something with the asset
 }
 
 [self dismissViewControllerAnimated:YES completion:NULL];
 }
 
 - (void)qb_imagePickerControllerDidCancel:(QBImagePickerController *)imagePickerController {
 [self dismissViewControllerAnimated:YES completion:NULL];
 }
 */


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
