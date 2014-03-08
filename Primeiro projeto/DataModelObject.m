//
//  DataModelObject.m
//  FBSample
//
//  Created by Bharath G M on 10/27/13.
//  Copyright (c) 2013 Bharath G M. All rights reserved.
//

#import "DataModelObject.h"

@implementation DataModelObject

- (id)init
{
    self = [super init];
    if (self)
    {
        self.name = nil;
        self.message = nil;
        self.picture = nil;
    }
    return self;
}
@end
