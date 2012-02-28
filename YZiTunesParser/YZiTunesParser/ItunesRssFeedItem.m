//
//  ItunesRssFeedItem.m
//  YZiTunesParser
//
//  Created by Yuval Zukerman on 2/27/12.
//  Copyright (c) 2012 Molecular, Inc. All rights reserved.
//

#import "ItunesRssFeedItem.h"

@implementation ItunesRssFeedItem
    
@synthesize title, subTitle, link, description;
@synthesize author, iTunesBlock, iTunesAuthor;
@synthesize pubDate, iTunesPubDate, iTunesSummary;
@synthesize iTunesDuration, categories, keywords, isItunesExplicit;
@synthesize enclosureUrl, enclosureType, enclosureLength;

@end
