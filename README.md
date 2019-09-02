# SmallCMS Service Api Description

## API 下载

从 github 上下载源码。本服务端接口采用 GO 语言开发，我编译了三端的代码。分别支持 linux\mac 和 windows。

```#
git clone https://github.com/fengcms/Small-Cms-Service-Go
```

可采用 git 下载，或者直接在 github 下载 zip 的压缩包。

## 运行服务端

本服务端由GO语言编写，运行于命令下面。文件说明如下：
**mac/linux**

文件|说明
---|---
config|配置文件
news|API接口编译文件
news.db|sql lite 数据库文件
run.sh|运行脚本

**windows**

文件|说明
---|---
config|配置文件
news.exe|API接口编译文件
news.db|sql lite 数据库文件
run.bat|运行脚本

### config 配置文件

代码如下：
```#
ADDR = "127.0.0.1:56000"
CORS_ORIGINS = ["http://localhost:8080", "http://127.0.0.1:8080", "http://x.com", ]
```
`ADDR` 值为API服务运行的IP地址与端口
`CORS_ORIGINS` 是允许请求的页面地址

也就是说，我们的API接口，只允许我们配置的地址访问，其他地址不能访问。

### MAC\linux 下跑服务端

```#
// 进入服务端文件夹 mac
cd Small-Cms-Service-Go/mac
```
```#
// 进入服务端文件夹 liunx
cd Small-Cms-Service-Go/liunx
```
```#
// 给运行文件添加可执行权限（如果不能运行的话，跑一下这个命令，一般不需要）
chmod +x ./run.sh
// 跑起来
./run.sh
```
跑起来之后，会在终端显示如下内容：

```#
fungleodeMBP:mac fungleo$ ./run.sh
⇛ http server started on 127.0.0.1:56000
```
则表示接口已经跑起来了。

### windows 下跑服务端

打开文件夹，进入 windows 文件夹，双击下面的 `run.bat` 文件，即可打开一个命令行窗口，就跑起来了。

## 接口详细说明

**接口前置路径**
```#
http://127.0.0.1:56000/api/v1/
```
如端口或IP有修改，请修改为你修改后的路径。默认前置路径为`/api/v1/`

## 用户信息

|用户名|密码|
|--|--|
|admin|123456|
### login

方法：`POST`
用途：登录接口
参数：
```js
{
	account:'',		// 账户
	password: ''	// 密码
}
```

### logout

方法：`GET`
用途：退出登录接口
参数：无

### article

方法：`GET`
用途：获取文章列表
参数：
```js
{
	title: '',				// 文章标题
	channel_id: 1,			// 文章归属栏目ID
	page: 1					// 获取第几页
}
```
其他说明：参数都不是必填。

方法：`POST`
用途：添加文章内容
参数：
```js
{
	title: ''				// 文章标题
	channel_id: 1			// 文章归属栏目ID
	author: ''				// 文章作者
	origin: ''				// 文章来源
	editor: ''				// 文章编辑
	content: ''				// 文章内容
	img: ''					// 文章配图
}
```
其他说明：文章标题和文章归属栏目ID以及文章内容为必填

### article/:id

方法：`GET`
用途：获取文章详情
参数：无

方法：`PUT`
用途：编辑文章内容
参数：
```js
{
	title: ''				// 文章标题
	channel_id: 1			// 文章归属栏目ID
	author: ''				// 文章作者
	origin: ''				// 文章来源
	editor: ''				// 文章编辑
	content: ''				// 文章内容
	img: ''					// 文章配图
}
```
其他说明：文章标题和文章归属栏目ID以及文章内容为必填

方法：`DELETE`
用途：删除某ID的文章
参数：无

### channel

方法：`GET`
用途：获取栏目列表
参数：
```js
{
	page: 1					// 获取第几页
}
```

方法：`POST`
用途：添加栏目内容
参数：
```js
{
	name: ''				// 栏目名称
}
```
其他说明：栏目名称为必填

### channel/:id

方法：`GET`
用途：获取栏目详情
参数：无

方法：`PUT`
用途：编辑栏目内容
参数：
```js
{
	name: ''				// 栏目名称
}
```
其他说明：栏目名称为必填

方法：`DELETE`
用途：删除某ID的栏目
参数：无

### manage

方法：`GET`
用途：获取管理员列表
参数：
```js
{
	page: 1					// 获取第几页
}
```

方法：`POST`
用途：添加管理员内容
参数：
```js
{
	username: ''				// 管理员用户名
	password: ''				// 管理员密码
}
```
其他说明：均为必填

### manage/:id
方法：`GET`
用途：获取管理员详情
参数：无

方法：`PUT`
用途：编辑管理员
参数：
```js
{
	username: ''				// 管理员用户名
	old_password: ''			// 管理员老密码
	new_password: ''			// 管理员新密码
	re_password: ''			// 重复新密码
}
```
其他说明：栏目名称为必填

方法：`DELETE`
用途：删除某ID的管理员
参数：无

### site
方法：`GET`
用途：获取网站基础信息
参数：无

方法：`PUT`
用途：编辑网站基础信息
参数：
```js
{
	name: ''				// 网站名称
	title: ''			// 网站标题
	logo: ''				// 网站LOGO
	copyright: ''		// 网站版权
}
```


## 其他

本接口仅供学习之用，才安全以及其他方面并未考虑太多。所以千万不可用于真实建站。
