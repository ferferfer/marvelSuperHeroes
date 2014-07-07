//
//  MarvelAPIHelperTests.m
//  MarvelAPIDemo
//
//  Created by Diego Freniche Brito on 02/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MarvelAPIHelper.h"

@interface MarvelAPIHelperTests : XCTestCase

@end

@implementation MarvelAPIHelperTests



- (void)testGetComics {
    MarvelAPIHelper *mah = [[MarvelAPIHelper alloc] init];
        
    [mah allComics];
    
}

-(void)testSuperHeroWithName{
	
	MarvelAPIHelper *mah = [[MarvelAPIHelper alloc] init];
	
	NSData *data=[mah superHeroNamed:@"spiderman"];
	
	XCTAssertNotNil(data, @"");
}

@end
