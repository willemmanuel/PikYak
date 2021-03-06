//
//  PostTableViewCell.h
//  PicYak
//
//  Created by Rebecca Mignone on 6/28/14.
//  Copyright (c) 2014 Mignone. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Post.h"

@class PostTableViewCell;
@protocol PostTableViewCellDelegate <NSObject>
@optional
-(NSString *)upvoteTapped:(PostTableViewCell*)cell withPostId:(NSString*)postId;
-(NSString *)downvoteTapped:(PostTableViewCell*)cell withPostId:(NSString*)postId;
@end

@interface PostTableViewCell : UITableViewCell
@property (strong, nonatomic) Post *post;
@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UIButton *upvoteButton;
@property (weak, nonatomic) IBOutlet UIButton *downvoteButton;
@property (weak, nonatomic) IBOutlet UILabel *score;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentsLabel;
@property (nonatomic, assign) id delegate;

@end
