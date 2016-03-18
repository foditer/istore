 //
//  Common.h
//  小红书
//
//  Created by 李志文 on 16/2/9.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#ifndef Common_h
#define Common_h

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#define kPersonAPI @"http://www.xiaohongshu.com/api/sns/v1/user/me?deviceId=499FC413-D9F9-40B9-94A3-3E31158DAAEF&lang=zh-Hans-CN&platform=iOS&sid=session.1139938182842346226&sign=0a9bf68b8f34e7092e676fcae8f93a69&t=1455624784"

#define kMessageAPI @"http://www.xiaohongshu.com/api/sns/v2/message?deviceId=499FC413-D9F9-40B9-94A3-3E31158DAAEF&lang=zh-Hans-CN&num=10&platform=iOS&sid=session.1139938182842346226&sign=ef4d0701e41ffc3ce2995c8bd73c32e9&source=discovery&start=56caee0fd68bbd357b797cd1&t=1456228425&type=activities"

#define kMyNotesAPI @"http://www.xiaohongshu.com/api/sns/v1/discovery/list?deviceId=499FC413-D9F9-40B9-94A3-3E31158DAAEF&lang=zh-Hans-CN&note_id=56c2a3adfaa05232d7aa8fd5&num=10&oid=56a83c53b8ce1a724856bab2&platform=iOS&sid=session.1139938182842346226&sign=886d284017816352f47292f8afa9d410&t=1456147136&type=user"

#define kMySpecialAPI @"http://www.xiaohongshu.com/api/sns/v1/board/user/56a83c53b8ce1a724856bab2?deviceId=499FC413-D9F9-40B9-94A3-3E31158DAAEF&lang=zh-Hans-CN&num=2&page=1&platform=iOS&sid=session.1139938182842346226&sign=aa99f5a9fb7576055638be5706425465&t=1456216414"

#define kNoteTagAPI @"http://www.xiaohongshu.com/api/v1/tags/list?deviceId=499FC413-D9F9-40B9-94A3-3E31158DAAEF&filter=liked&lang=zh-Hans-CN&oid=user.56a83c53b8ce1a724856bab2&platform=iOS&sid=session.1139938182842346226&sign=f8b7060ae70f1b5735f2661942caa26e&t=1456280677"
//系统版本
#define   kVersion   [[UIDevice currentDevice].systemVersion floatValue]

#endif /* Common_h */
