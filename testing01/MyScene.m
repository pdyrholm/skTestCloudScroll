//
//  MyScene.m
//  testing01
//
//  Created by Peter Dyrholm on 4/9/14.
//  Copyright (c) 2014 Peter Dyrholm. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:120/255 green:160/255 blue:1 alpha:1.0];
        
        SKSpriteNode *bgImage1 = [SKSpriteNode spriteNodeWithImageNamed:@"bgClouds"];
        bgImage1.anchorPoint = CGPointZero;
        bgImage1.position = CGPointMake(0, self.size.height-bgImage1.size.height-30);
        bgImage1.name = @"bgimage1";
        [self addChild:bgImage1];
        
        SKSpriteNode *bgImage2 = [SKSpriteNode spriteNodeWithImageNamed:@"bgClouds"];
        bgImage2.anchorPoint = CGPointZero;
        bgImage2.position = CGPointMake(bgImage1.size.width-1, self.size.height-bgImage1.size.height-30);
        bgImage2.name = @"bgimage2";
        [self addChild:bgImage2];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    

}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    SKSpriteNode *bgImage1 = (SKSpriteNode *)[self childNodeWithName:@"bgimage1"];
    SKSpriteNode *bgImage2 = (SKSpriteNode *)[self childNodeWithName:@"bgimage2"];
    
    bgImage1.position = CGPointMake(bgImage1.position.x-2, bgImage1.position.y);
    bgImage2.position = CGPointMake(bgImage2.position.x-2, bgImage2.position.y);
    
    if (bgImage1.position.x < -bgImage1.size.width){
        bgImage1.position = CGPointMake(bgImage2.position.x + bgImage2.size.width, bgImage1.position.y);
    }
    
    if (bgImage2.position.x < -bgImage2.size.width) {
        bgImage2.position = CGPointMake(bgImage1.position.x + bgImage1.size.width, bgImage2.position.y);
    }
    
}

@end
