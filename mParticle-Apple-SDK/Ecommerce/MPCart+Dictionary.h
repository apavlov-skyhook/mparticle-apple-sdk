//
//  MPCart+Dictionary.h
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

@interface MPCart(Dictionary)

- (void)addProducts:(nonnull NSArray<MPProduct *> *)products logEvent:(BOOL)logEvent updateProductList:(BOOL)updateProductList;
- (nullable NSDictionary<NSString *, __kindof NSArray *> *)dictionaryRepresentation;
- (void)removeProducts:(nonnull NSArray<MPProduct *> *)products logEvent:(BOOL)logEvent updateProductList:(BOOL)updateProductList;

@end
