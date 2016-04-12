//
//  GameScene.m
//  SKShaderBWWindow
//
//  Created by Mo DeJong on 4/11/16.
//  Copyright (c) 2016 HelpURock. All rights reserved.
//

#import "GameScene.h"

@interface GameScene ()

@property (nonatomic, assign) CGSize backgroundSize;

@property (nonatomic, retain) SKSpriteNode *whiteNode;

@property (nonatomic, assign) CGSize whiteSize;

@property (nonatomic, retain) SKCropNode *cropNode;

@property (nonatomic, assign) CGPoint cropPointOffset;

@property (nonatomic, retain) SKShapeNode *outlineNode;

@property (nonatomic, assign) int frameOffset;

@end

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
  // Create a node with a large rainbow background
  
  self.frameOffset = 0;
  
  self.backgroundSize = self.scene.size;
  
  SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"Rainbow.jpg"];
  background.position = CGPointMake(self.scene.size.width / 2, self.scene.size.height / 2);
  background.size = self.scene.size;
  
  background.zPosition = 0;
  
  [self addChild:background];

  NSLog(@"render background as %x x %d", (int)background.size.width, (int)background.size.height);
  
  // BW overlay
  
  SKSpriteNode *bwContainer = [SKSpriteNode spriteNodeWithImageNamed:@"Rainbow.jpg"];
  
  bwContainer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
  
  bwContainer.size = self.scene.size;

  SKShader* shader = [SKShader shaderWithFileNamed:@"shader_bw.fsh"];

  bwContainer.shader = shader;
  
  // Crop region
  
  CGSize whiteSize = CGSizeMake(300, 300);
  
  SKCropNode* cropNode = [SKCropNode node];
  
  self.cropNode = cropNode;
  
  SKSpriteNode *whiteNode = [SKSpriteNode spriteNodeWithColor:[SKColor whiteColor] size:whiteSize];
  
  self.whiteNode = whiteNode;
  
  self.whiteSize = whiteSize;
  
  self.cropPointOffset = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
  
  whiteNode.position = self.cropPointOffset;
  
  [cropNode setMaskNode:whiteNode];
  
  [cropNode addChild:bwContainer];
  
  cropNode.zPosition = 1;
  
  [self addChild:cropNode];
  
  // Outline around BW area
  
  SKShapeNode* pathShapeNode = [[SKShapeNode alloc] init];
  
  CGRect rect;
  rect.origin = CGPointMake(-whiteSize.width/2, -whiteSize.height/2);
  rect.size = whiteSize;
  pathShapeNode.path = [UIBezierPath bezierPathWithRect:rect].CGPath;
  
  pathShapeNode.lineWidth = 3;
  pathShapeNode.fillColor = [SKColor clearColor];
  pathShapeNode.strokeColor = [SKColor darkGrayColor];
  
  pathShapeNode.zPosition = 2;
  
  pathShapeNode.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
  
  [self addChild:pathShapeNode];
  
  self.outlineNode = pathShapeNode;
}

-(void)update:(CFTimeInterval)currentTime {
  self.frameOffset = self.frameOffset + 1;
  
  SKSpriteNode *whiteNode = self.whiteNode;
  
  int over = self.frameOffset % 300;
  
  whiteNode.size = CGSizeMake(self.whiteSize.width + over, self.whiteSize.height + over);
  
  SKShapeNode *outlineNode = self.outlineNode;

  CGRect rect;
  rect.origin = CGPointMake(-whiteNode.size.width/2, -whiteNode.size.height/2);
  rect.size = whiteNode.size;
  outlineNode.path = [UIBezierPath bezierPathWithRect:rect].CGPath;
  
  return;
}

@end
