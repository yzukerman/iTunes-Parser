//
//  ItunesRssFeedItem.h
//  YZiTunesParser
//
//  Created by Yuval Zukerman on 2/27/12.
//  Copyright (c) 2012 Molecular, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItunesRssFeedItem : NSObject
    @property (strong, nonatomic) NSString* title;
    @property (strong, nonatomic) NSString* subTitle;
    @property (strong, nonatomic) NSString* link;
    @property (strong, nonatomic) NSString* description;
    @property (strong, nonatomic) NSString* author;
    @property (strong, nonatomic) NSString* iTunesAuthor;
    @property (strong, nonatomic) NSDate* pubDate;
    @property (strong, nonatomic) NSDate* iTunesPubDate;
    @property (strong, nonatomic) NSString* iTunesSummary;
    @property (nonatomic) NSInteger* iTunesDuration;
    // prevent an episode or podcast from appearing 
    @property (strong, nonatomic) NSString* iTunesBlock;
    // Category column and in iTunes Music Store Browse
    // [Array of NSString, each record containing a category]
    @property (strong, nonatomic) NSArray* categories;
// search keywords
    @property (strong, nonatomic) NSArray* keywords;
    // parental advisory graphic in Name column
    @property (nonatomic) BOOL isItunesExplicit;
    @property (nonatomic, strong) NSString* enclosureUrl;
    //file size in bytes
    @property (nonatomic, strong) NSString* enclosureLength;
    // mime-type of file
    @property (nonatomic, strong) NSString* enclosureType;


@end
