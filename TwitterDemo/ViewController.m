//
//  ViewController.m
//  TwitterDemo
//
//  Created by Tops on 6/22/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];    
    [[FHSTwitterEngine sharedEngine] permanentlySetConsumerKey:@"Xg3ACDprWAH8loEPjMzRg" andSecret:@"9LwYDxw1iTc6D9ebHdrYCZrJP4lJhQv5uf4ueiPHvJ0"];
    [[FHSTwitterEngine sharedEngine] setDelegate:self];
    [[FHSTwitterEngine sharedEngine] loadAccessToken];
    
}
- (IBAction)btnLoginCK:(id)sender {
    UIViewController *login =[[FHSTwitterEngine sharedEngine] loginControllerWithCompletionHandler:^(BOOL success) {
        if (success) {
            NSLog(@"success");
        }
    }];
    [self presentViewController:login animated:YES completion:Nil];
    
}

- (IBAction)btnFriendsCK:(id)sender {
    
    if ([[FHSTwitterEngine sharedEngine] isAuthorized])
    {
        
        NSString * username = [FHSTwitterEngine sharedEngine].authenticatedUsername;
        [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
        NSMutableDictionary *   dict1 = [[FHSTwitterEngine sharedEngine]listFriendsForUser:username isID:NO withCursor:@"-1"];
        NSLog(@"====> %@",[dict1 objectForKey:@"users"] );        // Here You get all the data
        NSMutableArray *array=[dict1 objectForKey:@"users"];
        for(int i=0;i<[array count];i++)
        {
            NSLog(@"names:%@",[[array objectAtIndex:i]objectForKey:@"name"]);
            NSLog(@"description:%@",[[array objectAtIndex:i]objectForKey:@"description"]);
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        
    }
   
}

- (IBAction)btnFollowerCK:(id)sender {
    if ([[FHSTwitterEngine sharedEngine] isAuthorized])
    {
        NSString *username = [[FHSTwitterEngine sharedEngine] authenticatedUsername];
        
        NSMutableDictionary *dic1 =[[FHSTwitterEngine sharedEngine] listFollowersForUser:username isID:NO withCursor:@"-1"];
        NSMutableArray *array=[dic1 objectForKey:@"users"];
         NSLog(@"====> %@",[dic1 objectForKey:@"users"] );
        for(int i=0;i<[array count];i++)
        {
            NSLog(@"names:%@",[[array objectAtIndex:i]objectForKey:@"name"]);
            NSLog(@"description:%@",[[array objectAtIndex:i]objectForKey:@"description"]);
        }
    }
}

- (IBAction)btn1CK:(id)sender {
    if ([[FHSTwitterEngine sharedEngine] isAuthorized])
    {
        NSString *username = [[FHSTwitterEngine sharedEngine] authenticatedUsername];
        NSDictionary *dicDATA = [[FHSTwitterEngine sharedEngine] postTweet:@"hello"];
         
    }
}
- (IBAction)btn2CK:(id)sender {
    if ([[FHSTwitterEngine sharedEngine] isAuthorized])
    {
        NSString *username = [[FHSTwitterEngine sharedEngine] authenticatedUsername];
        
    }
}
@end
