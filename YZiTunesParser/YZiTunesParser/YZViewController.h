//
//  YZViewController.h
//  YZiTunesParser
//
//  Created by Yuval Zukerman on 2/22/12.
//  Copyright (c) 2012 Molecular, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBXML+HTTP.h"
#import "ItunesRssFeed.h"

@interface YZViewController : UIViewController
{
    TBXML* tbxml;
    ItunesRssFeed* itunesRssFeed;
}

- (void) traverseElement:(TBXMLElement *)element;
- (void) processFeed:(TBXML*)tbxml;

@end
