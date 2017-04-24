//
//  APIConfig.h
//  wz-inke
//
//  Created by KDB on 2017/4/24.
//  Copyright © 2017年 jwz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIConfig : NSObject

//信息类服务器地址
#define SERVER_HOST @"http://service.ingkee.com"

//图片服务器地址
#define IMAGE_HOST @"http://img.meelive.cn"




#define API_Focuse @"http://218.11.0.112/api/live/homepage?&gender=1&gps_info=200%2C200&loc_info=&is_new_user=0&lc=0000000000000053&cc=TG0001&cv=IK4.0.30_Iphone&proto=7&idfa=00000000-0000-0000-0000-000000000000&idfv=1D949236-DD9D-45D3-9120-097B0B61E709&devi=5d054bef9046f6b7568ad5efa3080b9d509f7186&osversion=ios_10.300000&ua=iPhone7_2&imei=&imsi=&uid=132206997&sid=20b0kQxOaMop2e4i0Zi2i2pg2332nYAkYckt6Pi25kRnpp7dQv1TBZ&conn=wifi&mtid=5585a393effd4720b5b8cdaf9ff216a3&mtxid=d815df5e3c&logid=&location=&hfv=1.1&type=1&multiaddr=1&deleted_uids=8228923%2C8111119%2C212267578%2C21884361%2C14719472&s_sg=e8fd74eae423a9587c156a52e3a163b6&s_sc=100&s_st=1493040235"

//热门直播
#define API_HotLive @"http://218.11.0.112/api/live/gettop?&gender=1&gps_info=200%2C200&loc_info=&is_new_user=0&lc=0000000000000053&cc=TG0001&cv=IK4.0.30_Iphone&proto=7&idfa=00000000-0000-0000-0000-000000000000&idfv=1D949236-DD9D-45D3-9120-097B0B61E709&devi=5d054bef9046f6b7568ad5efa3080b9d509f7186&osversion=ios_10.300000&ua=iPhone7_2&imei=&imsi=&uid=132206997&sid=20b0kQxOaMop2e4i0Zi2i2pg2332nYAkYckt6Pi25kRnpp7dQv1TBZ&conn=wifi&mtid=5585a393effd4720b5b8cdaf9ff216a3&mtxid=d815df5e3c&logid=&count=5&multiaddr=1&s_sg=256857934b57addcd86a0da8b62f1243&s_sc=100&s_st=1493040235"

//附近的人
#define API_NearLive @"http://218.11.0.112/api/live/near_flow_old?&gender=1&gps_info=200%2C200&loc_info=&is_new_user=0&lc=0000000000000053&cc=TG0001&cv=IK4.0.30_Iphone&proto=7&idfa=00000000-0000-0000-0000-000000000000&idfv=1D949236-DD9D-45D3-9120-097B0B61E709&devi=5d054bef9046f6b7568ad5efa3080b9d509f7186&osversion=ios_10.300000&ua=iPhone7_2&imei=&imsi=&uid=132206997&sid=20b0kQxOaMop2e4i0Zi2i2pg2332nYAkYckt6Pi25kRnpp7dQv1TBZ&conn=wifi&mtid=5585a393effd4720b5b8cdaf9ff216a3&mtxid=d815df5e3c&logid=&latitude=200&longitude=200&multiaddr=1&interest=0&s_sg=42d5e968b52921d29bcfb7caf87a46ce&s_sc=100&s_st=1493040235"

//广告地址
#define API_Advertise @""


@end
