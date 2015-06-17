//
//  Settings.m
//  Tipd
//
//  Created by Crt Tsai on 6/12/15.
//  Copyright (c) 2015 Crt Tsai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Settings.h"

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}
