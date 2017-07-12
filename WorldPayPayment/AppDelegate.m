//
//  AppDelegate.m
//  WorldPayPayment
//
//  Created by Rajshekhar on 10/07/17.
//  Copyright © 2017 Rajshekhar. All rights reserved.
//

#import "AppDelegate.h"
#import "Worldpay.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[Worldpay sharedInstance] setClientKey:@"YOUR_CLIENT_KEY"];
    [[Worldpay sharedInstance] setReusable:YES];
    [[Worldpay sharedInstance] setValidationType:WorldpayValidationTypeAdvanced];
    
    
    return YES;
}

-(void)validate_card_details{
    NSArray *errors =
    [
     [Worldpay sharedInstance]
     validateCardDetailsWithHolderName:@"CARDHOLDER_NAME"
     cardNumber:@"CARD_NUMBER"
     expirationMonth:@"MM"
     expirationYear:@"YYYY"
     CVC:@"CARD_CVC"
     ];
    
    NSLog(@"%s Errors ==>>%@", __FUNCTION__,errors);
}

-(void)get_token_call{
    [
     [Worldpay sharedInstance]
     createTokenWithNameOnCard:@"CARDHOLDER_NAME"
     cardNumber:@"CARD_NUMBER"
     expirationMonth:@"MM"
     expirationYear:@"YYYY"
     CVC:@"CARD_CVC"
     success:^(int code, NSDictionary *responseDictionary){
         // save the token in the way you want. The responseDictionary will have the following structure:
         // {
         //    paymentMethod =    {
         //         cardType = CARD_TYPE;
         //         expiryMonth = MM;
         //         expiryYear = YYYY;
         //         maskedCardNumber = "**** **** **** XXXX";
         //         name = NAME;
         //         type = ObfuscatedCard;
         //      };
         //      reusable = 1;
         //      token = "YOUR_REUSABLE_TOKEN";
         // }
     }
     failure:^(NSDictionary *responseDictionary, NSArray *errors) {
         //handle errors here. The array will contain NSError objects on it.
     }
     ];
}


-(void)set_token_call{
    [[Worldpay sharedInstance] reuseToken:@"YOUR_TOKEN"
                                  withCVC:@"CVC"
                                  success:^(int code, NSDictionary *responseDictionary){
                                      NSLog(@"success!");
                                  } failure:^(NSDictionary *responseDictionary, NSArray *errors) {
                                      NSLog(@"errors: %@, response: ", responseDictionary);
                                  }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
