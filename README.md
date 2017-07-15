#慕游网

公众号：全栈程序员之路
![输入图片说明](https://mp.weixin.qq.com/mp/qrcode?scene=10000004&size=102&__biz=MzIzMTE0NTE5Mg==&mid=2651421365&idx=1&sn=ec2b310f1888fca3560ba504af0077f5&send_time= "在这里输入图片标题")

产品预览图：
1 首页
![输入图片说明](https://git.oschina.net/uploads/images/2017/0715/212233_a815d2bf_3018.png "在这里输入图片标题")
2 行程
![输入图片说明](https://git.oschina.net/uploads/images/2017/0715/212247_8699a076_3018.png "在这里输入图片标题")
3 我的主页
![输入图片说明](https://git.oschina.net/uploads/images/2017/0715/212300_c37e728b_3018.png "在这里输入图片标题")
4 图片上传
![输入图片说明](https://git.oschina.net/uploads/images/2017/0715/212311_c1f57006_3018.png "在这里输入图片标题")


## 产品定位
来一场说走就说的旅行吧，我们为你精选了景点，线路，酒店，机票等，记录你探索世界的轨迹，分享旅途中的点点滴滴。

## 产品解决的痛点
旅游一站式服务，机票，酒店，餐厅，景点，线路都是精选挑选

## 产品潜在客户
1. 自驾游客户
2. 旅游散客

## 技术架构
1. Java：JFinal框架
2. 缓存：EhCache，Redis
3. 静态模板框架：Beetl
4. 后台UI框架：B-JUI
5. 数据库：MySql
6. 后台服务器：阿里云centos6
7. 图片存储服务：又拍云
8. 前端UI：bootstrap
9. 地图：google
10. GPS解析：Sanselan

## 技术选型描述
1. 地图：全球旅行，google地图必选，百度地图，仅能国内使用。使用google地图的时候，因为google服务的问题，.cn，有时会有偶尔的范围问题。并且，google的Api,真的很挫，很挫。
2. bootstrap：很流行的前端UI框架，包有点大，但是对于没有专业前端的团队，很有优势。注意：bootstrap官方不支持IE6，虽然有第三方bsie,使用的时候，可能还会遇到一些坑。
3. Sanselan：Java图片解析库，因为是Java开发，处理速度要慢些。

## 建议图片存储
1. 图片存储这些，放到七牛，又拍云等第三方平台上，前期专注前端开发，
2. 图片的缩放/解析等，使用第三方平台接口。

