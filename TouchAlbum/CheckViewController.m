//
//  CheckViewController.m
//  TouchAlbum
//
//  Created by 西林咲音 on 2015/08/25.
//  Copyright (c) 2015年 西林咲音. All rights reserved.
//

#import "CheckViewController.h"

#import "NextViewController.h"
#import "Next2ViewController.h"
#import "Next3ViewController.h"
#import "Next4ViewController.h"
@interface CheckViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation CheckViewController {
    IBOutlet UICollectionView *selectedPhotoView;
    NSArray *imageArray;
    int randNumber;
    IBOutlet UIScrollView *scrollView;
    NSMutableArray *buttonImageArray;
}

- (IBAction)getRandomNumber {
    NSMutableArray *array = [NSMutableArray new];
    //------------
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    int number = (int)[ud integerForKey:@"number"];
    NSLog(@"SAVED INT %d", number);
    while(number) {
        randNumber = (int)arc4random_uniform(4) + 1;
        NSLog(@"%d",randNumber);
        
        if (number <= 4){
            [array addObject:[NSNumber numberWithInteger:number]];
            
            NSLog(@"RETUREND");
            NSLog(@"array == %@", array);
            return;
        }else {
            if (randNumber == 1) {
                NextViewController *nextVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"NextViewController"];
                
                nextVC.randNum = randNumber;
                [self.navigationController pushViewController:nextVC animated:YES];
            }else if (randNumber == 2) {
                Next2ViewController *next2VC =  [self.storyboard instantiateViewControllerWithIdentifier:@"Next2ViewController"];
                
                next2VC.randNum = randNumber;
                [self.navigationController pushViewController:next2VC animated:YES];
            }else if (randNumber == 3){
                Next3ViewController *next3VC =  [self.storyboard instantiateViewControllerWithIdentifier:@"Next3ViewController"];
                
                next3VC.randNum = randNumber;
                [self.navigationController pushViewController:next3VC animated:YES];
            }else if (randNumber == 4){
                Next4ViewController *next4VC =  [self.storyboard instantiateViewControllerWithIdentifier:@"Next4ViewController"];
                    next4VC.randNum = randNumber;
                [self.navigationController pushViewController:next4VC animated:YES];
            }
            
            number = number - randNumber;
            [array addObject: [NSNumber numberWithInteger:randNumber]];
            
            NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
            [ud setInteger:number forKey:@"number"];
            NSLog(@"SAVED INT %d", number);
            [ud synchronize];
        }
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    selectedPhotoView.delegate = self;
    selectedPhotoView.dataSource = self;
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    imageArray = [NSKeyedUnarchiver unarchiveObjectWithData:[ud objectForKey:@"images"]];
    [self.navigationController setNavigationBarHidden:NO animated:NO]; // ナビゲーションバー表示
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return imageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    imageView.image = [imageArray[indexPath.row] valueForKey:@"UIImagePickerControllerOriginalImage"];
    
    return cell;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
