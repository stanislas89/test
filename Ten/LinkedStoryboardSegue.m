//
//  LinkedStoryboardSegue.m
//  Ten
//
//  Created by Stanislas Duthoit on 14/04/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "LinkedStoryboardSegue.h"

@implementation LinkedStoryboardSegue

+ (UIViewController *)sceneNamed:(NSString *)identifier
{
    NSArray *info = [identifier componentsSeparatedByString:@"@"];
    
    NSString *storyboard_name = info[1];
    NSString *scene_name = info[0];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboard_name
                                                         bundle:nil];
    UIViewController *scene = nil;
    
    if (scene_name.length == 0) {
        scene = [storyboard instantiateInitialViewController];
    }
    else {
        scene = [storyboard instantiateViewControllerWithIdentifier:scene_name];
    }
    
    return scene;
}

- (id)initWithIdentifier:(NSString *)identifier
                  source:(UIViewController *)source
             destination:(UIViewController *)destination
{
    return [super initWithIdentifier:identifier
                              source:source
                         destination:[LinkedStoryboardSegue sceneNamed:identifier]];
}

- (void)perform
{
    UIViewController *source = (UIViewController *)self.sourceViewController;
    [source.navigationController pushViewController:self.destinationViewController
                                           animated:YES];
}

@end
