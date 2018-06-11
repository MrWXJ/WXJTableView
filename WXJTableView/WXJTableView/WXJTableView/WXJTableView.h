//
//  WXJTableView.h
//  Iplus
//
//  Created by 贵州众智博信 on 2018/4/26.
//  Copyright © 2018年 zzbx. All rights reserved.
//

/**
 封装的UITableView
 结合了MJRefresh控件
 */

#import <UIKit/UIKit.h>

//NS_ASSUME_NONNULL_BEGIN

/**
 分区区数

 @param tableView tableView
 @return 分区的区数
 */
typedef NSInteger(^NumberOfSectionsInTableView)(UITableView * _Nullable tableView);

/**
 设置每个分区cell的个数

 @param tableView tableView
 @param section section
 @return cell的个数
 */
typedef NSInteger(^NumberOfRowsInSection)(UITableView * _Nonnull tableView,NSInteger section);

/**
 设置cell的高度

 @param tableView tableView
 @param indexPath indexPath
 @return cell的高度
 */
typedef CGFloat(^HeightForRowAtIndexPath)(UITableView * _Nonnull tableView,NSIndexPath *_Nonnull indexPath);

/**
 设置头部分区的高度

 @param tableView tableView
 @param section section
 @return 头部分区高度
 */
typedef CGFloat(^HeightForHeaderInSection)(UITableView * _Nullable tableView,NSInteger section);

/**
 设置尾部分区的高度

 @param tableView tableView
 @param section section
 @return 尾部分区高度
 */
typedef CGFloat(^HeightForFooterInSection)(UITableView * _Nullable tableView,NSInteger section);

/**
 设置cell

 @param tableView tableView
 @param indexPath indexPath
 @return cell
 */
typedef UITableViewCell*_Nonnull(^CellForRowAtIndexPath)(UITableView * _Nonnull tableView,NSIndexPath *_Nonnull indexPath);

/**
 头部分区视图

 @param tableView tableView
 @param section section
 @return 头部分区视图
 */
typedef UIView*_Nullable(^ViewForHeaderInSection)(UITableView * _Nullable tableView,NSInteger section);

/**
 尾部分区视图

 @param tableView tableView
 @param section section
 @return 尾部分区视图
 */
typedef UIView*_Nullable(^ViewForFooterInSection)(UITableView * _Nullable tableView,NSInteger section);

/**
 点击cell事件

 @param tableView tableView
 @param indexPath indexPath
 */
typedef void(^DidSelectRowAtIndexPath)(UITableView * _Nullable tableView,NSIndexPath * _Nullable indexPath);


/**
 WXJTableview的协议
 */
@protocol WXJTableViewDelegate <NSObject>

@optional

- (void)WXJTableViewWithScrollView:(UIScrollView *_Nonnull)scrollView;

@end

/**
 Style枚举
 */
enum TableViewStyle {
    TableViewStylePlain = 1,
    TableViewStyleGrouped = 2,
};

@interface WXJTableView : UIView

/**
 设置tableView的背景颜色
 */
@property(nonatomic,copy) UIColor * _Nonnull backgroundColor;

/**
 分割线颜色
 */
@property(nonatomic,copy) UIColor * _Nonnull separatorColor;

/**
 开启系统默认的cell的分割线颜色
 */
@property(nonatomic,assign) BOOL isOpenSeparatorColor;

/**
 default YES. show indicator while we are tracking. fades out after tracking
 */
@property(nonatomic) BOOL showsHorizontalScrollIndicator;

/**
 default YES. show indicator while we are tracking. fades out after tracking
 */
@property(nonatomic) BOOL showsVerticalScrollIndicator;

/**
 WXJTableView代理
 */
@property(nonatomic,retain)_Nonnull id <WXJTableViewDelegate> tableViewDelegate;

/**
 tableView
 */
@property (nonatomic, strong) UITableView * _Nonnull tableView;

@property (nonatomic, assign) float style;

/**
 table头部视图
 */
@property (nonatomic, strong, nullable) UIView *tableHeaderView;

/**
 table尾部视图
 */
@property (nonatomic, strong, nullable) UIView *tableFooterView;


/**
 显示TableView
 
 @param view 要显示在的view
 */
- (void)showInView:(UIView *_Nonnull)view;


/**
 刷新TableView
 */
- (void)reloadData;



/**
 初始化UITableView[不包含头/尾部视图]
 
 @param frame 大小
 @param tableViewStyle Style
 @param numberOfSectionsInTableView 分区
 @param numberOfRowsInSection cell个数
 @param heightForRowAtIndexPath cell高度
 @param cellForRowAtIndexPath cell
 @param didSelectRowAtIndexPath cell点击事件
 @return UITableView
 */
- (instancetype _Nonnull )initWithFrame:(CGRect)frame
               tableViewStyle:(enum TableViewStyle)tableViewStyle
            numberOfSectionsInTableView:(NumberOfSectionsInTableView _Nullable )numberOfSectionsInTableView
                  numberOfRowsInSection:(NumberOfRowsInSection _Nonnull )numberOfRowsInSection
                heightForRowAtIndexPath:(HeightForRowAtIndexPath _Nonnull )heightForRowAtIndexPath
                  cellForRowAtIndexPath:(CellForRowAtIndexPath _Nonnull )cellForRowAtIndexPath
                didSelectRowAtIndexPath:(DidSelectRowAtIndexPath _Nullable )didSelectRowAtIndexPath;

/**
 初始化UITableView[包含头/尾部视图]
 
 @param frame 大小
 @param tableViewStyle Style
 @param numberOfSectionsInTableView 分区
 @param numberOfRowsInSection cell个数
 @param heightForRowAtIndexPath cell高度
 @param heightForHeaderInSection 分区头部高度
 @param heightForFooterInSection 分区尾部高度
 @param cellForRowAtIndexPath cell
 @param viewForHeaderInSection 分区头部视图
 @param viewForFooterInSection 分区尾部视图
 @param didSelectRowAtIndexPath cell点击事件
 @return UITableView
 */
- (instancetype _Nonnull )initWithFrame:(CGRect)frame
               tableViewStyle:(enum TableViewStyle)tableViewStyle
            numberOfSectionsInTableView:(NumberOfSectionsInTableView _Nullable )numberOfSectionsInTableView
                  numberOfRowsInSection:(NumberOfRowsInSection _Nonnull )numberOfRowsInSection
                heightForRowAtIndexPath:(HeightForRowAtIndexPath _Nonnull )heightForRowAtIndexPath
               heightForHeaderInSection:(HeightForHeaderInSection _Nullable )heightForHeaderInSection
               heightForFooterInSection:(HeightForFooterInSection _Nullable )heightForFooterInSection
                  cellForRowAtIndexPath:(CellForRowAtIndexPath _Nonnull )cellForRowAtIndexPath
                 viewForHeaderInSection:(ViewForHeaderInSection _Nullable )viewForHeaderInSection
                 viewForFooterInSection:(ViewForFooterInSection _Nullable )viewForFooterInSection
                didSelectRowAtIndexPath:(DidSelectRowAtIndexPath _Nullable )didSelectRowAtIndexPath;

@end


//NS_ASSUME_NONNULL_END

