//
//  Post.m
//  PicYak
//
//  Created by Rebecca Mignone on 6/29/14.
//  Copyright (c) 2014 Mignone. All rights reserved.
//
#import <CoreLocation/CoreLocation.h>
#import "Post.h"

@implementation Post

- (id) initWithObject: (PFObject *) post{
    self = [super init];
    self.caption = post[@"caption"];
    self.score = [[post objectForKey:@"score"] intValue];
    self.postId = post.objectId;
    self.createdAt = post.createdAt;
    self.createdAtString = [self dateDiff:post.createdAt];
    self.comments = [[post objectForKey:@"comments"] intValue];
    self.postPFObject = post;
    
    PFGeoPoint *location = [post objectForKey:@"location"];
    self.location = [[CLLocation alloc] initWithLatitude:location.latitude longitude:location.longitude];
    PFFile *imageFile = [post objectForKey:@"picture"];
    //[imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
    NSData *data = [imageFile getData];
    //    if (!error) {
            self.picture = [UIImage imageWithData:data];
      //  }
    //}];
    
    return self;
}

- (BOOL)equalToPost:(Post *)aPost {
	if (aPost == nil) {
		return NO;
	}
    if(aPost.score != self.score){
        return NO;
    }
	if (aPost.postId && self.postId) {
		// We have a PFObject inside the PAWPost, use that instead.
		if ([aPost.postId compare:self.postId] != NSOrderedSame) {
			return NO;
		}
		return YES;
	}

    return NO;
}

-(NSString *)dateDiff:(NSDate *)convertedDate {
    NSDate *todayDate = [NSDate date];
    double ti = [convertedDate timeIntervalSinceDate:todayDate];
    ti = ti * -1;
    if(ti < 1) {
    	return @"never";
    } else 	if (ti < 60) {
    	return @"1m";
    } else if (ti < 3600) {
    	int diff = round(ti / 60);
    	return [NSString stringWithFormat:@"%dm", diff];
    } else if (ti < 86400) {
    	int diff = round(ti / 60 / 60);
    	return[NSString stringWithFormat:@"%dh", diff];
    } else if (ti < 2629743) {
    	int diff = round(ti / 60 / 60 / 24);
    	return[NSString stringWithFormat:@"%dd", diff];
    } else {
    	return @"never";
    }
}

@end
