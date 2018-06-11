# WXJTableView
对UITableView进行二次封装，调用更加方便

//使用举例

//1.不包含分区
    WXJTableView *tableView1 = [[WXJTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) tableViewStyle:TableViewStylePlain numberOfSectionsInTableView:nil numberOfRowsInSection:^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
        return 10;
    } heightForRowAtIndexPath:^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        return 60.0f;
    } cellForRowAtIndexPath:^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        static NSString *cellId = @"cellId";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    } didSelectRowAtIndexPath:^(UITableView * _Nullable tableView, NSIndexPath * _Nullable indexPath) {
        NSLog(@"%ld",indexPath.row);
    }];
    [tableView1 showInView:self.view];
    
    //2.包含分区
//    WXJTableView *tableView2 = [[WXJTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) tableViewStyle:TableViewStyleGrouped numberOfSectionsInTableView:^NSInteger(UITableView * _Nullable tableView) {
//        return 3;
//    } numberOfRowsInSection:^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
//        return 2;
//    } heightForRowAtIndexPath:^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
//        return 60.0f;
//    } heightForHeaderInSection:^CGFloat(UITableView * _Nullable tableView, NSInteger section) {
//        return 10.0f;
//    } heightForFooterInSection:^CGFloat(UITableView * _Nullable tableView, NSInteger section) {
//        return 10.0f;
//    } cellForRowAtIndexPath:^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
//        static NSString *cellId = @"cellId";
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
//        if (!cell) {
//            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
//            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        }
//        return cell;
//    } viewForHeaderInSection:^UIView * _Nullable(UITableView * _Nullable tableView, NSInteger section) {
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 10)];
//        view.backgroundColor = [UIColor redColor];
//        return view;
//    } viewForFooterInSection:^UIView * _Nullable(UITableView * _Nullable tableView, NSInteger section) {
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 10)];
//        view.backgroundColor = [UIColor orangeColor];
//        return view;
//    } didSelectRowAtIndexPath:^(UITableView * _Nullable tableView, NSIndexPath * _Nullable indexPath) {
//        NSLog(@"%ld",indexPath.row);
//    }];
//    [tableView2 showInView:self.view];
