//
//  CommentPictureTableViewCell.m
//  PicYak
//
//  Created by Thomas Mignone on 7/5/14.
//  Copyright (c) 2014 Mignone. All rights reserved.
//

#import "CommentPictureTableViewCell.h"

@implementation CommentPictureTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
