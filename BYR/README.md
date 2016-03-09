##BYR

整个BYR论坛使用了MVC作为低层框架

##Model层
使用了Realm做数据持久化处理。


##UI层
整个视图跳转基本通过 Storyboard来组织逻辑。在 Main.storyboard 中可以看到主要的界面跳转以及连接的实现方式。利用 Storyboard References 的新特性，将不同的 ViewController 分散到不同的功能文件夹的 Storyboard 中.

##业务层
1. 用户相关：OAUTH登入，用户基本信息，用NSUserDefault来存储用户信息
2. 网络请求，通过Alamofire+SwiftyJSON来实现网络的请求，JSON解析和初始化，通过MJExtension实现字典模型互转。
3. 界面主要是用tabBarViewController来区分各个模块主要，主要有三块，热门事件，用户信息展示，板块展示。


##正在做的事
添加Proposer来做授权的事
添加发表文章的模块