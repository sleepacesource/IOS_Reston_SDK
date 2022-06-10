//
//  RestonAutoCollection.h
//  Reston
//
//  Created by San on 26/11/2020.
//  Copyright © 2020 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RestonAutoCollection : NSObject

@property (nonatomic,assign) UInt8 valid;
@property (nonatomic,assign) UInt8 hour;
@property (nonatomic,assign) UInt8 minute;
@property (nonatomic,assign) UInt8 repeat;

@end

NS_ASSUME_NONNULL_END
