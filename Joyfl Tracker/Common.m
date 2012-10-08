//
//  Common.m
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 9. 25..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import "Common.h"

NSString* L(NSString *key) {
    NSString *s = NSLocalizedString(key, nil);
    if(![[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"en"] && [s isEqualToString:key])
	{
		NSString * path = [[NSBundle mainBundle] pathForResource:@"en" ofType:@"lproj"];
		NSBundle * languageBundle = [NSBundle bundleWithPath:path];
		s = [languageBundle localizedStringForKey:key value:@"" table:nil];
    }
	return s;
}