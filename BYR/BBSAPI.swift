//
//  BBSAPI.swift
//  Byr
//
//  Created by Jason on 15/10/16.
//  Copyright © 2015年 KYLERUAN. All rights reserved.
//

import Foundation
import Alamofire




//2a44821105d92482960593d94e4d042e
//#define APPKEY @"ff7504fa9d6a4975"
let APPKEY:NSString = "2a44821105d92482960593d94e4d042e"
let APIDDR:NSString = "http://api.byr.cn"



let AllBoards = "Advice|Announce|BBShelp|Bet|BM_Market|BYR10|Cooperation|ForumCommittee|ID|Progress|Score|sysop|test|BYR|BYRStar|Showcase|AimBUPT|ACETeam|BuptAssociation|BUPTMSTC|BUPTStudentUnion|BUPTSTV|BuptWeekly|ChineseOrchestra|GraduateUnion|OracleClub|Orchestra|Philharmonic|Redcross|SCDA|SICA|WOWBuptGuild|BUPT|BUPTNet|BUPTPost|BYR_Bulletin|CampusCard|daonian|EID|Focus|Graduation|Library|Recommend|School|Selfsupport|StudentAffairs|StudentQuery|BUPTNU|DMDA|GraduateSch|HongFu|INTR|IPOC|IS|SA|SCS|SEE|SEM|SH|SICE|SL|SIE|SS|SPM|SSE|STE|ACM_ICPC|BBSMan_Dev|Circuit|Communications|CPP|Database|dotNET|Economics|Embedded_System|HardWare|Innovation|Java|Linux|MathModel|Matlab|ML_DM|MobileInternet|MobileTerminalAT|Notebook|OfficeTool|Paper|SearchEngine|Security|SoftDesign|Windows|WWWTechnology|Ad_Agent|Advertising|BookTrade|BUPTDiscount|Co_Buying|ComputerTrade|Group_Buying|House|House_Agent|Ticket|AimGraduate|BNU|BUPT_Internet_Club|BYRatSH|BYRatSZ|Certification|CivilServant|Consulting|Entrepreneurship|Financial|FamilyLife|GoAbroad|Home|IT|Job|JobInfo|NetResources|Overseas|ParttimeJob|PMatBUPT|StudyShare|Weather|WorkLife|Astronomy|Debate|DV|EnglishBar|Ghost|Guitar|Humanity|Japanese|KoreanWind|Music|Photo|Poetry|PsyHealthOnline|Quyi|Reading|ScienceFiction|Tshirt|Beauty|Blessing|Clothing|Constellations|DigiLife|Environment|DIYLife|Feeling|Food|Friends|Health|LostandFound|Talking|AutoMotor|BoardGame|Comic|Flash|Hero|Joke|KaraOK|KillBar|Movie|NetLiterature|Pet|Picture|Plant|RadioOnline|Requirement|SuperStar|Travel|TV|VideoCool|Athletics|Badminton|Billiards|Basketball|Chess|Cycling|Dancing|Football|GSpeed|Gymnasium|Kungfu|Rugby|Shuttlecock|Sk8|Skating|Swim|Taekwondo|Tabletennis|Tennis|Volleyball|BUPTDNF|CStrike|Diablo|FootballManager|LOL|OnlineGame|PCGame|PopKart|StarCraft|TVGame|War3RPG|WarCraft|WE|WOW|Xyq"
class BBSAPI{
    
//    static func searchTopics(key:NSString,start:Int,user:User,board:NSString)->NSString{
//        var url = APPKEY
//         url.stringByAppendingString("/search/threads.json?")
//        
//         url.stringByAppendingFormat("appkey=%@",APPKEY)
//        url.stringByAppendingFormat("&board=%@",board)
//        url.stringByAppendingFormat("&count=50&page=%i", start/50 + 1)
//  
//       url.stringByAppendingFormat("&title1=%@",key)
//
//       return NSString()
//    }

    
    static func login(user:NSString,pass:NSString)->User?{
        //FIXME: 没有网络的时候
//        if {
//           return nil
//        }
        let url : NSMutableString = NSMutableString(string: APIDDR)
        url.appendString("/user/login.json?")
        url.appendFormat("appkey=%@", APPKEY)
        
        let URL = NSURL(string: url as String)
        
        
        return nil
    }
}





//
//+(User *)login:(NSString *)user Pass:(NSString *)pass
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return nil;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendString:@"/user/login.json?"];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    [request setUsername:user];
//    [request setPassword:pass];
//    [request setAllowCompressedResponse:YES];
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    
//    if (feedback == nil) {
//        return nil;
//    }
//    NSDictionary *userDictionary = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    
//    User * myself = [JsonParseEngine parseLogin:userDictionary];
//    if (myself == nil) {
//        return nil;
//    }
//    else {
//        myself.username = user;
//        myself.password = pass;
//        return myself;
//    }
//}
//
//+(BOOL)addNotificationToken:(NSString *)token iToken:(NSString *)iToken
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return false;
//    }
//    
//    NSMutableString * baseurl = [@"http://bbs.seu.edu.cn/api/push/add.json?" mutableCopy];
//    [baseurl appendFormat:@"token=%@",token];
//    [baseurl appendFormat:@"&iToken=%@",iToken];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    NSData * feedback = [NSData dataWithContentsOfURL:url];
//    if (feedback == nil) {
//        return NO;
//    }
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    BOOL success = [[topTenTopics objectForKey:@"success"] boolValue];
//    return success;
//}
//
//+(NSArray *)topTen
//    {
//        if(![BBSAPI isNetworkReachable])
//        {
//            return nil;
//        }
//        
//        NSMutableString * baseurl = [APIADDR mutableCopy];
//        [baseurl appendString:@"/widget/topten.json?"];
//        [baseurl appendFormat:@"appkey=%@", APPKEY];
//        
//        NSURL *url = [NSURL URLWithString:baseurl];
//        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//        [request setAllowCompressedResponse:YES];
//        [request startSynchronous];
//        
//        NSData *feedback = [request responseData];
//        
//        if (feedback == nil) {
//            return nil;
//        }
//        NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//        
//        NSArray * Status = [JsonParseEngine parseTopics:topTenTopics];
//        if (Status == nil) {
//            return [NSArray arrayWithObject:nil];
//        }
//        else {
//            return Status;
//        }
//}
//
//+(NSArray *)sectionTopTen:(int)sectionNumber
//{
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/widget/section-%i.json?", sectionNumber];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    [request setUsername:@"guest"];
//    [request setPassword:@""];
//    [request setAllowCompressedResponse:YES];
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    
//    if (feedback == nil) {
//        return nil;
//    }
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    
//    NSArray * Status = [JsonParseEngine parseTopics:topTenTopics];
//    if (Status == nil) {
//        return [NSArray arrayWithObject:nil];
//    }
//    else {
//        return Status;
//    }
//}
//
//+(NSArray *)hotTopics
//    {
//        if(![BBSAPI isNetworkReachable])
//        {
//            return nil;
//        }
//        
//        NSMutableString * baseurl = [APIADDR mutableCopy];
//        [baseurl appendString:@"/widget/recommend.json?"];
//        [baseurl appendFormat:@"appkey=%@", APPKEY];
//        
//        NSURL *url = [NSURL URLWithString:baseurl];
//        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//        [request setAllowCompressedResponse:YES];
//        [request startSynchronous];
//        NSData *feedback = [request responseData];
//        
//        if (feedback == nil) {
//            return nil;
//        }
//        NSDictionary *hotTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//        
//        NSArray * Status = [JsonParseEngine parseTopics:hotTopics];
//        if (Status == nil) {
//            return nil;
//        }
//        else {
//            return Status;
//        }
//}
//
//
//+(NSArray *)getBoards:(User *)user Section:(NSString *)section
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return nil;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    if (section == nil) {
//        [baseurl appendString:@"/section.json?"];
//    }
//    else {
//        [baseurl appendFormat:@"/section/%@.json?", section];
//    }
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    
//    if (user == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    else {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request startSynchronous];
//    
//    NSData *feedback = [request responseData];
//    if (feedback == nil) {
//        return nil;
//    }
//    
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    NSArray * Status = [JsonParseEngine parseBoards:topTenTopics];
//    if (Status == nil) {
//        return nil;
//    }
//    else {
//        return Status;
//    }
//    return nil;
//}
//
//+(NSArray *)allFavSections:(User *)user
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return nil;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendString:@"/favorite/0.json?"];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    if (user == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    else {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    
//    if (feedback == nil) {
//        return nil;
//    }
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    NSArray * Status = [JsonParseEngine parseBoards:topTenTopics];
//    if (Status == nil) {
//        return nil;
//    }
//    else {
//        return Status;
//    }
//}
//
//+(NSArray *)onlineFriends:(NSString *)token
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return nil;
//    }
//    
//    NSMutableString * baseurl = [@"http://bbs.seu.edu.cn/api/friends.json?" mutableCopy];
//    [baseurl appendFormat:@"token=%@", token];
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    [request setAllowCompressedResponse:YES];
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    if (feedback == nil) {
//        return nil;
//    }
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    
//    NSArray * Status = [JsonParseEngine parseFriends:topTenTopics];
//    if (Status == nil) {
//        return nil;
//    }
//    else {
//        return Status;
//    }
//}
//
//+(NSArray *)allFriends:(NSString *)token
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return nil;
//    }
//    
//    NSMutableString * baseurl = [@"http://bbs.seu.edu.cn/api/friends/all.json?" mutableCopy];
//    [baseurl appendFormat:@"token=%@", token];
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    [request setAllowCompressedResponse:YES];
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    if (feedback == nil) {
//        return nil;
//    }
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    
//    NSArray * Status = [JsonParseEngine parseFriends:topTenTopics];
//    if (Status == nil) {
//        return nil;
//    }
//    else {
//        return Status;
//    }
//}
//
//+(BOOL)deletFriend:(NSString *)token ID:(NSString *)ID
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return false;
//    }
//    
//    NSMutableString * baseurl = [@"http://bbs.seu.edu.cn/api/friends/delete.json?" mutableCopy];
//    [baseurl appendFormat:@"token=%@",token];
//    [baseurl appendFormat:@"&id=%@",ID];
//    NSURL *url = [NSURL URLWithString:baseurl];
//    NSData * feedback = [NSData dataWithContentsOfURL:url];
//    if (feedback == nil) {
//        return NO;
//    }
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    
//    
//    BOOL success = [[topTenTopics objectForKey:@"success"] boolValue];
//    return success;
//}
//+(BOOL)addFriend:(NSString *)token ID:(NSString *)ID
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return false;
//    }
//    
//    NSMutableString * baseurl = [@"http://bbs.seu.edu.cn/api/friends/add.json?" mutableCopy];
//    [baseurl appendFormat:@"token=%@", token];
//    [baseurl appendFormat:@"&id=%@",ID];
//    NSURL *url = [NSURL URLWithString:baseurl];
//    NSData * feedback = [NSData dataWithContentsOfURL:url];
//    if (feedback == nil) {
//        return NO;
//    }
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    
//    
//    int result = [[topTenTopics objectForKey:@"result"] intValue];
//    BOOL success = NO;
//    if (result == 0) {
//        success = YES;
//    }
//    return success;
//}
//
//+(BOOL)addFavBoard:(User *)user BoardName:(NSString *)BoardName
//{
//    if(![BBSAPI isNetworkReachable]) {
//        return NO;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/favorite/add/0.json?"];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
//    if (user == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    } else {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    
//    [request setPostValue:BoardName forKey:@"name"];
//    [request setPostValue:@"0" forKey:@"dir"];
//    
//    [request setAllowCompressedResponse:YES];
//    [request setRequestMethod:@"POST"];
//    [request startSynchronous];
//    
//    NSData *feedback = [request responseData];
//    
//    if (feedback == nil) {
//        return NO;
//    }
//    
//    return YES;
//}
//
//+(BOOL)deleteFavBoard:(User *)user BoardName:(NSString *)BoardName
//{
//    if(![BBSAPI isNetworkReachable]) {
//        return NO;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/favorite/delete/0.json?"];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
//    if (user == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    } else {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    
//    [request setPostValue:BoardName forKey:@"name"];
//    [request setPostValue:@"0" forKey:@"dir"];
//    
//    [request setAllowCompressedResponse:YES];
//    [request setRequestMethod:@"POST"];
//    [request startSynchronous];
//    
//    NSData *feedback = [request responseData];
//    
//    if (feedback == nil) {
//        return NO;
//    }
//    
//    return YES;
//}
//
//+(BOOL)isFriend:(NSString *)token ID:(NSString *)ID
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return false;
//    }
//    
//    NSMutableString * baseurl = [@"http://bbs.seu.edu.cn/api/friends/add.json?" mutableCopy];
//    [baseurl appendFormat:@"token=%@",token];
//    [baseurl appendFormat:@"&id=%@",ID];
//    NSURL *url = [NSURL URLWithString:baseurl];
//    NSData * feedback = [NSData dataWithContentsOfURL:url];
//    if (feedback == nil) {
//        return FALSE;
//    }
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    
//    
//    int result = [[topTenTopics objectForKey:@"result"] intValue];
//    if (result == -2) {
//        return TRUE;
//    }
//    else {
//        [BBSAPI deletFriend:nil ID:ID];
//        return FALSE;
//    }
//    return FALSE;
//}
//
//+(NSArray *)getMails:(User *)user Type:(int)type Start:(int)start
//{
//    if(![BBSAPI isNetworkReachable] || start%50 != 0)
//    {
//        return nil;
//    }
//    
//    NSString *typeString;
//    switch (type) {
//    case 0:
//        typeString = @"inbox";
//        break;
//    case 1:
//        typeString = @"outbox";
//        break;
//    case 2:
//        typeString = @"deleted";
//        break;
//    default:
//        break;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/mail/%@.json?", typeString];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    [baseurl appendFormat:@"&count=50&page=%i",start/50 + 1];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    if (user == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    else {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    if (feedback == nil) {
//        return nil;
//    }
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    
//    
//    NSArray * Status = [JsonParseEngine parseMails:topTenTopics Type:type];
//    if (Status == nil) {
//        return nil;
//    }
//    else {
//        return Status;
//    }
//}
//
//+(Mail *)getSingleMail:(User *)user Type:(int)type ID:(int)ID
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return nil;
//    }
//    
//    NSString *typeString;
//    switch (type) {
//    case 0:
//        typeString = @"inbox";
//        break;
//    case 1:
//        typeString = @"outbox";
//        break;
//    case 2:
//        typeString = @"deleted";
//        break;
//    default:
//        break;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/mail/%@/%i.json?", typeString, ID];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    if (user == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    else {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    
//    if (feedback == nil) {
//        return nil;
//    }
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    
//    
//    Mail * Status = [JsonParseEngine parseSingleMail:topTenTopics Type:type];
//    if (Status == nil) {
//        return nil;
//    }
//    else {
//        return Status;
//    }
//}
//
//+(BOOL)deleteSingleMail:(User *)user Type:(int)type ID:(int)ID
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return false;
//    }
//    
//    NSString *typeString;
//    switch (type) {
//    case 0:
//        typeString = @"inbox";
//        break;
//    case 1:
//        typeString = @"outbox";
//        break;
//    case 2:
//        typeString = @"deleted";
//        break;
//    default:
//        break;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/mail/%@/delete/%i.json?", typeString, ID];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    if (user == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    else {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request setRequestMethod:@"POST"];
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    
//    if (feedback == nil) {
//        return NO;
//    }
//    
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    NSString * code = [topTenTopics objectForKey:@"code"];
//    if (!code)
//    return true;
//    
//    return false;
//}
//
//+(BOOL)postMail:(User *)myself User:(NSString *)user Title:(NSString *)title Content:(NSString *)content Reid:(int)reid
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return false;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/mail/send.json?"];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
//    if (myself == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    else {
//        [request setUsername:myself.username];
//        [request setPassword:myself.password];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request setRequestMethod:@"POST"];
//    
//    [request setPostValue:user forKey:@"id"];
//    [request setPostValue:[title URLEncodedString] forKey:@"title"];
//    [request setPostValue:[content URLEncodedString] forKey:@"content"];
//    [request setPostValue:@"1" forKey:@"backup"];
//    [request startSynchronous];
//    
//    NSData *feedback = [request responseData];
//    NSString * feedbackString = [[NSString alloc] initWithData:feedback encoding:NSUTF8StringEncoding];
//    NSLog(@"%@", feedbackString);
//    
//    if (feedback == nil) {
//        return NO;
//    }
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    BOOL success = [[topTenTopics objectForKey:@"status"] boolValue];
//    if (success) {
//        return YES;
//    }
//    return NO;
//}
//+(BOOL)replyMail:(User *)myself User:(NSString *)user Title:(NSString *)title Content:(NSString *)content Type:(int)type ID:(int)ID
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return false;
//    }
//    
//    NSString *typeString;
//    switch (type) {
//    case 0:
//        typeString = @"inbox";
//        break;
//    case 1:
//        typeString = @"outbox";
//        break;
//    case 2:
//        typeString = @"deleted";
//        break;
//    default:
//        break;
//    }
//    
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/mail/%@/reply/%i.json?", typeString, ID];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
//    if (myself == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    else {
//        [request setUsername:myself.username];
//        [request setPassword:myself.password];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request setRequestMethod:@"POST"];
//    
//    [request setPostValue:user forKey:@"id"];
//    [request setPostValue:[title URLEncodedString] forKey:@"title"];
//    [request setPostValue:[content URLEncodedString] forKey:@"content"];
//    [request setPostValue:@"1" forKey:@"backup"];
//    [request startSynchronous];
//    
//    NSData *feedback = [request responseData];
//    NSString * feedbackString = [[NSString alloc] initWithData:feedback encoding:NSUTF8StringEncoding];
//    NSLog(@"%@", feedbackString);
//    
//    if (feedback == nil) {
//        return NO;
//    }
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    NSString * code = [topTenTopics objectForKey:@"code"];
//    if (!code)
//    return YES;
//    
//    return NO;
//}
//
//+(int)getNotificationCount:(User *)user Type:(NSString *)type
//{
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/refer/%@/info.json?", type];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    if (user == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    else {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    
//    if (feedback == nil) {
//        return 0;
//    }
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    
//    return [[topTenTopics objectForKey:@"new_count"] intValue];
//}
//
//+(Notification *)getAllNotificationCount:(User *)user
//{
//    int at = [BBSAPI getNotificationCount:user Type:@"at"];
//    int reply = [BBSAPI getNotificationCount:user Type:@"reply"];
//    Notification *notification = [[Notification alloc] init];
//    notification.atCount = at;
//    notification.replyCount = reply;
//    return notification;
//}
//
//+(NSArray *)getNotification:(User *)user Type:(NSString *)type Start:(NSInteger)start Limit:(NSInteger)limit;
//{
//    if(![BBSAPI isNetworkReachable] || start%limit != 0)
//    {
//        return nil;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/refer/%@.json?", type];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    [baseurl appendFormat:@"&count=%i", limit];
//    [baseurl appendFormat:@"&page=%i", start/limit + 1];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    if (user == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    else {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    NSString * feedbackString = [[NSString alloc] initWithData:feedback encoding:NSUTF8StringEncoding];
//    NSLog(@"%@", feedbackString);
//    if (feedback == nil) {
//        return nil;
//    }
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    
//    NSArray * Status = [JsonParseEngine parseTopics:topTenTopics];
//    if (Status == nil) {
//        return nil;
//    }
//    else {
//        return Status;
//    }
//}
//
//+(BOOL)deleteNotification:(User *)user Type:(NSString *)type ID:(int)ID
//{
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/refer/%@/setRead/%i.json?", type, ID];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    if (user == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    else {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request setRequestMethod:@"POST"];
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    NSString * feedbackString = [[NSString alloc] initWithData:feedback encoding:NSUTF8StringEncoding];
//    NSLog(@"%@", feedbackString);
//    
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    return [[topTenTopics objectForKey:@"status"] boolValue];
//}
//
//
//+(BOOL)clearNotificationForType:(NSString *)type User:(User *)user
//{
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/refer/%@/setRead.json?", type];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    if (user == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    else {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request setRequestMethod:@"POST"];
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    return [[topTenTopics objectForKey:@"status"] boolValue];
//}
//
//+(BOOL)clearNotification:(User *)user
//{
//    BOOL at = [BBSAPI clearNotificationForType:@"at" User:user];
//    BOOL reply = [BBSAPI clearNotificationForType:@"reply" User:user];
//    
//    return at&&reply;
//}
//
//+(NSArray *)boardTopics:(NSString *)board Start:(NSInteger)start Limit:(NSInteger)limit User:(User *)user Mode:(int)mode
//{
//    if(![BBSAPI isNetworkReachable] || start%limit != 0)
//    {
//        return nil;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/board/%@.json?", board];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    [baseurl appendFormat:@"&mode=%i", mode];
//    [baseurl appendFormat:@"&page=%i&count=%i", start/limit + 1, limit];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    
//    if (user != nil) {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    } else {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    
//    if (feedback == nil) {
//        return nil;
//    }
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    NSArray * Status = [JsonParseEngine parseTopics:topTenTopics];
//    if (Status == nil) {
//        return nil;
//    }
//    else {
//        return Status;
//    }
//    
//}
//
//+(NSArray *)boardTopics:(NSString *)board Start:(NSInteger)start Limit:(NSInteger)limit User:(User *)user Mode:(int)mode UserOnline:(int *)userOnline PostToday:(int *)postToday PostAll:(int *)postAll
//{
//    if(![BBSAPI isNetworkReachable] || start%limit != 0)
//    {
//        return nil;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/board/%@.json?", board];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    [baseurl appendFormat:@"&mode=%i", mode];
//    [baseurl appendFormat:@"&page=%i&count=%i", start/limit + 1, limit];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    
//    if (user != nil) {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    } else {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    
//    if (feedback == nil) {
//        return nil;
//    }
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    
//    *userOnline = [[topTenTopics objectForKey:@"user_online_count"] intValue];
//    
//    *postToday = [[topTenTopics objectForKey:@"post_today_count"] intValue];
//    
//    *postAll = [[topTenTopics objectForKey:@"post_all_count"] intValue];
//    
//    
//    NSArray * Status = [JsonParseEngine parseTopics:topTenTopics];
//    if (Status == nil) {
//        return nil;
//    }
//    else {
//        return Status;
//    }
//}
//
//+(NSArray *)replyTopic:(NSString *)board ID:(int)ID Start:(NSInteger)start User:(User *)user
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return nil;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/article/%@/%i.json?", board, ID];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    if (user != nil) {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    else {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    
//    if (feedback == nil) {
//        return nil;
//    }
//    NSDictionary *singleTopic = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    NSArray * Status = [JsonParseEngine parseReplyTopic:singleTopic];
//    if (Status == nil) {
//        return nil;
//    }
//    else {
//        return Status;
//    }
//}
//
//
//+(NSArray *)singleTopic:(NSString *)board ID:(int)ID Page:(NSInteger)page User:(User *)user
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return nil;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/threads/%@/%i.json?", board, ID];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    [baseurl appendFormat:@"&page=%i&count=20", page];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    if (user != nil) {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    else {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    
//    [request setAllowCompressedResponse:YES];
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    
//    if (feedback == nil) {
//        return nil;
//    }
//    NSDictionary *singleTopic = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    NSArray * Status = [JsonParseEngine parseSingleTopic:singleTopic];
//    if (Status == nil) {
//        return nil;
//    }
//    else {
//        return Status;
//    }
//}
//
//
//+(User *)userInfo:(NSString *)userID
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return nil;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/user/query/%@.json?", userID];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    [request setUsername:@"guest"];
//    [request setPassword:@""];
//    [request setAllowCompressedResponse:YES];
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    
//    if (feedback == nil) {
//        return nil;
//    }
//    NSDictionary *userInfo = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    User * Status = [JsonParseEngine parseUserInfo:userInfo];
//    if (Status == nil) {
//        return nil;
//    }
//    else {
//        return Status;
//    }
//}
//
//
//+(BOOL)editTopic:(User *)user Board:(NSString *)board Title:(NSString *)title Content:(NSString *)content Reid:(int)reid
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return false;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/article/%@/update/%i.json?", board, reid];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
//    if (user == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    else {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request setRequestMethod:@"POST"];
//    
//    [request setPostValue:[NSString stringWithFormat:@"%i", reid] forKey:@"reid"];
//    [request setPostValue:[title URLEncodedString] forKey:@"title"];
//    [request setPostValue:[content URLEncodedString] forKey:@"content"];
//    [request startSynchronous];
//    
//    NSData *feedback = [request responseData];
//    NSString * feedbackString = [[NSString alloc] initWithData:feedback encoding:NSUTF8StringEncoding];
//    NSLog(@"%@", feedbackString);
//    
//    if (feedback == nil) {
//        return NO;
//    }
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    NSString * code = [topTenTopics objectForKey:@"code"];
//    if (!code)
//    return YES;
//    
//    return NO;
//}
//
//+(BOOL)postTopic:(User *)user Board:(NSString *)board Title:(NSString *)title Content:(NSString *)content Reid:(int)reid
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return false;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/article/%@/post.json?", board];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
//    if (user == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    else {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request setRequestMethod:@"POST"];
//    
//    if (reid != 0) {
//        [request setPostValue:[NSString stringWithFormat:@"%i", reid] forKey:@"reid"];
//    }
//    [request setPostValue:[title URLEncodedString] forKey:@"title"];
//    [request setPostValue:[content URLEncodedString] forKey:@"content"];
//    [request startSynchronous];
//    
//    NSData *feedback = [request responseData];
//    NSString * feedbackString = [[NSString alloc] initWithData:feedback encoding:NSUTF8StringEncoding];
//    NSLog(@"%@", feedbackString);
//    
//    if (feedback == nil) {
//        return NO;
//    }
//    NSDictionary *topTenTopics = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    NSString * code = [topTenTopics objectForKey:@"code"];
//    if (!code)
//    return YES;
//    
//    return NO;
//}
//
//
//+(NSArray* )postImage:(User *)user Board:(NSString *)board ID:(int)ID Image:(UIImage *)image ImageName:(NSString *)imageName
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return nil;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    if (ID != 0) {
//        [baseurl appendFormat:@"/attachment/%@/add/%i.json?", board, ID];
//    }
//    else {
//        [baseurl appendFormat:@"/attachment/%@/add.json?", board];
//    }
//    
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
//    if (user == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    else {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request setRequestMethod:@"POST"];
//    NSData *data =UIImageJPEGRepresentation(image, 0.5);
//    [request addData:data withFileName:imageName andContentType:@"image/jpeg" forKey:@"file"];
//    [request startSynchronous];
//    
//    NSData *feedback = [request responseData];
//    NSString * feedbackString = [[NSString alloc] initWithData:feedback encoding:NSUTF8StringEncoding];
//    NSLog(@"%@", feedbackString);
//    
//    if (feedback == nil) {
//        return NO;
//    }
//    NSDictionary *attDic = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    NSArray *attArray=[JsonParseEngine parseAttachments:attDic];
//    if (attArray!=nil) {
//        return attArray;
//    }
//    else
//    {
//        return nil;
//    }
//}
//
//
//+(void)utfAppendBody:(NSMutableData *)body data:(NSString *)data {
//    [body appendData:[data dataUsingEncoding:NSUTF8StringEncoding]];
//}
//
//+(NSArray* )deleteAttachmentsFromTopic:(User *)user Board:(NSString *)board ID:(int)ID Name:(NSString *)name
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return nil;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    if (ID != 0) {
//        [baseurl appendFormat:@"/attachment/%@/delete/%i.json?", board, ID];
//    }
//    else {
//        [baseurl appendFormat:@"/attachment/%@/delete.json?", board];
//    }
//    
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
//    if (user == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    else {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request setRequestMethod:@"POST"];
//    [request setPostValue:[name URLEncodedString] forKey:@"name"];
//    [request startSynchronous];
//    
//    NSData *feedback = [request responseData];
//    NSString * feedbackString = [[NSString alloc] initWithData:feedback encoding:NSUTF8StringEncoding];
//    NSLog(@"%@", feedbackString);
//    
//    if (feedback == nil) {
//        return NO;
//    }
//    NSDictionary *attDic = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    NSArray *attArray=[JsonParseEngine parseAttachments:attDic];
//    if (attArray!=nil) {
//        return attArray;
//    }
//    else
//    {
//        return nil;
//    }
//}
//
//+(NSArray* )getAttachmentsFromTopic:(User *)user Board:(NSString *)board ID:(int)ID
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return nil;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    if (ID != 0) {
//        [baseurl appendFormat:@"/attachment/%@/%i.json?", board, ID];
//    }
//    else {
//        [baseurl appendFormat:@"/attachment/%@.json?", board];
//    }
//    
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
//    if (user == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    else {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request setRequestMethod:@"GET"];
//    [request startSynchronous];
//    
//    NSData *feedback = [request responseData];
//    if (feedback == nil) {
//        return NO;
//    }
//    NSDictionary *attDic = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    NSArray *attArray=[JsonParseEngine parseAttachments:attDic];
//    if (attArray!=nil) {
//        return attArray;
//    }
//    else
//    {
//        return nil;
//    }
//}
//
//+(BOOL)isNetworkReachable{
//    // Create zero addy
//    struct sockaddr_in zeroAddress;
//    bzero(&zeroAddress, sizeof(zeroAddress));
//    zeroAddress.sin_len = sizeof(zeroAddress);
//    zeroAddress.sin_family = AF_INET;
//    
//    // Recover reachability flags
//    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
//    SCNetworkReachabilityFlags flags;
//    
//    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
//    CFRelease(defaultRouteReachability);
//    
//    if (!didRetrieveFlags)
//    {
//        return NO;
//    }
//    BOOL isReachable = flags & kSCNetworkFlagsReachable;
//    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
//    
//    if (!(isReachable && !needsConnection)) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:nil message:@"请检查网络连接" delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
//            [alert show];
//            });
//    }
//    return (isReachable && !needsConnection) ? YES : NO;
//    }
//    
//    + (NSString *)dateToString:(NSDate *)date;
//{
//    NSMutableString * dateString = [[NSMutableString alloc] init];
//    
//    
//    NSDate *today = [NSDate date];
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    
//    NSDateComponents *dateComponents;
//    dateComponents = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekOfYearCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:date];
//    
//    NSDateComponents *todayComponents = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekOfYearCalendarUnit | NSWeekCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:today];
//    
//    if (dateComponents.year == todayComponents.year && dateComponents.month == todayComponents.month && dateComponents.day == todayComponents.day) {
//        
//        [dateString  appendString:@""];
//        
//    } else if ((dateComponents.year == todayComponents.year) && (dateComponents.month == todayComponents.month) && (dateComponents.day == todayComponents.day - 1)) {
//        
//        [dateString  appendString:@"昨天  "];
//        
//    } else if ((dateComponents.year == todayComponents.year) && (dateComponents.weekOfYear == todayComponents.weekOfYear)) {
//        
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//        dateFormatter.dateFormat = @"cccc";
//        NSArray * array = [NSArray arrayWithObjects:@"开始", @"天", @"一", @"二", @"三", @"四", @"五", @"六", nil];
//        [dateString  appendString:[NSString stringWithFormat:@"星期%@  ", [array objectAtIndex:dateComponents.weekday]]];
//        
//    } else if (dateComponents.year == todayComponents.year) {
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//        dateFormatter.dateFormat = @"MM-dd";
//        if ([dateFormatter stringFromDate:date] != nil) {
//            [dateString  appendString:[NSString stringWithFormat:@"%@  ", [dateFormatter stringFromDate:date]]];
//        }
//    } else {
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//        dateFormatter.dateFormat = @"yyyy-MM-dd";
//        if ([dateFormatter stringFromDate:date] != nil) {
//            [dateString  appendString:[NSString stringWithFormat:@"%@  ", [dateFormatter stringFromDate:date]]];
//        }
//    }
//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"HH:mm"];
//    if ([dateFormatter stringFromDate:date] != nil) {
//        [dateString  appendString:[NSString stringWithFormat:@"%@", [dateFormatter stringFromDate:date]]];
//    }
//    
//    return dateString;
//}
//
//+(NSArray *)singleTopic:(NSString *)board ID:(int)ID
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return nil;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/threads/%@/%i.json?", board, ID];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    [baseurl appendFormat:@"&page=1&count=1"];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    [request setUsername:@"guest"];
//    [request setPassword:@""];
//    
//    [request setAllowCompressedResponse:YES];
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    
//    if (feedback == nil) {
//        return nil;
//    }
//    NSDictionary *singleTopic = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    NSArray * Status = [JsonParseEngine parseSingleTopic:singleTopic];
//    if (Status == nil) {
//        return nil;
//    }
//    else {
//        return Status;
//    }
//}
//
//
//+(NSArray *)photographyTopics:(int)start
//{
//    NSArray * PhotographyArray = [BBSAPI boardTopics:@"Photo" Start:start Limit:10 User:nil Mode:6];
//    NSMutableArray * newAllArray = [[NSMutableArray alloc] init];
//    for (int i = 0; i < [PhotographyArray count]; i++) {
//        Topic * topic = [PhotographyArray objectAtIndex:i];
//        NSArray * array = [BBSAPI singleTopic:topic.board ID:topic.ID];
//        if (array != nil) {
//            topic = [array objectAtIndex:0];
//            [newAllArray addObject:topic];
//        }
//    }
//    return newAllArray;
//}
//
//+(NSArray *)picturesTopics:(int)start;
//{
//    NSArray * PicturesArray = [BBSAPI boardTopics:@"Picture" Start:start Limit:10 User:nil Mode:6];
//    NSMutableArray * newAllArray = [[NSMutableArray alloc] init];
//    for (int i = 0; i < [PicturesArray count]; i++) {
//        Topic * topic = [PicturesArray objectAtIndex:i];
//        NSArray * array = [BBSAPI singleTopic:topic.board ID:topic.ID];
//        if (array != nil) {
//            topic = [array objectAtIndex:0];
//            [newAllArray addObject:topic];
//        }
//    }
//    return newAllArray;
//}
//
//+(NSArray *)getVoteList:(User *)user Type:(NSString *)type   ///type: me|join|list|new|hot|all
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return nil;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/vote/category/%@.json?", type];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    if (user == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    else {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    NSString * feedbackString = [[NSString alloc] initWithData:feedback encoding:NSUTF8StringEncoding];
//    NSLog(@"%@", feedbackString);
//    
//    if (feedback == nil) {
//        return nil;
//    }
//    NSDictionary *singleTopic = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    NSArray * Status = [JsonParseEngine parseVoteList:singleTopic];
//    if (Status == nil) {
//        return nil;
//    }
//    else {
//        return Status;
//    }
//}
//
//
//+(Vote *)getSingleVote:(User *)user ID:(int)ID
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return nil;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/vote/%i.json?", ID];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    if (user == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    else {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    
//    if (feedback == nil) {
//        return nil;
//    }
//    NSDictionary *singleVote = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    Vote *vote = [JsonParseEngine parseSingleVote:singleVote];
//    if (vote == nil) {
//        return nil;
//    }
//    else {
//        return vote;
//    }
//}
//
//+(Vote *)doVote:(User *)user ID:(int)ID VoteArray:(NSArray *)voteArray
//{
//    if(![BBSAPI isNetworkReachable])
//    {
//        return nil;
//    }
//    
//    NSMutableString * baseurl = [APIADDR mutableCopy];
//    [baseurl appendFormat:@"/vote/%i.json?", ID];
//    [baseurl appendFormat:@"appkey=%@", APPKEY];
//    
//    NSURL *url = [NSURL URLWithString:baseurl];
//    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
//    if (user == nil) {
//        [request setUsername:@"guest"];
//        [request setPassword:@""];
//    }
//    else {
//        [request setUsername:user.username];
//        [request setPassword:user.password];
//    }
//    [request setAllowCompressedResponse:YES];
//    [request setRequestMethod:@"POST"];
//    
//    if ([voteArray count] == 1) {
//        NSString *vote = [voteArray objectAtIndex:0];
//        [request setPostValue:[vote URLEncodedString] forKey:@"vote"];
//    }
//    else if ([voteArray count] > 1){
//        for (NSString *vote in voteArray)
//            [request addPostValue:vote forKey:@"vote[]"];
//    }
//    
//    [request startSynchronous];
//    NSData *feedback = [request responseData];
//    
//    if (feedback == nil) {
//        return nil;
//    }
//    NSDictionary *singleVote = [NSJSONSerialization JSONObjectWithData:feedback options:kNilOptions error:nil];
//    Vote *returnVote = [JsonParseEngine parseSingleVote:singleVote];
//    if (returnVote == nil) {
//        return nil;
//    }
//    else {
//        return returnVote;
//    }
//}
//@end





