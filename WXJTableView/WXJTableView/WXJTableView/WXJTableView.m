//
//  WXJTableView.m
//  Iplus
//
//  Created by 贵州众智博信 on 2018/4/26.
//  Copyright © 2018年 zzbx. All rights reserved.
//

#import "WXJTableView.h"

#define RGBCOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

@interface WXJTableView () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NumberOfSectionsInTableView numberOfSectionsInTableView;
@property (nonatomic,strong) NumberOfRowsInSection numberOfRowsInSection;
@property (nonatomic,strong) HeightForRowAtIndexPath heightForRowAtIndexPath;
@property (nonatomic,strong) HeightForHeaderInSection heightForHeaderInSection;
@property (nonatomic,strong) HeightForFooterInSection heightForFooterInSection;
@property (nonatomic,strong) CellForRowAtIndexPath cellForRowAtIndexPath;
@property (nonatomic,strong) ViewForHeaderInSection viewForHeaderInSection;
@property (nonatomic,strong) ViewForFooterInSection viewForFooterInSection;
@property (nonatomic,strong) DidSelectRowAtIndexPath didSelectRowAtIndexPath;


@end

@implementation WXJTableView

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
                didSelectRowAtIndexPath:(DidSelectRowAtIndexPath _Nullable )didSelectRowAtIndexPath {
    self = [super initWithFrame:frame];
    self.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:1];
    if (self) {
        self.style = tableViewStyle;
        
        self.numberOfSectionsInTableView = numberOfSectionsInTableView;
        self.numberOfRowsInSection = numberOfRowsInSection;
        self.heightForRowAtIndexPath = heightForRowAtIndexPath;
        self.cellForRowAtIndexPath = cellForRowAtIndexPath;
        self.didSelectRowAtIndexPath = didSelectRowAtIndexPath;
        
        self.heightForHeaderInSection = heightForHeaderInSection;
        self.heightForFooterInSection = heightForFooterInSection;
        self.viewForHeaderInSection = viewForHeaderInSection;
        self.viewForFooterInSection = viewForFooterInSection;
        
        [self buildTabeleView];
    }
    return self;
}


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
                didSelectRowAtIndexPath:(DidSelectRowAtIndexPath _Nullable )didSelectRowAtIndexPath {
    self = [super initWithFrame:frame];
    self.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:1];
    if (self) {
        self.style = tableViewStyle;
        
        self.numberOfSectionsInTableView = numberOfSectionsInTableView;
        self.numberOfRowsInSection = numberOfRowsInSection;
        self.heightForRowAtIndexPath = heightForRowAtIndexPath;
        self.cellForRowAtIndexPath = cellForRowAtIndexPath;
        self.didSelectRowAtIndexPath = didSelectRowAtIndexPath;
        
        
        [self buildTabeleView];
    }
    return self;
}

- (void)buildTabeleView {
    //1.设置style
    UITableViewStyle sty;
    if (self.style == 1) {
        sty = UITableViewStylePlain;
    } else {
        sty = UITableViewStyleGrouped;
    }
    //2.创建
    _tableView = [[UITableView alloc] initWithFrame:self.bounds style:sty];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.separatorColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;
    [self addSubview:_tableView];
}

#pragma mark ------ UITabelView Delegate ------

/**
 分区个数
 
 @param tableView tableView description
 @return return value description
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.numberOfSectionsInTableView) {
        return self.numberOfSectionsInTableView(tableView);
    } else {
        return 1;
    }
}

/**
 各个分区的cell的个数

 @param tableView tableView description
 @param section section description
 @return return value description
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.numberOfRowsInSection) {
        return self.numberOfRowsInSection(tableView,section);
    } else {
        return 0;
    }
}

/**
 cell的高度

 @param tableView tableView description
 @param indexPath indexPath description
 @return return value description
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.heightForRowAtIndexPath) {
        return self.heightForRowAtIndexPath(tableView, indexPath);
    } else {
        return 0;
    }
}

/**
 头部分区高度

 @param tableView tableView
 @param section section
 @return return value
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.heightForHeaderInSection) {
        return self.heightForHeaderInSection(tableView, section);
    } else {
        return 0;
    }
}

/**
 尾部分区高度

 @param tableView tableView
 @param section section
 @return return value
 */
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.heightForFooterInSection) {
        return self.heightForFooterInSection(tableView, section);
    } else {
        return 0;
    }
}

/**
 cellForRow

 @param tableView tableView description
 @param indexPath indexPath description
 @return return value description
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cellForRowAtIndexPath) {
        return self.cellForRowAtIndexPath(tableView, indexPath);
    } else {
        return nil;
    }
}

/**
 头部分区View

 @param tableView tableView
 @param section section
 @return return value
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.viewForHeaderInSection) {
        return self.viewForHeaderInSection(tableView, section);
    } else {
        return nil;
    }
}

/**
 尾部分区View

 @param tableView tableView
 @param section section
 @return return value
 */
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (self.viewForFooterInSection) {
        return self.viewForFooterInSection(tableView, section);
    } else {
        return nil;
    }
}

/**
 didSelectRow

 @param tableView tableView description
 @param indexPath indexPath description
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didSelectRowAtIndexPath) {
        self.didSelectRowAtIndexPath(tableView,indexPath);
    }
}

/**
 需要通过UIScrollView来做相应的处理

 @param scrollView scrollView
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([_tableViewDelegate respondsToSelector:@selector(WXJTableViewWithScrollView:)]) {
        [_tableViewDelegate WXJTableViewWithScrollView:scrollView];
    }
}

/**
 显示TableView

 @param view 要显示在的view
 */
- (void)showInView:(UIView *)view {
    [view addSubview:self];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

#pragma mark ------ 功能扩展 ------

/**
 刷新TableView
 */
- (void)reloadData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [_tableView reloadData];
    });
}

#pragma mark ------ 属性扩展 ------

/**
 设置tableView的背景颜色

 @param backgroundColor 即将要设置的颜色
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor {
    _tableView.backgroundColor = backgroundColor;
}

/**
 开启系统的默认的cell的分割线颜色

 @param isOpenSeparatorColor 状态值
 */
- (void)setIsOpenSeparatorColor:(BOOL)isOpenSeparatorColor {
    if (isOpenSeparatorColor == YES) {
        _tableView.separatorColor = RGBCOLOR(228, 228, 228, 1);
    } else {
        _tableView.separatorColor = [UIColor clearColor];
    }
}

/**
 设置tableView的cell的分割线颜色

 @param separatorColor 即将要设置的颜色
 */
- (void)setSeparatorColor:(UIColor *)separatorColor {
    _tableView.separatorColor = separatorColor;
}

/**
 default YES. show indicator while we are tracking. fades out after tracking
 */
- (void)setShowsHorizontalScrollIndicator:(BOOL)showsHorizontalScrollIndicator {
    _tableView.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator;
}

/**
 default YES. show indicator while we are tracking. fades out after tracking
 */
- (void)setShowsVerticalScrollIndicator:(BOOL)showsVerticalScrollIndicator {
    _tableView.showsVerticalScrollIndicator = showsVerticalScrollIndicator;
}

/**
 accessory view for above row content. default is nil. not to be confused with section header
 */
- (void)setTableHeaderView:(UIView *)tableHeaderView {
    _tableView.tableHeaderView = tableHeaderView;
}

/**
 accessory view below content. default is nil. not to be confused with section footer
 */
- (void)setTableFooterView:(UIView *)tableFooterView {
    _tableView.tableFooterView = tableFooterView;
}

@end
