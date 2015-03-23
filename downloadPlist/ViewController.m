//
//  ViewController.m
//  downloadPlist
//
//  Created by andy hazlett on 10/28/14.
//  Copyright (c) 2014 andy hazlett. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //Definitions
  //  NSString *documentsDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    //Get Image From URL
  //  UIImage * imageFromURL = [self getImageFromURL:@"http://gamerocketstudio.com/v2_0/images/grs_logo.png"];
    NSString *dataFromURL = [self getTextFromURL:@"http://gamerocketstudio.com/pufferlevels/downloadTest.plist"];
    
    NSLog(@"url data:%@",dataFromURL);
    
    NSArray *values = [[NSArray alloc] initWithObjects:dataFromURL,nil];
    [values writeToFile:[self saveFilePath] atomically:YES];
    
    NSString *myPath = [self saveFilePath];
    
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:myPath];
    
    if (fileExists)
    {
        
        NSArray *values = [[NSArray alloc] initWithContentsOfFile:myPath];
       NSLog(@"%@ ",[values objectAtIndex:0]);
    }
    //test
    NSURL *url = [NSURL URLWithString:@"http://gamerocketstudio.com/pufferlevels/downloadTest.plist"];
//    NSMutableArray  *profileArray = [[NSMutableArray alloc] initWithContentsOfURL:url];
    NSMutableDictionary  *profileArray = [[NSMutableDictionary alloc] initWithContentsOfURL:url];

    NSLog(@"url %@, profileArray %@",url,profileArray);

    
    //Save Image to Directory
   // [self saveData:dataFromURL withFileName:@"logo" ofType:@"png" inDirectory:documentsDirectoryPath];
    
    //Load Image From Directory
  //  UIImage * loadImageFromWeb = [self loadImage:@"logo" ofType:@"png" inDirectory:documentsDirectoryPath];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//get text from URL
-(NSString *) getTextFromURL:(NSString *)fileURL {
    NSURL *url = [[NSURL alloc] initWithString:fileURL];
    NSError *error = nil;
    NSStringEncoding encoding;
   
    NSString *my_string = [[NSString alloc] initWithContentsOfURL:url
                                                     usedEncoding:&encoding
                                                            error:&error];
    
    return my_string;
}
//save data
- (NSString *) saveFilePath {
    NSArray *path =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    return [[path objectAtIndex:0] stringByAppendingPathComponent:@"savefile.plist"];
    
}
//get image from URL
-(UIImage *) getImageFromURL:(NSString *)fileURL {
    UIImage * result;
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    
    return result;
}
//save data
/*-(void) saveData:(NSString *)dataStr withFileName:(NSString *)imageName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    if ([[extension lowercaseString] isEqualToString:@"png"]) {
        [UIImagePNGRepresentation(image) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"png"]] options:NSAtomicWrite error:nil];
    } else if ([[extension lowercaseString] isEqualToString:@"jpg"] || [[extension lowercaseString] isEqualToString:@"jpeg"]) {
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"jpg"]] options:NSAtomicWrite error:nil];
    } else {
        NSLog(@"Image Save Failed\nExtension: (%@) is not recognized, use (PNG/JPG)", extension);
    }
}*/
//save Iamge
-(void) saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    if ([[extension lowercaseString] isEqualToString:@"png"]) {
        [UIImagePNGRepresentation(image) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"png"]] options:NSAtomicWrite error:nil];
    } else if ([[extension lowercaseString] isEqualToString:@"jpg"] || [[extension lowercaseString] isEqualToString:@"jpeg"]) {
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"jpg"]] options:NSAtomicWrite error:nil];
    } else {
        NSLog(@"Image Save Failed\nExtension: (%@) is not recognized, use (PNG/JPG)", extension);
    }
}
//load image
-(UIImage *) loadImage:(NSString *)fileName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    UIImage * result = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.%@", directoryPath, fileName, extension]];
    
    return result;
}
//

@end
