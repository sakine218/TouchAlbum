//
//  TemplateViewController.h
//  TouchAlbum
//
//  Created by 西林咲音 on 2015/07/15.
//  Copyright (c) 2015年 西林咲音. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemplateViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UIActionSheetDelegate> {
    IBOutlet UICollectionView *templateView;
    NSMutableArray *templateArray;
}


@end
