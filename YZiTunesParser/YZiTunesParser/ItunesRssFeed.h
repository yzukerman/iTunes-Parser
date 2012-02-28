//
//  ItunesRssFeed.h
//  YZiTunesParser
//
//  Created by Yuval Zukerman on 2/27/12.
//  Copyright (c) 2012 Molecular, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItunesRssFeedItem.h"

@interface ItunesRssFeed : NSObject

    @property (strong, nonatomic) NSString* title;
    @property (strong, nonatomic) NSString* link;
    @property (strong, nonatomic) NSString* description;
    @property (strong, nonatomic) NSString* language;
    @property (strong, nonatomic) NSDate* pubDate;
    @property (strong, nonatomic) NSString* iTunesSummary;
    @property (strong, nonatomic) NSString* iTunesAuthor;
    // prevent an episode or podcast from appearing 
    @property (strong, nonatomic) NSString* iTunesBlock;
    // Category column and in iTunes Music Store Browse
    // [Array of NSString, each record containing a category]
    @property (strong, nonatomic) NSArray* categories;
    // search keywords
    @property (strong, nonatomic) NSArray* keywords;
    
    // parental advisory graphic in Name column
    @property (nonatomic) BOOL isItunesExplicit;
    @property (strong, nonatomic) NSString* mediaRating;
    
    // feed items, of type ItunesRssFeedItem
    @property (strong, nonatomic) NSArray* feedItems;
    
    
@end
