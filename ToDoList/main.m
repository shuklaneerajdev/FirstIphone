//
//  main.m
//  ToDoList
//
//  Created by Neeraj on 6/4/14.
//  Copyright (c) 2014 SubtleCreation. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    // what can @autorelease pool be? I think it should be something to do with event based managing
    // of the application.
    /*
     It actually is for managing memory of the application.
     */
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
