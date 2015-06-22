//
//  ViewController.h
//  TwitterDemo
//
//  Created by Tops on 6/22/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FHSTwitterEngine.h"

@interface ViewController : UIViewController<FHSTwitterEngineAccessTokenDelegate>
{
    
}
- (IBAction)btnLoginCK:(id)sender;
- (IBAction)btnFriendsCK:(id)sender;
- (IBAction)btnFollowerCK:(id)sender;
- (IBAction)btn1CK:(id)sender;
- (IBAction)btn2CK:(id)sender;


@end

