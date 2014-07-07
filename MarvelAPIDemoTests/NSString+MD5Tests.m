//
//  NSString+MD5Tests.m
//  MarvelAPIDemo
//
//  Created by Diego Freniche Brito on 02/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+MD5.h"

@interface NSString_MD5Tests : XCTestCase

@end

@implementation NSString_MD5Tests


- (void)testMD5 {
    
    NSString *theString = @"0e1a934e6a52154cd1007d50309681d88c7ac18ad6beb531ae91ff726e0563cd06fddb6d";
    
    NSString *md5 = [theString MD5];
    
    XCTAssertEqualObjects(md5, @"d54c02c7090fc84df5d57a4bce5de282", @"");
}

@end
