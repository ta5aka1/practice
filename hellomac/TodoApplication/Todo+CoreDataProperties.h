//
//  Todo+CoreDataProperties.h
//  
//
//  Created by Takayasu Sakai on 2016/01/24.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Todo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Todo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *item;

@end

NS_ASSUME_NONNULL_END
