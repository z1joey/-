//
//  dealModel.h
//  团购项目
//
//  Created by Yi Zhang on 2019/2/26.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface dealModel : NSObject

@property (nonatomic, copy)NSString *categories;
@property (nonatomic, copy)NSString *city;
@property (nonatomic, copy)NSString *current_price;
@property (nonatomic, copy)NSString *deal_h5_url;
@property (nonatomic, copy)NSString *deal_url;
@property (nonatomic, copy)NSString *Description;
@property (nonatomic, copy)NSString *image_url;
@property (nonatomic, copy)NSString *s_image_url;
@property (nonatomic, copy)NSString *list_price;
@property (nonatomic, copy)NSString *purchase_deadline;
@property (nonatomic, copy)NSString *title;


- (NSArray *)asignModelWithDict:(NSDictionary *)dict;
/*
 {
 businesses =             (
 {
 city = "\U5317\U4eac";
 "h5_url" = "http://m.dianping.com/shop/5475625?utm_source=open&appKey=975791789";
 id = 5475625;
 latitude = "40.008327";
 longitude = "116.3553";
 name = "\U6b22\U4e50\U6c47\U91cf\U8d29KTV";
 url = "http://www.dianping.com/shop/5475625?utm_source=open&appKey=975791789";
 }
 );
 categories =             (
 KTV
 );
 city = "\U5317\U4eac";
 "commission_ratio" = 0;
 "current_price" = 39;
 "deal_h5_url" = "http://m.dianping.com/tuan/deal/12261175?utm_source=open&appKey=975791789";
 "deal_id" = "2-12261175";
 "deal_url" = "http://t.dianping.com/deal/12261175?utm_source=open&appKey=975791789";
 description = "\U6b22\U4e50\U6c47\U91cf\U8d29ktv \U4e0b\U5348\U573a/\U665a\U573a/\U5348\U591c\U573a4\U5c0f\U65f6ktv\U6b22\U5531\U5238 \U4ec5\U552e39\U5143\Uff0c\U4ef7\U503c264\U5143\U4e0b\U5348\U573a/\U665a\U573a/\U5348\U591c\U573a4\U5c0f\U65f6ktv\U6b22\U5531\U5238\Uff0c\U53ef\U8fde\U7eed\U6b22\U5531\Uff01\U514d\U5f00\U673a\U8d39\Uff0c\U514d\U8d39wifi\Uff01";
 distance = "-1";
 "image_url" = "http://p0.meituan.net/dpdeal/ba0f20fb00b0ce6abcdb06708a499b4a93148.jpg%40640w_400h_1e_1c_1l%7Cwatermark%3D1%26%26r%3D1%26p%3D9%26x%3D2%26y%3D2%26relative%3D1%26o%3D20";
 "list_price" = 264;
 "publish_date" = "2015-06-01";
 "purchase_count" = 33721;
 "purchase_deadline" = "2019-09-02";
 regions =             (
 "\U6d77\U6dc0\U533a"
 );
 "s_image_url" = "http://p0.meituan.net/dpdeal/ba0f20fb00b0ce6abcdb06708a499b4a93148.jpg%40160w_100h_1e_1c_1l%7Cwatermark%3D1%26%26r%3D1%26p%3D9%26x%3D2%26y%3D2%26relative%3D1%26o%3D20";
 title = "\U6b22\U4e50\U6c47\U91cf\U8d29KTV";
 }
*/

@end

NS_ASSUME_NONNULL_END
