//
//  IMHUserDefaultsManager.h
//  imhere
//
//  Created by Aci Cartagena on 5/2/15.
//  Copyright (c) 2015 imhere. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMHUserDefaultsManager : NSObject

+ (IMHUserDefaultsManager *)sharedManager;

@property (strong, nonatomic) NSString *userId;

@end
