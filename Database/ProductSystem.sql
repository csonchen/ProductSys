USE [master]
GO
/****** Object:  Database [ProductSystem]    Script Date: 05/09/2014 16:42:55 ******/
CREATE DATABASE [ProductSystem] ON  PRIMARY 
( NAME = N'ProductSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\ProductSystem.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProductSystem_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\ProductSystem_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProductSystem] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductSystem] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ProductSystem] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ProductSystem] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ProductSystem] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ProductSystem] SET ARITHABORT OFF
GO
ALTER DATABASE [ProductSystem] SET AUTO_CLOSE ON
GO
ALTER DATABASE [ProductSystem] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ProductSystem] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ProductSystem] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ProductSystem] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ProductSystem] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ProductSystem] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ProductSystem] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ProductSystem] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ProductSystem] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ProductSystem] SET  DISABLE_BROKER
GO
ALTER DATABASE [ProductSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ProductSystem] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ProductSystem] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ProductSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ProductSystem] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ProductSystem] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ProductSystem] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ProductSystem] SET  READ_WRITE
GO
ALTER DATABASE [ProductSystem] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ProductSystem] SET  MULTI_USER
GO
ALTER DATABASE [ProductSystem] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ProductSystem] SET DB_CHAINING OFF
GO
USE [ProductSystem]
GO
/****** Object:  Table [dbo].[dt_user_groups]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_user_groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[grade] [int] NULL,
	[upgrade_exp] [int] NULL,
	[amount] [decimal](9, 2) NULL,
	[point] [int] NULL,
	[discount] [int] NULL,
	[is_default] [tinyint] NULL,
	[is_upgrade] [tinyint] NULL,
	[is_lock] [tinyint] NULL,
 CONSTRAINT [PK_DT_USER_GROUPS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组别名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员等级值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups', @level2type=N'COLUMN',@level2name=N'grade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'升级经验值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups', @level2type=N'COLUMN',@level2name=N'upgrade_exp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'默认预存款' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups', @level2type=N'COLUMN',@level2name=N'amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'默认积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups', @level2type=N'COLUMN',@level2name=N'point'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购物折扣' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups', @level2type=N'COLUMN',@level2name=N'discount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否注册用户组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups', @level2type=N'COLUMN',@level2name=N'is_default'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否自动升级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups', @level2type=N'COLUMN',@level2name=N'is_upgrade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否禁用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_groups'
GO
/****** Object:  Table [dbo].[dt_user_group_price]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_user_group_price](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[group_id] [int] NULL,
	[price] [decimal](9, 2) NULL,
 CONSTRAINT [PK_DT_USER_GROUP_PRICE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_group_price', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_group_price', @level2type=N'COLUMN',@level2name=N'article_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员组ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_group_price', @level2type=N'COLUMN',@level2name=N'group_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购物价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_group_price', @level2type=N'COLUMN',@level2name=N'price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员组价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_group_price'
GO
/****** Object:  Table [dbo].[dt_user_point_log]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_user_point_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[value] [int] NULL,
	[remark] [nvarchar](500) NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_DT_USER_POINT_LOG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_point_log', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_point_log', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_point_log', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'增减积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_point_log', @level2type=N'COLUMN',@level2name=N'value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_point_log', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_point_log', @level2type=N'COLUMN',@level2name=N'add_time'
GO
/****** Object:  Table [dbo].[dt_user_oauth_app]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_user_oauth_app](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[img_url] [nvarchar](255) NULL,
	[app_id] [nvarchar](100) NULL,
	[app_key] [nvarchar](500) NULL,
	[remark] [nvarchar](500) NULL,
	[sort_id] [int] NULL,
	[is_lock] [tinyint] NULL,
	[api_path] [nvarchar](255) NULL,
 CONSTRAINT [PK_DT_USER_OAUTH_APP] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth_app', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth_app', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示图片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth_app', @level2type=N'COLUMN',@level2name=N'img_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AppId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth_app', @level2type=N'COLUMN',@level2name=N'app_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AppKey' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth_app', @level2type=N'COLUMN',@level2name=N'app_key'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth_app', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序数字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth_app', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth_app', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接口目录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth_app', @level2type=N'COLUMN',@level2name=N'api_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OAuth应用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth_app'
GO
/****** Object:  Table [dbo].[dt_user_oauth]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_user_oauth](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[oauth_name] [nvarchar](50) NOT NULL,
	[oauth_access_token] [nvarchar](500) NULL,
	[oauth_openid] [nvarchar](255) NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_DT_USER_OAUTH] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开放平台名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth', @level2type=N'COLUMN',@level2name=N'oauth_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'access_token' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth', @level2type=N'COLUMN',@level2name=N'oauth_access_token'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授权key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth', @level2type=N'COLUMN',@level2name=N'oauth_openid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授权时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OAuth授权用户信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_oauth'
GO
/****** Object:  Table [dbo].[dt_user_message]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_user_message](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [tinyint] NULL,
	[post_user_name] [nvarchar](100) NULL,
	[accept_user_name] [nvarchar](100) NULL,
	[is_read] [tinyint] NULL,
	[title] [nvarchar](100) NULL,
	[content] [ntext] NULL,
	[post_time] [datetime] NOT NULL,
	[read_time] [datetime] NULL,
 CONSTRAINT [PK_DT_USER_MESSAGE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_message', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短信息类型0系统消息1收件箱2发件箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_message', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发件人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_message', @level2type=N'COLUMN',@level2name=N'post_user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收件人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_message', @level2type=N'COLUMN',@level2name=N'accept_user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否查看0未阅1已阅' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_message', @level2type=N'COLUMN',@level2name=N'is_read'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短信息标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_message', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短信息内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_message', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_message', @level2type=N'COLUMN',@level2name=N'post_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'阅读时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_message', @level2type=N'COLUMN',@level2name=N'read_time'
GO
/****** Object:  Table [dbo].[dt_navigation]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_navigation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nav_type] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[title] [nvarchar](100) NULL,
	[sub_title] [nvarchar](100) NULL,
	[link_url] [nvarchar](255) NULL,
	[sort_id] [int] NULL,
	[is_lock] [tinyint] NULL,
	[remark] [nvarchar](500) NULL,
	[parent_id] [int] NULL,
	[class_list] [nvarchar](500) NULL,
	[class_layer] [int] NULL,
	[channel_id] [int] NULL,
	[action_type] [nvarchar](500) NULL,
	[is_sys] [tinyint] NULL,
 CONSTRAINT [PK_DT_NAVIGATION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'nav_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'副标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'sub_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'link_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序数字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否隐藏0显示1隐藏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属父导航ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'parent_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单ID列表(逗号分隔开)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'class_list'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航深度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'class_layer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属频道ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限资源' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'action_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统默认' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation', @level2type=N'COLUMN',@level2name=N'is_sys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统导航菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_navigation'
GO
/****** Object:  Table [dbo].[dt_mail_template]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_mail_template](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[call_index] [nvarchar](50) NULL,
	[maill_title] [nvarchar](100) NULL,
	[content] [ntext] NULL,
	[is_sys] [tinyint] NULL,
 CONSTRAINT [PK_DT_MAIL_TEMPLATE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_mail_template', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_mail_template', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调用别名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_mail_template', @level2type=N'COLUMN',@level2name=N'call_index'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_mail_template', @level2type=N'COLUMN',@level2name=N'maill_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_mail_template', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统默认' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_mail_template', @level2type=N'COLUMN',@level2name=N'is_sys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_mail_template'
GO
/****** Object:  Table [dbo].[dt_link]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_link](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NULL,
	[user_name] [nvarchar](50) NULL,
	[user_tel] [nvarchar](20) NULL,
	[email] [nvarchar](50) NULL,
	[site_url] [nvarchar](255) NULL,
	[img_url] [nvarchar](255) NULL,
	[is_image] [int] NOT NULL,
	[sort_id] [int] NOT NULL,
	[is_red] [tinyint] NOT NULL,
	[is_lock] [tinyint] NOT NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK__dt_link__34E8D562] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dt_feedback]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_feedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[content] [ntext] NULL,
	[user_name] [nvarchar](50) NULL,
	[user_tel] [nvarchar](30) NULL,
	[user_qq] [nvarchar](30) NULL,
	[user_email] [nvarchar](100) NULL,
	[add_time] [datetime] NOT NULL,
	[reply_content] [ntext] NULL,
	[reply_time] [datetime] NULL,
	[is_lock] [tinyint] NOT NULL,
 CONSTRAINT [PK__dt_feedback__3F6663D5] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dt_express]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_express](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[express_code] [nvarchar](100) NULL,
	[express_fee] [decimal](9, 2) NULL,
	[website] [nvarchar](255) NULL,
	[remark] [ntext] NULL,
	[sort_id] [int] NULL,
	[is_lock] [tinyint] NULL,
 CONSTRAINT [PK_DT_EXPRESS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_express', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'快递名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_express', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物流编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_express', @level2type=N'COLUMN',@level2name=N'express_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配送费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_express', @level2type=N'COLUMN',@level2name=N'express_fee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'快递网址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_express', @level2type=N'COLUMN',@level2name=N'website'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_express', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_express', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否不显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_express', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物流快递' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_express'
GO
/****** Object:  Table [dbo].[dt_channel_category]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_channel_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[build_path] [nvarchar](100) NULL,
	[templet_path] [nvarchar](100) NULL,
	[domain] [nvarchar](255) NULL,
	[is_default] [tinyint] NULL,
	[sort_id] [int] NULL,
 CONSTRAINT [PK_DT_CHANNEL_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_category', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_category', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成文件夹名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_category', @level2type=N'COLUMN',@level2name=N'build_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板文件夹名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_category', @level2type=N'COLUMN',@level2name=N'templet_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'绑定域名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_category', @level2type=N'COLUMN',@level2name=N'domain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否默认' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_category', @level2type=N'COLUMN',@level2name=N'is_default'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序数字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_category', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道分类表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_category'
GO
/****** Object:  Table [dbo].[dt_manager_role]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_manager_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](100) NULL,
	[role_type] [tinyint] NULL,
	[is_sys] [tinyint] NULL,
 CONSTRAINT [PK_DT_MANAGER_ROLE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role', @level2type=N'COLUMN',@level2name=N'role_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role', @level2type=N'COLUMN',@level2name=N'role_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否系统默认0否1是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role', @level2type=N'COLUMN',@level2name=N'is_sys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理角色表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role'
GO
/****** Object:  Table [dbo].[dt_manager_log]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_manager_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[action_type] [nvarchar](100) NULL,
	[remark] [nvarchar](255) NULL,
	[user_ip] [nvarchar](30) NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_DT_MANAGER_LOG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'action_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'user_ip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理日志表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_log'
GO
/****** Object:  Table [dbo].[dt_user_amount_log]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_user_amount_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[type] [nvarchar](50) NULL,
	[order_no] [nvarchar](100) NULL,
	[trade_no] [nvarchar](100) NULL,
	[payment_id] [int] NULL,
	[value] [decimal](9, 2) NULL,
	[remark] [nvarchar](500) NULL,
	[status] [tinyint] NULL,
	[add_time] [datetime] NULL,
	[complete_time] [datetime] NULL,
 CONSTRAINT [PK_DT_USER_AMOUNT_LOG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_amount_log', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_amount_log', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_amount_log', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_amount_log', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_amount_log', @level2type=N'COLUMN',@level2name=N'order_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易号但保支付用到' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_amount_log', @level2type=N'COLUMN',@level2name=N'trade_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_amount_log', @level2type=N'COLUMN',@level2name=N'payment_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'增减值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_amount_log', @level2type=N'COLUMN',@level2name=N'value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_amount_log', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_amount_log', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_amount_log', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完成时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_amount_log', @level2type=N'COLUMN',@level2name=N'complete_time'
GO
/****** Object:  Table [dbo].[dt_sms_template]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_sms_template](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[call_index] [nvarchar](50) NULL,
	[content] [ntext] NULL,
	[is_sys] [tinyint] NULL,
 CONSTRAINT [PK_DT_SMS_TEMPLATE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sms_template', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sms_template', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调用别名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sms_template', @level2type=N'COLUMN',@level2name=N'call_index'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短信内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sms_template', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统默认' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sms_template', @level2type=N'COLUMN',@level2name=N'is_sys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机短信模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_sms_template'
GO
/****** Object:  Table [dbo].[dt_payment]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[img_url] [nvarchar](255) NULL,
	[remark] [nvarchar](500) NULL,
	[type] [tinyint] NULL,
	[poundage_type] [tinyint] NULL,
	[poundage_amount] [decimal](9, 2) NULL,
	[sort_id] [int] NULL,
	[is_lock] [tinyint] NULL,
	[api_path] [nvarchar](100) NULL,
 CONSTRAINT [PK_DT_PAYMENT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示图片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment', @level2type=N'COLUMN',@level2name=N'img_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付类型1线上2线下' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手续费类型1百分比2固定金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment', @level2type=N'COLUMN',@level2name=N'poundage_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手续费金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment', @level2type=N'COLUMN',@level2name=N'poundage_amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'API目录名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment', @level2type=N'COLUMN',@level2name=N'api_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_payment'
GO
/****** Object:  Table [dbo].[dt_orders]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_no] [nvarchar](100) NULL,
	[trade_no] [nvarchar](100) NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[payment_id] [int] NULL,
	[payment_fee] [decimal](9, 2) NULL,
	[payment_status] [tinyint] NULL,
	[payment_time] [datetime] NULL,
	[express_id] [int] NULL,
	[express_no] [nvarchar](100) NULL,
	[express_fee] [decimal](9, 2) NULL,
	[express_status] [tinyint] NULL,
	[express_time] [datetime] NULL,
	[accept_name] [nvarchar](50) NULL,
	[post_code] [nvarchar](20) NULL,
	[telphone] [nvarchar](30) NULL,
	[mobile] [nvarchar](20) NULL,
	[area] [nvarchar](100) NULL,
	[address] [nvarchar](500) NULL,
	[message] [nvarchar](500) NULL,
	[remark] [nvarchar](500) NULL,
	[payable_amount] [decimal](9, 2) NULL,
	[real_amount] [decimal](9, 2) NULL,
	[order_amount] [decimal](9, 2) NULL,
	[point] [int] NULL,
	[status] [tinyint] NULL,
	[add_time] [datetime] NULL,
	[confirm_time] [datetime] NULL,
	[complete_time] [datetime] NULL,
 CONSTRAINT [PK_DT_ORDERS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'order_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易号担保支付用到' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'trade_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'payment_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付手续费' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'payment_fee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付状态1未支付2已支付' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'payment_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'payment_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'快递ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'express_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'快递单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'express_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物流费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'express_fee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发货状态1未发货2已发货' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'express_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发货时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'express_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收货人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'accept_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮政编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'post_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'telphone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属省市区' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收货地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单留言' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应付商品总金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'payable_amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实付商品总金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'real_amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单总金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'order_amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分,正数赠送|负数消费' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'point'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单状态1生成订单,2确认订单,3完成订单,4取消订单,5作废订单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下单时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'确认时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'confirm_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单完成时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders', @level2type=N'COLUMN',@level2name=N'complete_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_orders'
GO
/****** Object:  Table [dbo].[dt_article_attribute_field]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_article_attribute_field](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[title] [nvarchar](100) NULL,
	[control_type] [nvarchar](50) NULL,
	[data_type] [nvarchar](50) NULL,
	[data_length] [int] NULL,
	[data_place] [tinyint] NULL,
	[item_option] [ntext] NULL,
	[default_value] [ntext] NULL,
	[is_required] [tinyint] NULL,
	[is_password] [tinyint] NULL,
	[is_html] [tinyint] NULL,
	[editor_type] [tinyint] NULL,
	[valid_tip_msg] [nvarchar](255) NULL,
	[valid_error_msg] [nvarchar](255) NULL,
	[valid_pattern] [nvarchar](500) NULL,
	[sort_id] [int] NULL,
	[is_sys] [tinyint] NULL,
	[is_classify] [tinyint] NULL,
 CONSTRAINT [PK_DT_ARTICLE_ATTRIBUTE_FIELD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'列名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控件类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'control_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字段类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'data_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字段长度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'data_length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小数点位数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'data_place'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'选项列表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'item_option'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'默认值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'default_value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否必填0非必填1必填' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'is_required'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否密码框' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'is_password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否允许HTML' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'is_html'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编辑器类型0标准型1简洁型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'editor_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证提示信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'valid_tip_msg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证失败提示信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'valid_error_msg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证正则表达式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'valid_pattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序数字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统默认' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field', @level2type=N'COLUMN',@level2name=N'is_sys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扩展属性表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_field'
GO
/****** Object:  Table [dbo].[dt_article_attach]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_article_attach](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[file_name] [nvarchar](100) NULL,
	[file_path] [nvarchar](255) NULL,
	[file_size] [int] NULL,
	[file_ext] [nvarchar](20) NULL,
	[down_num] [int] NULL,
	[point] [int] NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_DT_ARTICLE_ATTACH] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attach', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attach', @level2type=N'COLUMN',@level2name=N'article_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attach', @level2type=N'COLUMN',@level2name=N'file_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attach', @level2type=N'COLUMN',@level2name=N'file_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件大小(字节)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attach', @level2type=N'COLUMN',@level2name=N'file_size'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件扩展名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attach', @level2type=N'COLUMN',@level2name=N'file_ext'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下载次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attach', @level2type=N'COLUMN',@level2name=N'down_num'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分(正赠送负消费)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attach', @level2type=N'COLUMN',@level2name=N'point'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上传时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attach', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attach'
GO
/****** Object:  Table [dbo].[dt_article_albums]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_article_albums](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[thumb_path] [nvarchar](255) NULL,
	[original_path] [nvarchar](255) NULL,
	[remark] [nvarchar](500) NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_DT_ARTICLE_ALBUMS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_albums', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_albums', @level2type=N'COLUMN',@level2name=N'article_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'缩略图地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_albums', @level2type=N'COLUMN',@level2name=N'thumb_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原图地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_albums', @level2type=N'COLUMN',@level2name=N'original_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_albums', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上传时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_albums', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片相册' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_albums'
GO
/****** Object:  Table [dbo].[dt_article]    Script Date: 05/09/2014 16:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_article](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[call_index] [nvarchar](50) NULL,
	[title] [nvarchar](100) NULL,
	[link_url] [nvarchar](255) NULL,
	[img_url] [nvarchar](255) NULL,
	[seo_title] [nvarchar](255) NULL,
	[seo_keywords] [nvarchar](255) NULL,
	[seo_description] [nvarchar](255) NULL,
	[zhaiyao] [nvarchar](255) NULL,
	[content] [ntext] NULL,
	[sort_id] [int] NULL,
	[click] [int] NULL,
	[status] [tinyint] NULL,
	[groupids_view] [nvarchar](255) NULL,
	[vote_id] [int] NULL,
	[is_msg] [tinyint] NULL,
	[is_top] [tinyint] NULL,
	[is_red] [tinyint] NULL,
	[is_hot] [tinyint] NULL,
	[is_slide] [tinyint] NULL,
	[is_sys] [tinyint] NULL,
	[user_name] [nvarchar](100) NULL,
	[add_time] [datetime] NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_DT_ARTICLE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'category_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调用别名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'call_index'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外部链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'link_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'img_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'seo_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO关健字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'seo_keywords'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'seo_description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容摘要' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'zhaiyao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详细内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'click'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态0正常1未审核2锁定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'阅读权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'groupids_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联投票ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'vote_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否允许评论' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'is_msg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否置顶' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'is_top'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'is_red'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否热门' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'is_hot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否幻灯片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'is_slide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否管理员发布0不是1是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'is_sys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article', @level2type=N'COLUMN',@level2name=N'update_time'
GO
/****** Object:  Table [dbo].[dt_article_comment]    Script Date: 05/09/2014 16:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_article_comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NULL,
	[article_id] [int] NULL,
	[parent_id] [int] NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[user_ip] [nvarchar](255) NULL,
	[content] [ntext] NULL,
	[is_lock] [tinyint] NULL,
	[add_time] [datetime] NULL,
	[is_reply] [tinyint] NULL,
	[reply_content] [ntext] NULL,
	[reply_time] [datetime] NULL,
 CONSTRAINT [PK_DT_ARTICLE_COMMENT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'article_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父评论ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'parent_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'user_ip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评论内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否锁定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发表时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否已答复' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'is_reply'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答复内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'reply_content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_comment', @level2type=N'COLUMN',@level2name=N'reply_time'
GO
/****** Object:  Table [dbo].[dt_article_category]    Script Date: 05/09/2014 16:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_article_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NOT NULL,
	[title] [nvarchar](100) NULL,
	[call_index] [nvarchar](50) NULL,
	[parent_id] [int] NULL,
	[class_list] [nvarchar](500) NULL,
	[class_layer] [int] NULL,
	[sort_id] [int] NULL,
	[link_url] [nvarchar](255) NULL,
	[img_url] [nvarchar](255) NULL,
	[content] [ntext] NULL,
	[seo_title] [nvarchar](255) NULL,
	[seo_keywords] [nvarchar](255) NULL,
	[seo_description] [nvarchar](255) NULL,
 CONSTRAINT [PK_DT_ARTICLE_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调用别名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'call_index'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父类别ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'parent_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别ID列表(逗号分隔开)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'class_list'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别深度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'class_layer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序数字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'URL跳转地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'link_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'img_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'seo_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO关健字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'seo_keywords'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_category', @level2type=N'COLUMN',@level2name=N'seo_description'
GO
/****** Object:  Table [dbo].[dt_article_attribute_value]    Script Date: 05/09/2014 16:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_article_attribute_value](
	[article_id] [int] NOT NULL,
	[product_no] [nvarchar](50) NULL,
	[platform] [nvarchar](100) NULL,
	[product_status] [nvarchar](50) NULL,
	[technology_info] [ntext] NULL,
	[logo] [nvarchar](50) NULL,
	[suitable_classify] [nvarchar](100) NULL,
	[suitable] [nvarchar](400) NULL,
	[unsuitable] [nvarchar](500) NULL,
	[material] [nvarchar](400) NULL,
	[functional_composition] [nvarchar](400) NULL,
	[storage_method] [nvarchar](150) NULL,
	[notes] [nvarchar](400) NULL,
	[specification] [nvarchar](100) NULL,
	[edible_method] [nvarchar](500) NULL,
	[approval_number] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[health_function] [nvarchar](400) NULL,
	[health_food_type] [nvarchar](200) NULL,
	[shelf_life] [nvarchar](100) NULL,
	[material_classify] [nvarchar](100) NULL,
	[remark] [nvarchar](200) NULL,
	[product_effect] [nvarchar](100) NULL,
	[executive_standnum] [nvarchar](100) NULL,
	[food_drink] [nvarchar](50) NULL,
	[change_content] [nvarchar](100) NULL,
	[record_content] [nvarchar](100) NULL,
	[use_method] [nvarchar](100) NULL,
	[main_features] [nvarchar](100) NULL,
	[contraindications] [nvarchar](100) NULL,
	[application] [nvarchar](100) NULL,
	[main_structure] [nvarchar](100) NULL,
	[approval_content] [nvarchar](100) NULL,
	[modify_person] [nvarchar](100) NULL,
	[document_keys] [nvarchar](100) NULL,
 CONSTRAINT [PK_dt_article_attribute_value] PRIMARY KEY CLUSTERED 
(
	[article_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_value', @level2type=N'COLUMN',@level2name=N'article_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扩展属性表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_article_attribute_value'
GO
/****** Object:  Table [dbo].[dt_order_goods]    Script Date: 05/09/2014 16:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_order_goods](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[goods_id] [int] NULL,
	[goods_title] [nvarchar](100) NULL,
	[goods_price] [decimal](9, 2) NULL,
	[real_price] [decimal](9, 2) NULL,
	[quantity] [int] NULL,
	[point] [int] NULL,
 CONSTRAINT [PK_DT_ORDER_GOODS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods', @level2type=N'COLUMN',@level2name=N'order_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods', @level2type=N'COLUMN',@level2name=N'goods_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods', @level2type=N'COLUMN',@level2name=N'goods_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods', @level2type=N'COLUMN',@level2name=N'goods_price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实际价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods', @level2type=N'COLUMN',@level2name=N'real_price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订购数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods', @level2type=N'COLUMN',@level2name=N'quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分,正数赠送|负数消费' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods', @level2type=N'COLUMN',@level2name=N'point'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单商品表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_order_goods'
GO
/****** Object:  Table [dbo].[dt_manager]    Script Date: 05/09/2014 16:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_manager](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NOT NULL,
	[role_type] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[salt] [nvarchar](20) NULL,
	[real_name] [nvarchar](50) NULL,
	[telephone] [nvarchar](30) NULL,
	[email] [nvarchar](30) NULL,
	[is_lock] [int] NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_DT_MANAGER] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'role_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员类型1超管2系管' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'role_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'6位随机字符串,加密用到' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'salt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'real_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'telephone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否锁定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager'
GO
/****** Object:  Table [dbo].[dt_channel]    Script Date: 05/09/2014 16:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dt_channel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[name] [varchar](50) NULL,
	[title] [varchar](100) NULL,
	[is_albums] [tinyint] NULL,
	[is_attach] [tinyint] NULL,
	[is_group_price] [tinyint] NULL,
	[page_size] [int] NULL,
	[sort_id] [int] NULL,
 CONSTRAINT [PK_DT_CHANNEL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel', @level2type=N'COLUMN',@level2name=N'category_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否开启相册功能' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel', @level2type=N'COLUMN',@level2name=N'is_albums'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否开启附件功能' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel', @level2type=N'COLUMN',@level2name=N'is_attach'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否开启会员组价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel', @level2type=N'COLUMN',@level2name=N'is_group_price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每页显示数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel', @level2type=N'COLUMN',@level2name=N'page_size'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序数字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统频道表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel'
GO
/****** Object:  Table [dbo].[dt_users]    Script Date: 05/09/2014 16:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[user_name] [nvarchar](100) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[salt] [nvarchar](20) NULL,
	[email] [nvarchar](50) NULL,
	[nick_name] [nvarchar](100) NULL,
	[avatar] [nvarchar](255) NULL,
	[sex] [nvarchar](20) NULL,
	[birthday] [datetime] NULL,
	[telphone] [nvarchar](50) NULL,
	[mobile] [nvarchar](20) NULL,
	[qq] [nvarchar](30) NULL,
	[address] [nvarchar](255) NULL,
	[safe_question] [nvarchar](255) NULL,
	[safe_answer] [nvarchar](255) NULL,
	[amount] [decimal](9, 2) NULL,
	[point] [int] NULL,
	[exp] [int] NULL,
	[status] [tinyint] NULL,
	[reg_time] [datetime] NULL,
	[reg_ip] [nvarchar](30) NULL,
 CONSTRAINT [PK_DT_USERS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'group_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'6位随机字符串,加密用到' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'salt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'nick_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'avatar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'telphone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QQ号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'qq'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全问题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'safe_question'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'问题答案' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'safe_answer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'预存款' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'point'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经验值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'exp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户状态,0正常,1待验证,2待审核,3锁定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'reg_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_users', @level2type=N'COLUMN',@level2name=N'reg_ip'
GO
/****** Object:  Table [dbo].[dt_manager_role_value]    Script Date: 05/09/2014 16:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_manager_role_value](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NULL,
	[nav_name] [nvarchar](100) NULL,
	[action_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_DT_MANAGER_ROLE_VALUE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role_value', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role_value', @level2type=N'COLUMN',@level2name=N'role_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role_value', @level2type=N'COLUMN',@level2name=N'nav_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role_value', @level2type=N'COLUMN',@level2name=N'action_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理角色权限表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_manager_role_value'
GO
/****** Object:  View [dbo].[view_channel_waterAndProduct]    Script Date: 05/09/2014 16:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_waterAndProduct] as SELECT dt_article.*,dt_article_attribute_value.product_no,dt_article_attribute_value.product_status,dt_article_attribute_value.platform,dt_article_attribute_value.main_structure,dt_article_attribute_value.application,dt_article_attribute_value.main_features,dt_article_attribute_value.technology_info FROM dt_article_attribute_value INNER JOIN dt_article ON dt_article_attribute_value.article_id = dt_article.id WHERE dt_article.channel_id=12
GO
/****** Object:  View [dbo].[view_channel_productLaw]    Script Date: 05/09/2014 16:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_productLaw] as SELECT dt_article.*,dt_article_attribute_value.document_keys,dt_article_attribute_value.modify_person FROM dt_article_attribute_value INNER JOIN dt_article ON dt_article_attribute_value.article_id = dt_article.id WHERE dt_article.channel_id=13
GO
/****** Object:  View [dbo].[view_channel_household_article]    Script Date: 05/09/2014 16:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_household_article] as SELECT dt_article.*,dt_article_attribute_value.product_no,dt_article_attribute_value.product_status,dt_article_attribute_value.platform,dt_article_attribute_value.approval_number,dt_article_attribute_value.notes,dt_article_attribute_value.application,dt_article_attribute_value.contraindications,dt_article_attribute_value.main_features,dt_article_attribute_value.use_method,dt_article_attribute_value.executive_standnum FROM dt_article_attribute_value INNER JOIN dt_article ON dt_article_attribute_value.article_id = dt_article.id WHERE dt_article.channel_id=11
GO
/****** Object:  View [dbo].[view_channel_health_food]    Script Date: 05/09/2014 16:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_health_food] as SELECT dt_article.*,dt_article_attribute_value.logo,dt_article_attribute_value.product_no,dt_article_attribute_value.product_status,dt_article_attribute_value.platform,dt_article_attribute_value.health_food_type,dt_article_attribute_value.health_function,dt_article_attribute_value.approval_number,dt_article_attribute_value.suitable_classify,dt_article_attribute_value.suitable,dt_article_attribute_value.unsuitable,dt_article_attribute_value.shelf_life,dt_article_attribute_value.material,dt_article_attribute_value.functional_composition,dt_article_attribute_value.specification,dt_article_attribute_value.address,dt_article_attribute_value.edible_method,dt_article_attribute_value.storage_method,dt_article_attribute_value.notes,dt_article_attribute_value.remark,dt_article_attribute_value.approval_content,dt_article_attribute_value.record_content,dt_article_attribute_value.technology_info,dt_article_attribute_value.material_classify FROM dt_article_attribute_value INNER JOIN dt_article ON dt_article_attribute_value.article_id = dt_article.id WHERE dt_article.channel_id=7
GO
/****** Object:  View [dbo].[view_channel_food]    Script Date: 05/09/2014 16:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_food] as SELECT dt_article.*,dt_article_attribute_value.logo,dt_article_attribute_value.product_no,dt_article_attribute_value.product_status,dt_article_attribute_value.platform,dt_article_attribute_value.suitable,dt_article_attribute_value.unsuitable,dt_article_attribute_value.shelf_life,dt_article_attribute_value.material,dt_article_attribute_value.functional_composition,dt_article_attribute_value.specification,dt_article_attribute_value.edible_method,dt_article_attribute_value.storage_method,dt_article_attribute_value.food_drink,dt_article_attribute_value.executive_standnum,dt_article_attribute_value.product_effect,dt_article_attribute_value.technology_info FROM dt_article_attribute_value INNER JOIN dt_article ON dt_article_attribute_value.article_id = dt_article.id WHERE dt_article.channel_id=8
GO
/****** Object:  View [dbo].[view_channel_drug]    Script Date: 05/09/2014 16:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_drug] as SELECT dt_article.*,dt_article_attribute_value.logo,dt_article_attribute_value.product_no,dt_article_attribute_value.product_status,dt_article_attribute_value.platform,dt_article_attribute_value.health_food_type,dt_article_attribute_value.approval_number,dt_article_attribute_value.specification,dt_article_attribute_value.remark,dt_article_attribute_value.record_content,dt_article_attribute_value.change_content,dt_article_attribute_value.technology_info FROM dt_article_attribute_value INNER JOIN dt_article ON dt_article_attribute_value.article_id = dt_article.id WHERE dt_article.channel_id=9
GO
/****** Object:  View [dbo].[view_channel_daily_necessity]    Script Date: 05/09/2014 16:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_daily_necessity] as SELECT dt_article.*,dt_article_attribute_value.logo,dt_article_attribute_value.product_no,dt_article_attribute_value.product_status,dt_article_attribute_value.platform,dt_article_attribute_value.approval_number,dt_article_attribute_value.suitable,dt_article_attribute_value.unsuitable,dt_article_attribute_value.material,dt_article_attribute_value.specification,dt_article_attribute_value.remark,dt_article_attribute_value.use_method,dt_article_attribute_value.record_content,dt_article_attribute_value.change_content,dt_article_attribute_value.product_effect,dt_article_attribute_value.technology_info FROM dt_article_attribute_value INNER JOIN dt_article ON dt_article_attribute_value.article_id = dt_article.id WHERE dt_article.channel_id=10
GO
/****** Object:  View [dbo].[view_channel_content]    Script Date: 05/09/2014 16:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_content]
AS
SELECT     dbo.dt_article.id, dbo.dt_article.channel_id, dbo.dt_article.category_id, dbo.dt_article.call_index, dbo.dt_article.title, dbo.dt_article.link_url, dbo.dt_article.img_url, 
                      dbo.dt_article.seo_title, dbo.dt_article.seo_keywords, dbo.dt_article.seo_description, dbo.dt_article.zhaiyao, dbo.dt_article.[content], dbo.dt_article.sort_id, 
                      dbo.dt_article.click, dbo.dt_article.status, dbo.dt_article.groupids_view, dbo.dt_article.vote_id, dbo.dt_article.is_msg, dbo.dt_article.is_top, dbo.dt_article.is_red, 
                      dbo.dt_article.is_hot, dbo.dt_article.is_slide, dbo.dt_article.is_sys, dbo.dt_article.user_name, dbo.dt_article.add_time, dbo.dt_article.update_time
FROM         dbo.dt_article_attribute_value INNER JOIN
                      dbo.dt_article ON dbo.dt_article_attribute_value.article_id = dbo.dt_article.id
WHERE     (dbo.dt_article.channel_id = 5)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -768
         Left = 0
      End
      Begin Tables = 
         Begin Table = "dt_article_attribute_value"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 80
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dt_article"
            Begin Extent = 
               Top = 6
               Left = 218
               Bottom = 125
               Right = 382
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_channel_content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_channel_content'
GO
/****** Object:  Table [dbo].[dt_user_login_log]    Script Date: 05/09/2014 16:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_user_login_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[user_name] [nvarchar](100) NULL,
	[remark] [nvarchar](255) NULL,
	[login_time] [datetime] NULL,
	[login_ip] [nvarchar](50) NULL,
 CONSTRAINT [PK_DT_USER_LOGIN_LOG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_login_log', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_login_log', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_login_log', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_login_log', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_login_log', @level2type=N'COLUMN',@level2name=N'login_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_login_log', @level2type=N'COLUMN',@level2name=N'login_ip'
GO
/****** Object:  Table [dbo].[dt_user_code]    Script Date: 05/09/2014 16:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_user_code](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[user_name] [nvarchar](100) NULL,
	[type] [nvarchar](20) NULL,
	[str_code] [nvarchar](255) NULL,
	[count] [int] NULL,
	[status] [tinyint] NULL,
	[eff_time] [datetime] NOT NULL,
	[add_time] [datetime] NOT NULL,
 CONSTRAINT [PK_DT_USER_CODE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_code', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_code', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_code', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成码类别 password取回密码,register邀请注册' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_code', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成的字符串' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_code', @level2type=N'COLUMN',@level2name=N'str_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_code', @level2type=N'COLUMN',@level2name=N'count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态0未使用1已使用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_code', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_code', @level2type=N'COLUMN',@level2name=N'eff_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_user_code', @level2type=N'COLUMN',@level2name=N'add_time'
GO
/****** Object:  Table [dbo].[dt_channel_field]    Script Date: 05/09/2014 16:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dt_channel_field](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NOT NULL,
	[field_id] [int] NOT NULL,
 CONSTRAINT [PK_DT_CHANNEL_FIELD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_field', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_field', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字段ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_field', @level2type=N'COLUMN',@level2name=N'field_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道属性表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dt_channel_field'
GO
/****** Object:  Default [DF__dt_user_g__title__53A266AC]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_groups] ADD  CONSTRAINT [DF__dt_user_g__title__53A266AC]  DEFAULT ('') FOR [title]
GO
/****** Object:  Default [DF__dt_user_g__grade__54968AE5]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_groups] ADD  CONSTRAINT [DF__dt_user_g__grade__54968AE5]  DEFAULT ((0)) FOR [grade]
GO
/****** Object:  Default [DF__dt_user_g__upgra__558AAF1E]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_groups] ADD  CONSTRAINT [DF__dt_user_g__upgra__558AAF1E]  DEFAULT ((0)) FOR [upgrade_exp]
GO
/****** Object:  Default [DF__dt_user_g__amoun__567ED357]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_groups] ADD  CONSTRAINT [DF__dt_user_g__amoun__567ED357]  DEFAULT ((0)) FOR [amount]
GO
/****** Object:  Default [DF__dt_user_g__point__5772F790]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_groups] ADD  CONSTRAINT [DF__dt_user_g__point__5772F790]  DEFAULT ((0)) FOR [point]
GO
/****** Object:  Default [DF__dt_user_g__is_de__58671BC9]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_groups] ADD  CONSTRAINT [DF__dt_user_g__is_de__58671BC9]  DEFAULT ((0)) FOR [is_default]
GO
/****** Object:  Default [DF__dt_user_g__is_up__595B4002]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_groups] ADD  CONSTRAINT [DF__dt_user_g__is_up__595B4002]  DEFAULT ((1)) FOR [is_upgrade]
GO
/****** Object:  Default [DF__dt_user_g__is_lo__5A4F643B]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_groups] ADD  CONSTRAINT [DF__dt_user_g__is_lo__5A4F643B]  DEFAULT ((0)) FOR [is_lock]
GO
/****** Object:  Default [DF__dt_user_g__artic__4EDDB18F]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_group_price] ADD  CONSTRAINT [DF__dt_user_g__artic__4EDDB18F]  DEFAULT ((0)) FOR [article_id]
GO
/****** Object:  Default [DF__dt_user_g__group__4FD1D5C8]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_group_price] ADD  CONSTRAINT [DF__dt_user_g__group__4FD1D5C8]  DEFAULT ((0)) FOR [group_id]
GO
/****** Object:  Default [DF__dt_user_g__price__50C5FA01]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_group_price] ADD  CONSTRAINT [DF__dt_user_g__price__50C5FA01]  DEFAULT ((0)) FOR [price]
GO
/****** Object:  Default [DF__dt_user_p__add_t__731B1205]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_point_log] ADD  CONSTRAINT [DF__dt_user_p__add_t__731B1205]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__dt_user_o__title__6B79F03D]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_oauth_app] ADD  CONSTRAINT [DF__dt_user_o__title__6B79F03D]  DEFAULT ('') FOR [title]
GO
/****** Object:  Default [DF__dt_user_o__img_u__6C6E1476]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_oauth_app] ADD  CONSTRAINT [DF__dt_user_o__img_u__6C6E1476]  DEFAULT ('') FOR [img_url]
GO
/****** Object:  Default [DF__dt_user_o__remar__6D6238AF]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_oauth_app] ADD  CONSTRAINT [DF__dt_user_o__remar__6D6238AF]  DEFAULT ('') FOR [remark]
GO
/****** Object:  Default [DF__dt_user_o__sort___6E565CE8]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_oauth_app] ADD  CONSTRAINT [DF__dt_user_o__sort___6E565CE8]  DEFAULT ((99)) FOR [sort_id]
GO
/****** Object:  Default [DF__dt_user_o__is_lo__6F4A8121]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_oauth_app] ADD  CONSTRAINT [DF__dt_user_o__is_lo__6F4A8121]  DEFAULT ((0)) FOR [is_lock]
GO
/****** Object:  Default [DF__dt_user_o__api_p__703EA55A]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_oauth_app] ADD  CONSTRAINT [DF__dt_user_o__api_p__703EA55A]  DEFAULT ('') FOR [api_path]
GO
/****** Object:  Default [DF__dt_user_o__oauth__67A95F59]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_oauth] ADD  CONSTRAINT [DF__dt_user_o__oauth__67A95F59]  DEFAULT ('0') FOR [oauth_name]
GO
/****** Object:  Default [DF__dt_user_o__add_t__689D8392]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_oauth] ADD  CONSTRAINT [DF__dt_user_o__add_t__689D8392]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__dt_user_me__type__62E4AA3C]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_message] ADD  CONSTRAINT [DF__dt_user_me__type__62E4AA3C]  DEFAULT ((1)) FOR [type]
GO
/****** Object:  Default [DF__dt_user_m__is_re__63D8CE75]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_message] ADD  CONSTRAINT [DF__dt_user_m__is_re__63D8CE75]  DEFAULT ((0)) FOR [is_read]
GO
/****** Object:  Default [DF__dt_user_m__post___64CCF2AE]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_message] ADD  CONSTRAINT [DF__dt_user_m__post___64CCF2AE]  DEFAULT (getdate()) FOR [post_time]
GO
/****** Object:  Default [DF__dt_naviga__nav_t__0FB750B3]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_navigation] ADD  CONSTRAINT [DF__dt_naviga__nav_t__0FB750B3]  DEFAULT ('') FOR [nav_type]
GO
/****** Object:  Default [DF__dt_navigat__name__10AB74EC]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_navigation] ADD  CONSTRAINT [DF__dt_navigat__name__10AB74EC]  DEFAULT ('') FOR [name]
GO
/****** Object:  Default [DF__dt_naviga__title__119F9925]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_navigation] ADD  CONSTRAINT [DF__dt_naviga__title__119F9925]  DEFAULT ('') FOR [title]
GO
/****** Object:  Default [DF__dt_naviga__sub_t__1293BD5E]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_navigation] ADD  CONSTRAINT [DF__dt_naviga__sub_t__1293BD5E]  DEFAULT ('') FOR [sub_title]
GO
/****** Object:  Default [DF__dt_naviga__link___1387E197]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_navigation] ADD  CONSTRAINT [DF__dt_naviga__link___1387E197]  DEFAULT ('') FOR [link_url]
GO
/****** Object:  Default [DF__dt_naviga__sort___147C05D0]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_navigation] ADD  CONSTRAINT [DF__dt_naviga__sort___147C05D0]  DEFAULT ((99)) FOR [sort_id]
GO
/****** Object:  Default [DF__dt_naviga__is_lo__15702A09]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_navigation] ADD  CONSTRAINT [DF__dt_naviga__is_lo__15702A09]  DEFAULT ((0)) FOR [is_lock]
GO
/****** Object:  Default [DF__dt_naviga__remar__16644E42]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_navigation] ADD  CONSTRAINT [DF__dt_naviga__remar__16644E42]  DEFAULT ('') FOR [remark]
GO
/****** Object:  Default [DF__dt_naviga__paren__1758727B]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_navigation] ADD  CONSTRAINT [DF__dt_naviga__paren__1758727B]  DEFAULT ((0)) FOR [parent_id]
GO
/****** Object:  Default [DF__dt_naviga__class__184C96B4]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_navigation] ADD  CONSTRAINT [DF__dt_naviga__class__184C96B4]  DEFAULT ('') FOR [class_list]
GO
/****** Object:  Default [DF__dt_naviga__class__1940BAED]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_navigation] ADD  CONSTRAINT [DF__dt_naviga__class__1940BAED]  DEFAULT ((1)) FOR [class_layer]
GO
/****** Object:  Default [DF__dt_naviga__chann__1A34DF26]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_navigation] ADD  CONSTRAINT [DF__dt_naviga__chann__1A34DF26]  DEFAULT ((0)) FOR [channel_id]
GO
/****** Object:  Default [DF__dt_naviga__actio__1B29035F]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_navigation] ADD  CONSTRAINT [DF__dt_naviga__actio__1B29035F]  DEFAULT ('') FOR [action_type]
GO
/****** Object:  Default [DF__dt_naviga__is_sy__1C1D2798]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_navigation] ADD  CONSTRAINT [DF__dt_naviga__is_sy__1C1D2798]  DEFAULT ((0)) FOR [is_sys]
GO
/****** Object:  Default [DF__dt_mail_t__is_sy__74444068]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_mail_template] ADD  CONSTRAINT [DF__dt_mail_t__is_sy__74444068]  DEFAULT ((0)) FOR [is_sys]
GO
/****** Object:  Default [DF__dt_link__is_imag__35DCF99B]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_link] ADD  CONSTRAINT [DF__dt_link__is_imag__35DCF99B]  DEFAULT ((0)) FOR [is_image]
GO
/****** Object:  Default [DF__dt_link__sort_id__36D11DD4]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_link] ADD  CONSTRAINT [DF__dt_link__sort_id__36D11DD4]  DEFAULT ((99)) FOR [sort_id]
GO
/****** Object:  Default [DF__dt_link__is_red__37C5420D]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_link] ADD  CONSTRAINT [DF__dt_link__is_red__37C5420D]  DEFAULT ((0)) FOR [is_red]
GO
/****** Object:  Default [DF__dt_link__add_tim__38B96646]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_link] ADD  CONSTRAINT [DF__dt_link__add_tim__38B96646]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__dt_feedba__add_t__405A880E]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_feedback] ADD  CONSTRAINT [DF__dt_feedba__add_t__405A880E]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__dt_feedba__reply__414EAC47]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_feedback] ADD  CONSTRAINT [DF__dt_feedba__reply__414EAC47]  DEFAULT ('') FOR [reply_content]
GO
/****** Object:  Default [DF__dt_feedba__is_lo__4242D080]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_feedback] ADD  CONSTRAINT [DF__dt_feedba__is_lo__4242D080]  DEFAULT ((0)) FOR [is_lock]
GO
/****** Object:  Default [DF__dt_expres__expre__6CA31EA0]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_express] ADD  CONSTRAINT [DF__dt_expres__expre__6CA31EA0]  DEFAULT ('') FOR [express_code]
GO
/****** Object:  Default [DF__dt_expres__expre__6D9742D9]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_express] ADD  CONSTRAINT [DF__dt_expres__expre__6D9742D9]  DEFAULT ((0)) FOR [express_fee]
GO
/****** Object:  Default [DF__dt_expres__websi__6E8B6712]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_express] ADD  CONSTRAINT [DF__dt_expres__websi__6E8B6712]  DEFAULT ('') FOR [website]
GO
/****** Object:  Default [DF__dt_expres__remar__6F7F8B4B]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_express] ADD  CONSTRAINT [DF__dt_expres__remar__6F7F8B4B]  DEFAULT ('') FOR [remark]
GO
/****** Object:  Default [DF__dt_expres__sort___7073AF84]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_express] ADD  CONSTRAINT [DF__dt_expres__sort___7073AF84]  DEFAULT ((99)) FOR [sort_id]
GO
/****** Object:  Default [DF__dt_expres__is_lo__7167D3BD]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_express] ADD  CONSTRAINT [DF__dt_expres__is_lo__7167D3BD]  DEFAULT ((0)) FOR [is_lock]
GO
/****** Object:  Default [DF__dt_channe__title__6319B466]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_channel_category] ADD  CONSTRAINT [DF__dt_channe__title__6319B466]  DEFAULT ('') FOR [title]
GO
/****** Object:  Default [DF__dt_channe__build__640DD89F]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_channel_category] ADD  CONSTRAINT [DF__dt_channe__build__640DD89F]  DEFAULT ('') FOR [build_path]
GO
/****** Object:  Default [DF__dt_channe__templ__6501FCD8]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_channel_category] ADD  CONSTRAINT [DF__dt_channe__templ__6501FCD8]  DEFAULT ('') FOR [templet_path]
GO
/****** Object:  Default [DF__dt_channe__domai__65F62111]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_channel_category] ADD  CONSTRAINT [DF__dt_channe__domai__65F62111]  DEFAULT ('') FOR [domain]
GO
/****** Object:  Default [DF__dt_channe__is_de__66EA454A]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_channel_category] ADD  CONSTRAINT [DF__dt_channe__is_de__66EA454A]  DEFAULT ((0)) FOR [is_default]
GO
/****** Object:  Default [DF__dt_channe__sort___67DE6983]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_channel_category] ADD  CONSTRAINT [DF__dt_channe__sort___67DE6983]  DEFAULT ((99)) FOR [sort_id]
GO
/****** Object:  Default [DF__dt_manage__is_sy__019E3B86]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_manager_role] ADD  CONSTRAINT [DF__dt_manage__is_sy__019E3B86]  DEFAULT ((0)) FOR [is_sys]
GO
/****** Object:  Default [DF__dt_manage__add_t__451F3D2B]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_manager_log] ADD  CONSTRAINT [DF__dt_manage__add_t__451F3D2B]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__dt_user_a__order__4277DAAA]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_amount_log] ADD  CONSTRAINT [DF__dt_user_a__order__4277DAAA]  DEFAULT ('') FOR [order_no]
GO
/****** Object:  Default [DF__dt_user_a__payme__436BFEE3]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_amount_log] ADD  CONSTRAINT [DF__dt_user_a__payme__436BFEE3]  DEFAULT ((0)) FOR [payment_id]
GO
/****** Object:  Default [DF__dt_user_a__value__4460231C]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_amount_log] ADD  CONSTRAINT [DF__dt_user_a__value__4460231C]  DEFAULT ((0)) FOR [value]
GO
/****** Object:  Default [DF__dt_user_a__remar__45544755]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_amount_log] ADD  CONSTRAINT [DF__dt_user_a__remar__45544755]  DEFAULT ('') FOR [remark]
GO
/****** Object:  Default [DF__dt_user_a__statu__46486B8E]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_amount_log] ADD  CONSTRAINT [DF__dt_user_a__statu__46486B8E]  DEFAULT ((0)) FOR [status]
GO
/****** Object:  Default [DF__dt_user_a__add_t__473C8FC7]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_user_amount_log] ADD  CONSTRAINT [DF__dt_user_a__add_t__473C8FC7]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__dt_sms_te__title__3CBF0154]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_sms_template] ADD  CONSTRAINT [DF__dt_sms_te__title__3CBF0154]  DEFAULT ('') FOR [title]
GO
/****** Object:  Default [DF__dt_sms_te__call___3DB3258D]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_sms_template] ADD  CONSTRAINT [DF__dt_sms_te__call___3DB3258D]  DEFAULT ('') FOR [call_index]
GO
/****** Object:  Default [DF__dt_sms_te__conte__3EA749C6]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_sms_template] ADD  CONSTRAINT [DF__dt_sms_te__conte__3EA749C6]  DEFAULT ('') FOR [content]
GO
/****** Object:  Default [DF__dt_sms_te__is_sy__3F9B6DFF]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_sms_template] ADD  CONSTRAINT [DF__dt_sms_te__is_sy__3F9B6DFF]  DEFAULT ((0)) FOR [is_sys]
GO
/****** Object:  Default [DF__dt_paymen__img_u__351DDF8C]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_payment] ADD  CONSTRAINT [DF__dt_paymen__img_u__351DDF8C]  DEFAULT ('') FOR [img_url]
GO
/****** Object:  Default [DF__dt_payment__type__361203C5]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_payment] ADD  CONSTRAINT [DF__dt_payment__type__361203C5]  DEFAULT ((1)) FOR [type]
GO
/****** Object:  Default [DF__dt_paymen__pound__370627FE]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_payment] ADD  CONSTRAINT [DF__dt_paymen__pound__370627FE]  DEFAULT ((1)) FOR [poundage_type]
GO
/****** Object:  Default [DF__dt_paymen__pound__37FA4C37]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_payment] ADD  CONSTRAINT [DF__dt_paymen__pound__37FA4C37]  DEFAULT ((0)) FOR [poundage_amount]
GO
/****** Object:  Default [DF__dt_paymen__sort___38EE7070]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_payment] ADD  CONSTRAINT [DF__dt_paymen__sort___38EE7070]  DEFAULT ((99)) FOR [sort_id]
GO
/****** Object:  Default [DF__dt_paymen__is_lo__39E294A9]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_payment] ADD  CONSTRAINT [DF__dt_paymen__is_lo__39E294A9]  DEFAULT ((0)) FOR [is_lock]
GO
/****** Object:  Default [DF__dt_orders__order__1B5E0D89]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__order__1B5E0D89]  DEFAULT ('') FOR [order_no]
GO
/****** Object:  Default [DF__dt_orders__trade__1C5231C2]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__trade__1C5231C2]  DEFAULT ('') FOR [trade_no]
GO
/****** Object:  Default [DF__dt_orders__user___1D4655FB]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__user___1D4655FB]  DEFAULT ((0)) FOR [user_id]
GO
/****** Object:  Default [DF__dt_orders__user___1E3A7A34]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__user___1E3A7A34]  DEFAULT ('') FOR [user_name]
GO
/****** Object:  Default [DF__dt_orders__payme__1F2E9E6D]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__payme__1F2E9E6D]  DEFAULT ((0)) FOR [payment_id]
GO
/****** Object:  Default [DF__dt_orders__payme__2022C2A6]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__payme__2022C2A6]  DEFAULT ((0)) FOR [payment_fee]
GO
/****** Object:  Default [DF__dt_orders__payme__2116E6DF]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__payme__2116E6DF]  DEFAULT ((0)) FOR [payment_status]
GO
/****** Object:  Default [DF__dt_orders__expre__220B0B18]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__expre__220B0B18]  DEFAULT ((0)) FOR [express_id]
GO
/****** Object:  Default [DF__dt_orders__expre__22FF2F51]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__expre__22FF2F51]  DEFAULT ('') FOR [express_no]
GO
/****** Object:  Default [DF__dt_orders__expre__23F3538A]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__expre__23F3538A]  DEFAULT ((0)) FOR [express_fee]
GO
/****** Object:  Default [DF__dt_orders__expre__24E777C3]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__expre__24E777C3]  DEFAULT ((0)) FOR [express_status]
GO
/****** Object:  Default [DF__dt_orders__accep__25DB9BFC]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__accep__25DB9BFC]  DEFAULT ('') FOR [accept_name]
GO
/****** Object:  Default [DF__dt_orders__post___26CFC035]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__post___26CFC035]  DEFAULT ('') FOR [post_code]
GO
/****** Object:  Default [DF__dt_orders__telph__27C3E46E]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__telph__27C3E46E]  DEFAULT ('') FOR [telphone]
GO
/****** Object:  Default [DF__dt_orders__mobil__28B808A7]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__mobil__28B808A7]  DEFAULT ('') FOR [mobile]
GO
/****** Object:  Default [DF__dt_orders__area__29AC2CE0]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__area__29AC2CE0]  DEFAULT ('') FOR [area]
GO
/****** Object:  Default [DF__dt_orders__addre__2AA05119]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__addre__2AA05119]  DEFAULT ('') FOR [address]
GO
/****** Object:  Default [DF__dt_orders__messa__2B947552]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__messa__2B947552]  DEFAULT ('') FOR [message]
GO
/****** Object:  Default [DF__dt_orders__remar__2C88998B]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__remar__2C88998B]  DEFAULT ('') FOR [remark]
GO
/****** Object:  Default [DF__dt_orders__payab__2D7CBDC4]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__payab__2D7CBDC4]  DEFAULT ((0)) FOR [payable_amount]
GO
/****** Object:  Default [DF__dt_orders__real___2E70E1FD]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__real___2E70E1FD]  DEFAULT ((0)) FOR [real_amount]
GO
/****** Object:  Default [DF__dt_orders__order__2F650636]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__order__2F650636]  DEFAULT ((0)) FOR [order_amount]
GO
/****** Object:  Default [DF__dt_orders__point__30592A6F]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__point__30592A6F]  DEFAULT ((0)) FOR [point]
GO
/****** Object:  Default [DF__dt_orders__statu__314D4EA8]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__statu__314D4EA8]  DEFAULT ((1)) FOR [status]
GO
/****** Object:  Default [DF__dt_orders__add_t__324172E1]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_orders] ADD  CONSTRAINT [DF__dt_orders__add_t__324172E1]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__dt_articl__title__1EF99443]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attribute_field] ADD  CONSTRAINT [DF__dt_articl__title__1EF99443]  DEFAULT ('') FOR [title]
GO
/****** Object:  Default [DF__dt_articl__data___1FEDB87C]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attribute_field] ADD  CONSTRAINT [DF__dt_articl__data___1FEDB87C]  DEFAULT ((0)) FOR [data_length]
GO
/****** Object:  Default [DF__dt_articl__data___20E1DCB5]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attribute_field] ADD  CONSTRAINT [DF__dt_articl__data___20E1DCB5]  DEFAULT ((0)) FOR [data_place]
GO
/****** Object:  Default [DF__dt_articl__item___21D600EE]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attribute_field] ADD  CONSTRAINT [DF__dt_articl__item___21D600EE]  DEFAULT ('') FOR [item_option]
GO
/****** Object:  Default [DF__dt_articl__defau__22CA2527]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attribute_field] ADD  CONSTRAINT [DF__dt_articl__defau__22CA2527]  DEFAULT ('') FOR [default_value]
GO
/****** Object:  Default [DF__dt_articl__is_re__23BE4960]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attribute_field] ADD  CONSTRAINT [DF__dt_articl__is_re__23BE4960]  DEFAULT ((0)) FOR [is_required]
GO
/****** Object:  Default [DF__dt_articl__is_pa__24B26D99]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attribute_field] ADD  CONSTRAINT [DF__dt_articl__is_pa__24B26D99]  DEFAULT ((0)) FOR [is_password]
GO
/****** Object:  Default [DF__dt_articl__is_ht__25A691D2]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attribute_field] ADD  CONSTRAINT [DF__dt_articl__is_ht__25A691D2]  DEFAULT ((0)) FOR [is_html]
GO
/****** Object:  Default [DF__dt_articl__edito__269AB60B]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attribute_field] ADD  CONSTRAINT [DF__dt_articl__edito__269AB60B]  DEFAULT ((0)) FOR [editor_type]
GO
/****** Object:  Default [DF__dt_articl__valid__278EDA44]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attribute_field] ADD  CONSTRAINT [DF__dt_articl__valid__278EDA44]  DEFAULT ('') FOR [valid_tip_msg]
GO
/****** Object:  Default [DF__dt_articl__valid__2882FE7D]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attribute_field] ADD  CONSTRAINT [DF__dt_articl__valid__2882FE7D]  DEFAULT ('') FOR [valid_error_msg]
GO
/****** Object:  Default [DF__dt_articl__valid__297722B6]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attribute_field] ADD  CONSTRAINT [DF__dt_articl__valid__297722B6]  DEFAULT ('') FOR [valid_pattern]
GO
/****** Object:  Default [DF__dt_articl__sort___2A6B46EF]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attribute_field] ADD  CONSTRAINT [DF__dt_articl__sort___2A6B46EF]  DEFAULT ((99)) FOR [sort_id]
GO
/****** Object:  Default [DF__dt_articl__is_sy__2B5F6B28]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attribute_field] ADD  CONSTRAINT [DF__dt_articl__is_sy__2B5F6B28]  DEFAULT ((0)) FOR [is_sys]
GO
/****** Object:  Default [DF__dt_articl__artic__2334397B]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attach] ADD  CONSTRAINT [DF__dt_articl__artic__2334397B]  DEFAULT ((0)) FOR [article_id]
GO
/****** Object:  Default [DF__dt_articl__file___24285DB4]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attach] ADD  CONSTRAINT [DF__dt_articl__file___24285DB4]  DEFAULT ('') FOR [file_name]
GO
/****** Object:  Default [DF__dt_articl__file___251C81ED]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attach] ADD  CONSTRAINT [DF__dt_articl__file___251C81ED]  DEFAULT ('') FOR [file_path]
GO
/****** Object:  Default [DF__dt_articl__file___2610A626]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attach] ADD  CONSTRAINT [DF__dt_articl__file___2610A626]  DEFAULT ((0)) FOR [file_size]
GO
/****** Object:  Default [DF__dt_articl__file___2704CA5F]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attach] ADD  CONSTRAINT [DF__dt_articl__file___2704CA5F]  DEFAULT ('') FOR [file_ext]
GO
/****** Object:  Default [DF__dt_articl__down___27F8EE98]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attach] ADD  CONSTRAINT [DF__dt_articl__down___27F8EE98]  DEFAULT ((0)) FOR [down_num]
GO
/****** Object:  Default [DF__dt_articl__point__28ED12D1]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attach] ADD  CONSTRAINT [DF__dt_articl__point__28ED12D1]  DEFAULT ((0)) FOR [point]
GO
/****** Object:  Default [DF__dt_articl__add_t__29E1370A]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_attach] ADD  CONSTRAINT [DF__dt_articl__add_t__29E1370A]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__dt_articl__artic__1C873BEC]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_albums] ADD  CONSTRAINT [DF__dt_articl__artic__1C873BEC]  DEFAULT ((0)) FOR [article_id]
GO
/****** Object:  Default [DF__dt_articl__thumb__1D7B6025]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_albums] ADD  CONSTRAINT [DF__dt_articl__thumb__1D7B6025]  DEFAULT ('') FOR [thumb_path]
GO
/****** Object:  Default [DF__dt_articl__origi__1E6F845E]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_albums] ADD  CONSTRAINT [DF__dt_articl__origi__1E6F845E]  DEFAULT ('') FOR [original_path]
GO
/****** Object:  Default [DF__dt_articl__remar__1F63A897]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_albums] ADD  CONSTRAINT [DF__dt_articl__remar__1F63A897]  DEFAULT ('') FOR [remark]
GO
/****** Object:  Default [DF__dt_articl__add_t__2057CCD0]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article_albums] ADD  CONSTRAINT [DF__dt_articl__add_t__2057CCD0]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__dt_articl__chann__0697FACD]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__chann__0697FACD]  DEFAULT ((0)) FOR [channel_id]
GO
/****** Object:  Default [DF__dt_articl__categ__078C1F06]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__categ__078C1F06]  DEFAULT ((0)) FOR [category_id]
GO
/****** Object:  Default [DF__dt_articl__call___0880433F]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__call___0880433F]  DEFAULT ('') FOR [call_index]
GO
/****** Object:  Default [DF__dt_articl__link___09746778]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__link___09746778]  DEFAULT ('') FOR [link_url]
GO
/****** Object:  Default [DF__dt_articl__img_u__0A688BB1]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__img_u__0A688BB1]  DEFAULT ('') FOR [img_url]
GO
/****** Object:  Default [DF__dt_articl__seo_t__0B5CAFEA]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__seo_t__0B5CAFEA]  DEFAULT ('') FOR [seo_title]
GO
/****** Object:  Default [DF__dt_articl__seo_k__0C50D423]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__seo_k__0C50D423]  DEFAULT ('') FOR [seo_keywords]
GO
/****** Object:  Default [DF__dt_articl__seo_d__0D44F85C]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__seo_d__0D44F85C]  DEFAULT ('') FOR [seo_description]
GO
/****** Object:  Default [DF__dt_articl__zhaiy__0E391C95]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__zhaiy__0E391C95]  DEFAULT ('') FOR [zhaiyao]
GO
/****** Object:  Default [DF__dt_articl__sort___0F2D40CE]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__sort___0F2D40CE]  DEFAULT ((99)) FOR [sort_id]
GO
/****** Object:  Default [DF__dt_articl__click__10216507]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__click__10216507]  DEFAULT ((0)) FOR [click]
GO
/****** Object:  Default [DF__dt_articl__statu__11158940]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__statu__11158940]  DEFAULT ((0)) FOR [status]
GO
/****** Object:  Default [DF__dt_articl__group__1209AD79]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__group__1209AD79]  DEFAULT ('') FOR [groupids_view]
GO
/****** Object:  Default [DF__dt_articl__vote___12FDD1B2]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__vote___12FDD1B2]  DEFAULT ((0)) FOR [vote_id]
GO
/****** Object:  Default [DF__dt_articl__is_ms__13F1F5EB]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__is_ms__13F1F5EB]  DEFAULT ((0)) FOR [is_msg]
GO
/****** Object:  Default [DF__dt_articl__is_to__14E61A24]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__is_to__14E61A24]  DEFAULT ((0)) FOR [is_top]
GO
/****** Object:  Default [DF__dt_articl__is_re__15DA3E5D]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__is_re__15DA3E5D]  DEFAULT ((0)) FOR [is_red]
GO
/****** Object:  Default [DF__dt_articl__is_ho__16CE6296]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__is_ho__16CE6296]  DEFAULT ((0)) FOR [is_hot]
GO
/****** Object:  Default [DF__dt_articl__is_sl__17C286CF]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__is_sl__17C286CF]  DEFAULT ((0)) FOR [is_slide]
GO
/****** Object:  Default [DF__dt_articl__is_sy__18B6AB08]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__is_sy__18B6AB08]  DEFAULT ((0)) FOR [is_sys]
GO
/****** Object:  Default [DF__dt_articl__add_t__19AACF41]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article] ADD  CONSTRAINT [DF__dt_articl__add_t__19AACF41]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__dt_articl__chann__5006DFF2]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article_comment] ADD  CONSTRAINT [DF__dt_articl__chann__5006DFF2]  DEFAULT ((0)) FOR [channel_id]
GO
/****** Object:  Default [DF__dt_articl__artic__50FB042B]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article_comment] ADD  CONSTRAINT [DF__dt_articl__artic__50FB042B]  DEFAULT ((0)) FOR [article_id]
GO
/****** Object:  Default [DF__dt_articl__paren__51EF2864]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article_comment] ADD  CONSTRAINT [DF__dt_articl__paren__51EF2864]  DEFAULT ((0)) FOR [parent_id]
GO
/****** Object:  Default [DF__dt_articl__user___52E34C9D]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article_comment] ADD  CONSTRAINT [DF__dt_articl__user___52E34C9D]  DEFAULT ((0)) FOR [user_id]
GO
/****** Object:  Default [DF__dt_articl__user___53D770D6]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article_comment] ADD  CONSTRAINT [DF__dt_articl__user___53D770D6]  DEFAULT ('') FOR [user_name]
GO
/****** Object:  Default [DF__dt_articl__is_lo__54CB950F]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article_comment] ADD  CONSTRAINT [DF__dt_articl__is_lo__54CB950F]  DEFAULT ((0)) FOR [is_lock]
GO
/****** Object:  Default [DF__dt_articl__add_t__55BFB948]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article_comment] ADD  CONSTRAINT [DF__dt_articl__add_t__55BFB948]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__dt_articl__is_re__56B3DD81]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article_comment] ADD  CONSTRAINT [DF__dt_articl__is_re__56B3DD81]  DEFAULT ((0)) FOR [is_reply]
GO
/****** Object:  Default [DF__dt_articl__call___4589517F]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article_category] ADD  CONSTRAINT [DF__dt_articl__call___4589517F]  DEFAULT ('') FOR [call_index]
GO
/****** Object:  Default [DF__dt_articl__paren__467D75B8]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article_category] ADD  CONSTRAINT [DF__dt_articl__paren__467D75B8]  DEFAULT ((0)) FOR [parent_id]
GO
/****** Object:  Default [DF__dt_articl__class__477199F1]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article_category] ADD  CONSTRAINT [DF__dt_articl__class__477199F1]  DEFAULT ((0)) FOR [class_layer]
GO
/****** Object:  Default [DF__dt_articl__sort___4865BE2A]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article_category] ADD  CONSTRAINT [DF__dt_articl__sort___4865BE2A]  DEFAULT ((99)) FOR [sort_id]
GO
/****** Object:  Default [DF__dt_articl__link___4959E263]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article_category] ADD  CONSTRAINT [DF__dt_articl__link___4959E263]  DEFAULT ('') FOR [link_url]
GO
/****** Object:  Default [DF__dt_articl__img_u__4A4E069C]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article_category] ADD  CONSTRAINT [DF__dt_articl__img_u__4A4E069C]  DEFAULT ('') FOR [img_url]
GO
/****** Object:  Default [DF__dt_articl__seo_t__4B422AD5]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article_category] ADD  CONSTRAINT [DF__dt_articl__seo_t__4B422AD5]  DEFAULT ('') FOR [seo_title]
GO
/****** Object:  Default [DF__dt_articl__seo_k__4C364F0E]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article_category] ADD  CONSTRAINT [DF__dt_articl__seo_k__4C364F0E]  DEFAULT ('') FOR [seo_keywords]
GO
/****** Object:  Default [DF__dt_articl__seo_d__4D2A7347]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article_category] ADD  CONSTRAINT [DF__dt_articl__seo_d__4D2A7347]  DEFAULT ('') FOR [seo_description]
GO
/****** Object:  Default [DF__dt_order___goods__15A53433]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_order_goods] ADD  CONSTRAINT [DF__dt_order___goods__15A53433]  DEFAULT ((0)) FOR [goods_price]
GO
/****** Object:  Default [DF__dt_order___real___1699586C]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_order_goods] ADD  CONSTRAINT [DF__dt_order___real___1699586C]  DEFAULT ((0)) FOR [real_price]
GO
/****** Object:  Default [DF__dt_order___quant__178D7CA5]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_order_goods] ADD  CONSTRAINT [DF__dt_order___quant__178D7CA5]  DEFAULT ((0)) FOR [quantity]
GO
/****** Object:  Default [DF__dt_order___point__1881A0DE]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_order_goods] ADD  CONSTRAINT [DF__dt_order___point__1881A0DE]  DEFAULT ((0)) FOR [point]
GO
/****** Object:  Default [DF__dt_manage__role___7720AD13]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_manager] ADD  CONSTRAINT [DF__dt_manage__role___7720AD13]  DEFAULT ((2)) FOR [role_type]
GO
/****** Object:  Default [DF__dt_manage__real___7814D14C]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_manager] ADD  CONSTRAINT [DF__dt_manage__real___7814D14C]  DEFAULT ('') FOR [real_name]
GO
/****** Object:  Default [DF__dt_manage__telep__7908F585]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_manager] ADD  CONSTRAINT [DF__dt_manage__telep__7908F585]  DEFAULT ('') FOR [telephone]
GO
/****** Object:  Default [DF__dt_manage__email__79FD19BE]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_manager] ADD  CONSTRAINT [DF__dt_manage__email__79FD19BE]  DEFAULT ('') FOR [email]
GO
/****** Object:  Default [DF__dt_manage__is_lo__7AF13DF7]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_manager] ADD  CONSTRAINT [DF__dt_manage__is_lo__7AF13DF7]  DEFAULT ((0)) FOR [is_lock]
GO
/****** Object:  Default [DF__dt_manage__add_t__7BE56230]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_manager] ADD  CONSTRAINT [DF__dt_manage__add_t__7BE56230]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__dt_channe__categ__59904A2C]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_channel] ADD  CONSTRAINT [DF__dt_channe__categ__59904A2C]  DEFAULT ((0)) FOR [category_id]
GO
/****** Object:  Default [DF__dt_channel__name__5A846E65]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_channel] ADD  CONSTRAINT [DF__dt_channel__name__5A846E65]  DEFAULT ('') FOR [name]
GO
/****** Object:  Default [DF__dt_channe__title__5B78929E]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_channel] ADD  CONSTRAINT [DF__dt_channe__title__5B78929E]  DEFAULT ('') FOR [title]
GO
/****** Object:  Default [DF__dt_channe__is_al__5C6CB6D7]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_channel] ADD  CONSTRAINT [DF__dt_channe__is_al__5C6CB6D7]  DEFAULT ((0)) FOR [is_albums]
GO
/****** Object:  Default [DF__dt_channe__is_at__5D60DB10]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_channel] ADD  CONSTRAINT [DF__dt_channe__is_at__5D60DB10]  DEFAULT ((0)) FOR [is_attach]
GO
/****** Object:  Default [DF__dt_channe__is_gr__5E54FF49]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_channel] ADD  CONSTRAINT [DF__dt_channe__is_gr__5E54FF49]  DEFAULT ((0)) FOR [is_group_price]
GO
/****** Object:  Default [DF__dt_channe__page___5F492382]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_channel] ADD  CONSTRAINT [DF__dt_channe__page___5F492382]  DEFAULT ((0)) FOR [page_size]
GO
/****** Object:  Default [DF__dt_channe__sort___603D47BB]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_channel] ADD  CONSTRAINT [DF__dt_channe__sort___603D47BB]  DEFAULT ((99)) FOR [sort_id]
GO
/****** Object:  Default [DF__dt_users__group___75F77EB0]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_users] ADD  CONSTRAINT [DF__dt_users__group___75F77EB0]  DEFAULT ((0)) FOR [group_id]
GO
/****** Object:  Default [DF__dt_users__email__76EBA2E9]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_users] ADD  CONSTRAINT [DF__dt_users__email__76EBA2E9]  DEFAULT ('') FOR [email]
GO
/****** Object:  Default [DF__dt_users__nick_n__77DFC722]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_users] ADD  CONSTRAINT [DF__dt_users__nick_n__77DFC722]  DEFAULT ('') FOR [nick_name]
GO
/****** Object:  Default [DF__dt_users__avatar__78D3EB5B]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_users] ADD  CONSTRAINT [DF__dt_users__avatar__78D3EB5B]  DEFAULT ('') FOR [avatar]
GO
/****** Object:  Default [DF__dt_users__sex__79C80F94]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_users] ADD  CONSTRAINT [DF__dt_users__sex__79C80F94]  DEFAULT ('保密') FOR [sex]
GO
/****** Object:  Default [DF__dt_users__telpho__7ABC33CD]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_users] ADD  CONSTRAINT [DF__dt_users__telpho__7ABC33CD]  DEFAULT ('') FOR [telphone]
GO
/****** Object:  Default [DF__dt_users__mobile__7BB05806]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_users] ADD  CONSTRAINT [DF__dt_users__mobile__7BB05806]  DEFAULT ('') FOR [mobile]
GO
/****** Object:  Default [DF__dt_users__qq__7CA47C3F]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_users] ADD  CONSTRAINT [DF__dt_users__qq__7CA47C3F]  DEFAULT ('') FOR [qq]
GO
/****** Object:  Default [DF__dt_users__safe_q__7D98A078]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_users] ADD  CONSTRAINT [DF__dt_users__safe_q__7D98A078]  DEFAULT ('') FOR [safe_question]
GO
/****** Object:  Default [DF__dt_users__safe_a__7E8CC4B1]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_users] ADD  CONSTRAINT [DF__dt_users__safe_a__7E8CC4B1]  DEFAULT ('') FOR [safe_answer]
GO
/****** Object:  Default [DF__dt_users__amount__7F80E8EA]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_users] ADD  CONSTRAINT [DF__dt_users__amount__7F80E8EA]  DEFAULT ((0)) FOR [amount]
GO
/****** Object:  Default [DF__dt_users__point__00750D23]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_users] ADD  CONSTRAINT [DF__dt_users__point__00750D23]  DEFAULT ((0)) FOR [point]
GO
/****** Object:  Default [DF__dt_users__exp__0169315C]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_users] ADD  CONSTRAINT [DF__dt_users__exp__0169315C]  DEFAULT ((0)) FOR [exp]
GO
/****** Object:  Default [DF__dt_users__status__025D5595]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_users] ADD  CONSTRAINT [DF__dt_users__status__025D5595]  DEFAULT ((0)) FOR [status]
GO
/****** Object:  Default [DF__dt_users__reg_ti__035179CE]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_users] ADD  CONSTRAINT [DF__dt_users__reg_ti__035179CE]  DEFAULT (getdate()) FOR [reg_time]
GO
/****** Object:  Default [DF__dt_user_l__user___5D2BD0E6]    Script Date: 05/09/2014 16:42:58 ******/
ALTER TABLE [dbo].[dt_user_login_log] ADD  CONSTRAINT [DF__dt_user_l__user___5D2BD0E6]  DEFAULT ('') FOR [user_name]
GO
/****** Object:  Default [DF__dt_user_l__remar__5E1FF51F]    Script Date: 05/09/2014 16:42:58 ******/
ALTER TABLE [dbo].[dt_user_login_log] ADD  CONSTRAINT [DF__dt_user_l__remar__5E1FF51F]  DEFAULT ('') FOR [remark]
GO
/****** Object:  Default [DF__dt_user_l__login__5F141958]    Script Date: 05/09/2014 16:42:58 ******/
ALTER TABLE [dbo].[dt_user_login_log] ADD  CONSTRAINT [DF__dt_user_l__login__5F141958]  DEFAULT (getdate()) FOR [login_time]
GO
/****** Object:  Default [DF__dt_user_l__login__60083D91]    Script Date: 05/09/2014 16:42:58 ******/
ALTER TABLE [dbo].[dt_user_login_log] ADD  CONSTRAINT [DF__dt_user_l__login__60083D91]  DEFAULT ('') FOR [login_ip]
GO
/****** Object:  Default [DF__dt_user_c__count__4A18FC72]    Script Date: 05/09/2014 16:42:58 ******/
ALTER TABLE [dbo].[dt_user_code] ADD  CONSTRAINT [DF__dt_user_c__count__4A18FC72]  DEFAULT ((0)) FOR [count]
GO
/****** Object:  Default [DF__dt_user_c__statu__4B0D20AB]    Script Date: 05/09/2014 16:42:58 ******/
ALTER TABLE [dbo].[dt_user_code] ADD  CONSTRAINT [DF__dt_user_c__statu__4B0D20AB]  DEFAULT ((0)) FOR [status]
GO
/****** Object:  Default [DF__dt_user_c__add_t__4C0144E4]    Script Date: 05/09/2014 16:42:58 ******/
ALTER TABLE [dbo].[dt_user_code] ADD  CONSTRAINT [DF__dt_user_c__add_t__4C0144E4]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  ForeignKey [FK_DT_ARTICLE]    Script Date: 05/09/2014 16:42:56 ******/
ALTER TABLE [dbo].[dt_article]  WITH CHECK ADD  CONSTRAINT [FK_DT_ARTICLE] FOREIGN KEY([id])
REFERENCES [dbo].[dt_article] ([id])
GO
ALTER TABLE [dbo].[dt_article] CHECK CONSTRAINT [FK_DT_ARTICLE]
GO
/****** Object:  ForeignKey [FK_dt_article_attribute_value_dt_article]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_article_attribute_value]  WITH CHECK ADD  CONSTRAINT [FK_dt_article_attribute_value_dt_article] FOREIGN KEY([article_id])
REFERENCES [dbo].[dt_article] ([id])
GO
ALTER TABLE [dbo].[dt_article_attribute_value] CHECK CONSTRAINT [FK_dt_article_attribute_value_dt_article]
GO
/****** Object:  ForeignKey [FK_DT_ORDER_REFERENCE_DT_ORDER]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_order_goods]  WITH CHECK ADD  CONSTRAINT [FK_DT_ORDER_REFERENCE_DT_ORDER] FOREIGN KEY([order_id])
REFERENCES [dbo].[dt_orders] ([id])
GO
ALTER TABLE [dbo].[dt_order_goods] CHECK CONSTRAINT [FK_DT_ORDER_REFERENCE_DT_ORDER]
GO
/****** Object:  ForeignKey [FK_DT_MANAG_REFERENCE_DT_MANAG_ROLE]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_manager]  WITH CHECK ADD  CONSTRAINT [FK_DT_MANAG_REFERENCE_DT_MANAG_ROLE] FOREIGN KEY([role_id])
REFERENCES [dbo].[dt_manager_role] ([id])
GO
ALTER TABLE [dbo].[dt_manager] CHECK CONSTRAINT [FK_DT_MANAG_REFERENCE_DT_MANAG_ROLE]
GO
/****** Object:  ForeignKey [FK_DT_CHANN_REFERENCE_DT_CATEGORY]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_channel]  WITH CHECK ADD  CONSTRAINT [FK_DT_CHANN_REFERENCE_DT_CATEGORY] FOREIGN KEY([category_id])
REFERENCES [dbo].[dt_channel_category] ([id])
GO
ALTER TABLE [dbo].[dt_channel] CHECK CONSTRAINT [FK_DT_CHANN_REFERENCE_DT_CATEGORY]
GO
/****** Object:  ForeignKey [FK_DT_USERS_REFERENCE_DT_USER_]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_users]  WITH CHECK ADD  CONSTRAINT [FK_DT_USERS_REFERENCE_DT_USER_] FOREIGN KEY([group_id])
REFERENCES [dbo].[dt_user_groups] ([id])
GO
ALTER TABLE [dbo].[dt_users] CHECK CONSTRAINT [FK_DT_USERS_REFERENCE_DT_USER_]
GO
/****** Object:  ForeignKey [FK_DT_MANAG_REFERENCE_DT_MANAG]    Script Date: 05/09/2014 16:42:57 ******/
ALTER TABLE [dbo].[dt_manager_role_value]  WITH CHECK ADD  CONSTRAINT [FK_DT_MANAG_REFERENCE_DT_MANAG] FOREIGN KEY([role_id])
REFERENCES [dbo].[dt_manager_role] ([id])
GO
ALTER TABLE [dbo].[dt_manager_role_value] CHECK CONSTRAINT [FK_DT_MANAG_REFERENCE_DT_MANAG]
GO
/****** Object:  ForeignKey [FK_DT_USER__REFERENCE_DT_USERS_LOG]    Script Date: 05/09/2014 16:42:58 ******/
ALTER TABLE [dbo].[dt_user_login_log]  WITH CHECK ADD  CONSTRAINT [FK_DT_USER__REFERENCE_DT_USERS_LOG] FOREIGN KEY([user_id])
REFERENCES [dbo].[dt_users] ([id])
GO
ALTER TABLE [dbo].[dt_user_login_log] CHECK CONSTRAINT [FK_DT_USER__REFERENCE_DT_USERS_LOG]
GO
/****** Object:  ForeignKey [FK_DT_USER__REFERENCE_DT_USERS_CODE]    Script Date: 05/09/2014 16:42:58 ******/
ALTER TABLE [dbo].[dt_user_code]  WITH CHECK ADD  CONSTRAINT [FK_DT_USER__REFERENCE_DT_USERS_CODE] FOREIGN KEY([user_id])
REFERENCES [dbo].[dt_users] ([id])
GO
ALTER TABLE [dbo].[dt_user_code] CHECK CONSTRAINT [FK_DT_USER__REFERENCE_DT_USERS_CODE]
GO
/****** Object:  ForeignKey [FK_DT_CHANN_REFERENCE_DT_CHANN_FIELD]    Script Date: 05/09/2014 16:42:58 ******/
ALTER TABLE [dbo].[dt_channel_field]  WITH CHECK ADD  CONSTRAINT [FK_DT_CHANN_REFERENCE_DT_CHANN_FIELD] FOREIGN KEY([channel_id])
REFERENCES [dbo].[dt_channel] ([id])
GO
ALTER TABLE [dbo].[dt_channel_field] CHECK CONSTRAINT [FK_DT_CHANN_REFERENCE_DT_CHANN_FIELD]
GO
