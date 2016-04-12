//
//  GameScene.m
//  SKShaderBWWindow
//
//  Created by Mo DeJong on 4/11/16.
//  Copyright (c) 2016 HelpURock. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
  // Create a node with a large rainbow background
  
  SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"Rainbow.jpg"];
  background.position = CGPointMake(self.scene.size.width / 2, self.scene.size.height / 2);
  background.size = self.scene.size;
  
  background.zPosition = 0;
  
  [self addChild:background];

  NSLog(@"render background as %x x %d", (int)background.size.width, (int)background.size.height);
  
  // BW
  
  SKSpriteNode *bwContainer = [SKSpriteNode spriteNodeWithImageNamed:@"dummypixel.png"];
  
  bwContainer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
  bwContainer.size = CGSizeMake(self.frame.size.width / 8, self.frame.size.height / 8);
  
  //Create the shader from a shader-file
  SKShader* shader = [SKShader shaderWithFileNamed:@"shader_bw.fsh"];

  bwContainer.shader = shader;
  
  bwContainer.zPosition = 1;
  
  [self addChild:bwContainer];

  
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

/*

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Called when a touch begins
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
      
      // Move window to this position?
        
        sprite.xScale = 0.5;
        sprite.yScale = 0.5;
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

*/

-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
