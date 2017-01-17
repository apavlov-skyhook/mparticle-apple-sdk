//
//  MPForwardQueueItem.m
//
//  Copyright 2016 mParticle, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "MPForwardQueueItem.h"
#import "MPEvent.h"
#import "MPCommerceEvent.h"
#import "MPIConstants.h"
#import "MPKitFilter.h"
#import "MPKitExecStatus.h"
#import "MPForwardQueueParameters.h"

@implementation MPForwardQueueItem

@synthesize queueItemType = _queueItemType;

- (nullable instancetype)initWithSelector:(nonnull SEL)selector parameters:(nullable MPForwardQueueParameters *)parameters messageType:(MPMessageType)messageType completionHandler:(void (^ _Nonnull)(_Nonnull id<MPKitProtocol> kit, MPForwardQueueParameters * _Nullable forwardParameters, MPKitFilter * _Nullable forwardKitFilter, MPKitExecStatus * _Nonnull * _Nonnull execStatus))completionHandler {
    self = [super init];
    if (!self || !selector || !completionHandler) {
        return nil;
    }

    SEL logCommerceEventSelector = @selector(logCommerceEvent:);
    SEL logEventSelector = @selector(logEvent:);
    
    if (selector == logEventSelector) {
        _queueItemType = MPQueueItemTypeEvent;
        
        if (MPIsNull(parameters) || parameters.count == 0 || MPIsNull(parameters[0])) {
            return nil;
        }
    } else if (selector == logCommerceEventSelector) {
        _queueItemType = MPQueueItemTypeEcommerce;
        
        if (MPIsNull(parameters) || parameters.count == 0 || MPIsNull(parameters[0])) {
            return nil;
        }
    } else {
        _queueItemType = MPQueueItemTypeGeneralPurpose;
    }
    
    _selector = selector;
    _completionHandler = [completionHandler copy];
    _queueParameters = parameters;
    _messageType = messageType;
    
    return self;
}

@end
