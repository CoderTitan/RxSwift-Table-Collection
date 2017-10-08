# RxSwift-Table-Collection
## 支持环境:
#### Xcode8.3.3

## 项目简介:
- 1.登录注册功能
  - 输入用户名要大于6个字符，不然密码不能输入
  - 密码必须大于6个字符，不然重复密码不能输入
  - 重复密码输入必须和密码一样，不然注册按钮不能点击
  - 根据输入的字符是否合法,按钮动态的改变颜色
- 2.UITableView和搜索SertchBar的应用
  - searchBar根据输入的字体展示包含该字体的cell列表
  - [RxSwift](https://github.com/ReactiveX/RxSwift)实现tableView列表展示
- 3.[Moya](https://github.com/Moya/Moya)+[RxSwift](https://github.com/ReactiveX/RxSwift)实现网络请求
  - 应用[RxSwift](https://github.com/ReactiveX/RxSwift)在UICollectionView中的应用
  - 用[Moya](https://github.com/Moya/Moya)进行网络请求
  - [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper)进行json到model的数据解析
  - 整个[Demo](https://github.com/coderQuanjun/RxSwift-Table-Collection)的架构使用[MVVM](http://www.codertian.com/2015/11/13/MVVM-patterns-introduce/)
