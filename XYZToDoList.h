//
//  XYZToDoList.h
//  ToDoList
//
//  Created by Neeraj on 6/5/14.
//  Copyright (c) 2014 SubtleCreation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZToDoList : NSObject
    @property NSString *itemName;
    @property BOOL completed;
    @property (readonly) NSDate *creationDate;
@end
