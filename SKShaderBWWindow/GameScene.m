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

@end

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
  // Create a node with a large rainbow background
  
  self.backgroundSize = self.scene.size;
  
  SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"Rainbow.jpg"];
  background.position = CGPointMake(self.scene.size.width / 2, self.scene.size.height / 2);
  background.size = self.scene.size;
  
  background.zPosition = 0;
  
  [self addChild:background];

  NSLog(@"render background as %x x %d", (int)background.size.width, (int)background.size.height);
  
  // BW
  
  SKSpriteNode *bwContainer = [SKSpriteNode spriteNodeWithImageNamed:@"Rainbow.jpg"];
  
  bwContainer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
  
  bwContainer.size = self.scene.size;
  
//  bwContainer.size = CGSizeMake(self.frame.size.width / 8, self.frame.size.height / 8);
  
  //Create the shader from a shader-file
  SKShader* shader = [SKShader shaderWithFileNamed:@"shader_bw.fsh"];

  bwContainer.shader = shader;
  
  //bwContainer.zPosition = 1;
  
//  [self addChild:bwContainer];

  /*
  
  // Crop BW
  
  SKCropNode* cropNode = [SKCropNode node];
  SKShapeNode* mask = [SKShapeNode node];
  
  //[mask setPath:CGPathCreateWithRoundedRect(CGRectMake(-100, -100, 100, 100), 4, 4, nil)];
  
  SKSpriteNode *sNode = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(50, 50)];
  
  [mask setFillColor:[SKColor whiteColor]];
  
  [cropNode setMaskNode:mask];
  [cropNode addChild:bwContainer];
  
  cropNode.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
  cropNode.zPosition = 1;
  
  [self addChild:cropNode];
  
  //cropNode.size = self.scene.size;
   
  */
  
  /*
  
  SKSpriteNode *sNode = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(50, 50)];
  
  sNode.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
  sNode.zPosition = 1;
  
  [self addChild:sNode];
   
   */
  
  /*
  
  SKCropNode* cropNode = [SKCropNode node];
  
  SKSpriteNode *sNode = [SKSpriteNode spriteNodeWithColor:[SKColor whiteColor] size:CGSizeMake(500, 500)];
  
  sNode.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
  
  [cropNode setMaskNode:sNode];
  //[cropNode addChild:sNode];
  
  //[self addChild:bwContainer];
  
  SKSpriteNode *redNode = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(500, 500)];
  
  [self addChild:redNode];
  
  cropNode.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
  
//  cropNode.size = CGSizeMake(self.scene.size.width / 8, self.scene.size.height / 8);
  
  cropNode.zPosition = 1;
   
  */
  
  /*
  
  SKSpriteNode *sNode = [SKSpriteNode spriteNodeWithColor:[SKColor whiteColor] size:CGSizeMake(500, 500)];
  
  sNode.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
  
  sNode.zPosition = 1;
  
  [self addChild:sNode];
  
  */
  
  /*
  
  SKCropNode* cropNode = [SKCropNode node];

  SKSpriteNode *redNode = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(500, 500)];
  
  SKSpriteNode *whiteNode = [SKSpriteNode spriteNodeWithColor:[SKColor whiteColor] size:CGSizeMake(100, 100)];
  
  //sNode.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
  
  [cropNode setMaskNode:whiteNode];
  
  [cropNode addChild:redNode];

  cropNode.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
  
  cropNode.zPosition = 1;
  
  [self addChild:cropNode];
   
   */
  
  //CGSize windowSize = CGSizeMake(250, 250);
  CGSize whiteSize = CGSizeMake(300, 300);
  
//  CGPoint middlePoint = CGPointMake(windowSize.width/2, windowSize.height/2);
  
  SKCropNode* cropNode = [SKCropNode node];
  
  self.cropNode = cropNode;
  
  SKSpriteNode *whiteNode = [SKSpriteNode spriteNodeWithColor:[SKColor whiteColor] size:whiteSize];
  
  self.whiteNode = whiteNode;
  
  self.whiteSize = whiteSize;
  
  self.cropPointOffset = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
  
  whiteNode.position = self.cropPointOffset;
  
  //sNode.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
  
  [cropNode setMaskNode:whiteNode];
  
  [cropNode addChild:bwContainer];
  
//  cropNode.position = CGPointMake(self.frame.size.width/2 - middlePoint.x, self.frame.size.height/2 - middlePoint.y);
  
  cropNode.zPosition = 1;
  
  [self addChild:cropNode];
  
  /*
  
  //Setup a container sprite for the shader that makes the movement
  SKSpriteNode *shaderContainer_move = [SKSpriteNode spriteNodeWithImageNamed:@"dummypixel.png"];
  shaderContainer_move.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
  shaderContainer_move.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
  [self addChild:shaderContainer_move];
  //Create the shader from a shader-file
  SKShader* shader_move = [SKShader shaderWithFileNamed:@"shader_water_movement.fsh"];
  //Set vairiables that are used in the shader script
  shader_move.uniforms = @[
                           //                        [SKUniform uniformWithName:@"size" floatVector3:GLKVector3Make(self.frame.size.width*1.5, self.frame.size.height*1.5, 0)],
                           [SKUniform uniformWithName:@"customTexture" texture:[SKTexture textureWithImageNamed:@"sand.png"]],
                           ];
  //add the shader to the sprite
  shaderContainer_move.shader = shader_move;

  
    // Setup your scene here
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel.text = @"Hello, World!";
    myLabel.fontSize = 45;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame));
    
    [self addChild:myLabel];

   */
}

// Called when a touch begins

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  CGSize backgroundSize = self.backgroundSize;
  
  const BOOL debugPrint = TRUE;
  
  for (UITouch *touch in touches) {
    CGPoint location = [touch locationInNode:self];
    
    if (debugPrint) {
    NSLog(@"location (%5d, %5d)", (int)location.x, (int)location.y);
    }
    
    float pWidth = location.x / backgroundSize.width;
    float pHeight = location.y / backgroundSize.height;

    if (debugPrint) {
    NSLog(@"percent from LL corner (%3f, %3f)", pWidth, pHeight);
    }
    
    // Delta from current center of crop window to current position
    
    CGPoint currentCenterPoint = self.cropNode.position;
    
    if (debugPrint) {
    NSLog(@"currentCenterPoint (%5d, %5d)", (int)currentCenterPoint.x, (int)currentCenterPoint.y);
    
    NSLog(@"cropPointOffset (%5d, %5d)", (int)self.cropPointOffset.x, (int)self.cropPointOffset.y);
    }
    
    CGPoint offsetPoint = CGPointMake(location.x - self.cropPointOffset.x, location.y - self.cropPointOffset.y);

    if (debugPrint) {
    NSLog(@"offset from center (%5d, %5d)", (int)offsetPoint.x, (int)offsetPoint.y);
    }

    self.cropNode.position = offsetPoint;
    
    // Adjust the view area inside the BW area
    
    SKSpriteNode *whiteNode = self.whiteNode;
    
    if (debugPrint) {
      NSLog(@"whiteNode center (%5d, %5d)", (int)whiteNode.position.x, (int)whiteNode.position.y);
    }
    
    CGPoint adj = self.whiteNode.position;
    
    adj.x = (adj.x / self.whiteSize.width) + offsetPoint.x;
    adj.y = (adj.y / self.whiteSize.height) + offsetPoint.y;
    
    self.whiteNode.position = adj;
    
//    MOMO
    
//    CGSize whiteSize = self.whiteSize;
//    
//    NSLog(@"whiteSize (%5d, %5d)", (int)whiteSize.width, (int)whiteSize.height);
//    
//    CGPoint currentOffsetFromCenter = CGPointMake(currentCenterPoint.x - whiteSize.width, currentCenterPoint.y - whiteSize.height);
//    
//    NSLog(@"adjust current center by (%5d, %5d)", (int)currentOffsetFromCenter.x, (int)currentOffsetFromCenter.y);
    
    //CGPoint adjPoint = CGPointMake(currentCenterPoint.x + offsetPoint.x, currentCenterPoint.y + offsetPoint.y);
    
    //NSLog(@"adjust current center by (%5d, %5d)", (int)adjPoint.x, (int)adjPoint.y);
    
    //self.cropNode.position = adjPoint;
    
    //CGPoint pos = location;
    
    //self.cropNode.position = pos;
    
    //NSLog(@"crop node position (%5d, %5d)", (int)self.cropNode.position.x, (int)self.cropNode.position.y);

    //CGPoint center = pos;
    
//    CGPoint pos2 = CGPointMake(location.x - self.cropPointOffset.x, location.y - self.cropPointOffset.y);
    
    //self.whiteNode.position = location;
    
    //  self.whiteSize = whiteSize;
    
    break;
  }
}

-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
