##BYR

整个BYR论坛使用了MVC作为低层框架

##Model层
使用了Realm做数据持久化处理。


##UI层
整个视图跳转基本通过 Storyboard来组织逻辑。在 Main.storyboard 中可以看到主要的界面跳转以及连接的实现方式。利用 Storyboard References 的新特性，将不同的 ViewController 分散到不同的功能文件夹的 Storyboard 中.

1. 主界面主要是用tabBarViewController来区分各个模块主要，主要有三块，Home模块，用户信息展示，板块展示。Home界面主要包括学校的十大信息，推荐信息（本校人员经常看的文章），这一块主要是用PageMenu来做这个界面。板块展示，主要是描述了论坛各个板块的信息，可以访问到各个板块的文章。总计3000行代码.
2. 文章内容展示这块主要是文章内容的解析，富文本的实现。主要由简单工厂模式来处理，文字，图片，表情，超链接的渲染，包括文章cell的自适应大小，图片的展示和保存。1500行代码

##业务层
1. 用户相关：OAUTH登入，用户基本信息，用NSUserDefault来存储用户信息，用户登入登出界面。总计1200行代码
2. 网络请求，通过Alamofire+SwiftyJSON来实现网络的请求，JSON解析和初始化，通过MJExtension实现字典模型互转。总计1000多行代码
3. 缓存，主要使用Kingfisher来做图片上面的缓存。


##调试
使用Charles进行抓包，进行分析，使用Reveal进行UI调试

##正在做的事
1. 添加Proposer来做授权的事
2. 添加发表文章的模块