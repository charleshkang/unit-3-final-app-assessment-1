//
//  C4QCatFactDetailViewController.m
//  unit-3-final-app-assessment
//
//  Created by Michael Kavouras on 12/18/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactsDetailViewController.h"
#import <AFNetworking/AFNetworking.h>

#define CAT_GIF_URL @"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC";

@interface C4QCatFactsDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *catFactLabel;
@property (weak, nonatomic) IBOutlet UIImageView *catImageView;

@end

@implementation C4QCatFactsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.catFactLabel.text = self.catFact;
    self.catImageView.clipsToBounds = YES;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager GET:@"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSError *error;
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
        NSArray *data = [jsonDict objectForKey:@"data"];
        NSDictionary *object = [data objectAtIndex: (0 + arc4random() % (data.count - 0))];
        NSString *imageURL = [[[object objectForKey:@"images"]objectForKey:@"original_still"] objectForKey:@"url"];
        
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: imageURL]];
            if ( data == nil )
                return;
            dispatch_async(dispatch_get_main_queue(), ^{
                self.catImageView.image = [UIImage imageWithData:data];
                
            });
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"fail:%@", error);
    }];
}

@end