//
//  MarveAPIHelper.m
//  MarvelAPIDemo
//
//  Created by Diego Freniche Brito on 02/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import "MarvelAPIHelper.h"
#import "NSString+MD5.h"

#define MARVEL_BASE_URL @"http://gateway.marvel.com/v1/public/"

static NSString *const myPublicKey = @"d6beb531ae91ff726e0563cd06fddb6d";
static NSString *const mySecretKey = @"0e1a934e6a52154cd1007d50309681d88c7ac18a";


@interface MarvelAPIHelper()
@property (nonatomic,copy)NSString *timeStamp;

@end

@implementation MarvelAPIHelper

@synthesize timeStamp=_timeStamp;
@synthesize publicKey=_publicKey;
@synthesize secretKey=_secretKey;

-(NSString *)timeStamp{
	NSString * timestamp = [NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970] * 1000];
	return timestamp;
}

-(NSString *)publicKey{
	return myPublicKey;
}

-(NSString *)secretKey{
	return mySecretKey;
}

- (NSString *)authorizationStringWithPublicKey:(NSString *)publicKey andSecretKey:(NSString *)secretKey andTimeStamp:(NSString *)ts {
	
	NSString *preHash = [NSString stringWithFormat:@"%@%@%@", ts, secretKey, publicKey];
	
	return [preHash MD5];
}

- (NSArray *)allComics{

	NSArray *comics;
	
	NSURL *url = [self getURLWithParameter:@"comics?" ];
	
	NSData *data = [NSData dataWithContentsOfURL:url];
	
	return comics;
}

-(NSURL *)getURLWithParameter:(NSString *)parameter{
	NSString *authString = [self authorizationStringWithPublicKey:self.publicKey andSecretKey:self.secretKey andTimeStamp:self.timeStamp];
	
	NSString *get = [NSString stringWithFormat:@"%@%@ts=%@&apikey=%@&hash=%@", MARVEL_BASE_URL, parameter, self.timeStamp, self.publicKey, authString];
	
	return [NSURL URLWithString:get];
}

-(NSData *)superHeroNamed:(NSString *)name{
	
	NSURL *url=[self getURLWithParameter:[NSString stringWithFormat:@"characters?name=%@&",name]];
	
	NSData *data = [NSData dataWithContentsOfURL:url];
	
	return data;
}
@end
