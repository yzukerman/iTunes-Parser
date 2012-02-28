//
//  YZViewController.m
//  YZiTunesParser
//
//  Created by Yuval Zukerman on 2/22/12.
//  Copyright (c) 2012 Molecular, Inc. All rights reserved.
//

#import "YZViewController.h"

@implementation YZViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    itunesRssFeed = [[ItunesRssFeed alloc] init];
    
	// Do any additional setup after loading the view, typically from a nib.
    // Create a success block to be called when the async request completes
    TBXMLSuccessBlock successBlock = ^(TBXML *tbxmlDocument) {
        // If TBXML found a root node, process element and iterate all children
        if (tbxmlDocument.rootXMLElement)
        {
            [self traverseElement:tbxmlDocument.rootXMLElement];
            [self processFeed:tbxmlDocument];
        }
    };
    
    // Create a failure block that gets called if something goes wrong
    TBXMLFailureBlock failureBlock = ^(TBXML *tbxmlDocument, NSError * error) {
        NSLog(@"Error! %@ %@", [error localizedDescription], [error userInfo]);
    };
    
    // Initialize TBXML with the URL of an XML doc. TBXML asynchronously loads and parses the file.
    tbxml = [[TBXML alloc] initWithURL:[NSURL URLWithString:@"http://librivox.org/bookfeeds-v1.0/eusebius-history-of-the-christian-church-tr-by-mcgiffert.xml"] 
                               success:successBlock 
                               failure:failureBlock];
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void) traverseElement:(TBXMLElement *)element {
    do {
        // Display the name of the element
        NSLog(@"%@",[TBXML elementName:element]);
        
        // Obtain first attribute from element
        TBXMLAttribute * attribute = element->firstAttribute;
        
        // if attribute is valid
        while (attribute) {
            // Display name and value of attribute to the log window
            NSLog(@"%@->%@ = %@",  [TBXML elementName:element],
                  [TBXML attributeName:attribute],
                  [TBXML attributeValue:attribute]);
            
            // Obtain the next attribute
            attribute = attribute->next;
        }
        
        // if the element has child elements, process them
        if (element->firstChild) 
            [self traverseElement:element->firstChild];
        
        // Obtain next sibling element
    } while ((element = element->nextSibling));  
}

- (void) processFeed:(TBXML*)tbxmlDoc
{
    TBXMLElement* rootElement = [tbxmlDoc rootXMLElement];
    // Display the name of the element
    NSLog(@"%@",[TBXML elementName:rootElement]);
    TBXMLElement* channelElement = 
    [TBXML childElementNamed:@"channel" parentElement:rootElement];
    
    TBXMLElement* rssItem = [TBXML childElementNamed:@"item" parentElement:channelElement];

    do {
        TBXMLElement* titleElement = [TBXML childElementNamed:@"title" parentElement:rssItem];
        NSLog(@"Title    = %@", [TBXML textForElement:titleElement]);
    } while ((rssItem = rssItem->nextSibling));
    
}

@end
