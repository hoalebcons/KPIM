USE [master]
GO
/****** Object:  Database [Retail]    Script Date: 10/10/2023 3:11:09 PM ******/
CREATE DATABASE [Retail]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'retail', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\retail.mdf' , SIZE = 925696KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'retail_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\retail_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Retail] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Retail].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Retail] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Retail] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Retail] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Retail] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Retail] SET ARITHABORT OFF 
GO
ALTER DATABASE [Retail] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Retail] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Retail] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Retail] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Retail] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Retail] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Retail] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Retail] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Retail] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Retail] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Retail] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Retail] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Retail] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Retail] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Retail] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Retail] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Retail] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Retail] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Retail] SET  MULTI_USER 
GO
ALTER DATABASE [Retail] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Retail] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Retail] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Retail] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Retail] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Retail] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Retail] SET QUERY_STORE = ON
GO
ALTER DATABASE [Retail] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Retail]
GO
/****** Object:  Table [dbo].[dim_channel]    Script Date: 10/10/2023 3:11:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_channel](
	[channel_key] [int] NOT NULL,
	[channel_name] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_customer]    Script Date: 10/10/2023 3:11:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_customer](
	[customer_key] [int] NOT NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[loyal_group] [varchar](10) NULL,
	[birthday] [date] NULL,
	[gender] [nvarchar](10) NULL,
	[marital_status] [nvarchar](20) NULL,
	[education] [nvarchar](50) NULL,
	[occupation] [nvarchar](50) NULL,
	[yearly_income] [decimal](18, 0) NULL,
	[total_children] [int] NULL,
	[is_active] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_date]    Script Date: 10/10/2023 3:11:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_date](
	[date_key] [int] NOT NULL,
	[date] [date] NULL,
	[day] [int] NULL,
	[month] [int] NULL,
	[quarter] [int] NULL,
	[year] [int] NULL,
	[day_of_week] [nvarchar](20) NULL,
	[day_of_week_number] [tinyint] NULL,
	[year_month] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_employee]    Script Date: 10/10/2023 3:11:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_employee](
	[employee_key] [int] NOT NULL,
	[parent_employee_key] [int] NULL,
	[employee_code] [nvarchar](50) NULL,
	[store_key] [int] NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[middle_name] [nvarchar](50) NULL,
	[title] [nvarchar](50) NULL,
	[department_name] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[hire_date] [date] NULL,
	[birth_date] [date] NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[login_id] [nvarchar](50) NULL,
	[email_address] [nvarchar](100) NULL,
	[phone] [int] NULL,
	[marital_status] [nvarchar](10) NULL,
	[gender] [nvarchar](10) NULL,
	[salaried_flag] [bit] NULL,
	[pay_frequency] [int] NULL,
	[base_rate] [float] NULL,
	[vacation_hours] [int] NULL,
	[sick_leave_hours] [int] NULL,
	[sales_person_flag] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_partner]    Script Date: 10/10/2023 3:11:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_partner](
	[partner_key] [int] NOT NULL,
	[phone] [nvarchar](50) NULL,
	[business_type] [nvarchar](50) NULL,
	[partner_name] [nvarchar](500) NULL,
	[nb_employees] [int] NULL,
	[order_frequency] [nvarchar](10) NULL,
	[order_month] [int] NULL,
	[year_opened] [int] NULL,
	[bank_name] [nvarchar](50) NULL,
	[annual_sales] [bigint] NULL,
	[email_contact] [nvarchar](200) NULL,
	[province] [nvarchar](100) NULL,
	[address] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_product]    Script Date: 10/10/2023 3:11:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_product](
	[product_key] [int] NOT NULL,
	[product_name] [nvarchar](200) NULL,
	[product_category] [nvarchar](200) NULL,
	[product_subcategory] [nvarchar](200) NULL,
	[uom] [nvarchar](50) NULL,
	[price] [float] NULL,
	[cost] [float] NULL,
	[country ] [nvarchar](50) NULL,
	[brand] [nvarchar](200) NULL,
	[suplier_name] [nvarchar](200) NULL,
	[weight] [float] NULL,
	[uom_weight] [nvarchar](50) NULL,
	[volume] [nvarchar](50) NULL,
	[uom_volumn] [nvarchar](50) NULL,
	[length] [float] NULL,
	[width] [float] NULL,
	[heigth] [float] NULL,
	[uom_size] [nvarchar](50) NULL,
	[link] [nvarchar](200) NULL,
	[product_category_image] [nvarchar](200) NULL,
	[description] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_promotion]    Script Date: 10/10/2023 3:11:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_promotion](
	[promotion_key] [int] NOT NULL,
	[promotion] [nvarchar](200) NULL,
	[discount_percent] [float] NULL,
	[type] [nvarchar](100) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[min_qty] [int] NULL,
	[max_qty] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_sales_reason]    Script Date: 10/10/2023 3:11:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_sales_reason](
	[sales_reason_key] [int] NOT NULL,
	[sales_reason_name] [nvarchar](50) NULL,
	[sales_reason_type] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_store]    Script Date: 10/10/2023 3:11:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_store](
	[store_key] [int] NOT NULL,
	[store] [nvarchar](200) NULL,
	[manager] [nvarchar](200) NULL,
	[manager_image] [nvarchar](200) NULL,
	[city] [nvarchar](100) NULL,
	[district] [nvarchar](100) NULL,
	[ward] [nvarchar](100) NULL,
	[address] [nvarchar](200) NULL,
	[latitude] [decimal](18, 16) NULL,
	[longitude] [decimal](18, 15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_time]    Script Date: 10/10/2023 3:11:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_time](
	[time_key] [int] NOT NULL,
	[fulltime] [time](7) NULL,
	[hour24] [int] NULL,
	[hour12] [int] NULL,
	[minute] [int] NULL,
	[second] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fact_ecommerce_sales]    Script Date: 10/10/2023 3:11:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_ecommerce_sales](
	[date_key] [int] NULL,
	[time_key] [int] NULL,
	[channel_key] [int] NULL,
	[customer_key] [int] NULL,
	[product_key] [int] NULL,
	[store_key] [int] NULL,
	[promotion_key] [int] NULL,
	[order_quantity] [int] NULL,
	[unit_price] [float] NULL,
	[unit_cost] [float] NULL,
	[unit_discount] [float] NULL,
	[sales_amount] [decimal](18, 2) NULL,
	[order_number] [nvarchar](50) NULL,
	[order_line_number] [int] NULL,
	[order_date] [date] NULL,
	[order_time] [time](7) NULL,
	[ship_date] [date] NULL,
	[payment_date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fact_franchise_sales_quota]    Script Date: 10/10/2023 3:11:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_franchise_sales_quota](
	[sales_quota_key] [int] NULL,
	[date_key] [int] NULL,
	[employee_key] [int] NULL,
	[calendar_year] [int] NULL,
	[calendar_quarter] [int] NULL,
	[sales_amount_quota] [decimal](18, 2) NULL,
	[date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fact_online_sales]    Script Date: 10/10/2023 3:11:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_online_sales](
	[date_key] [int] NOT NULL,
	[time_key] [int] NULL,
	[channel_key] [int] NULL,
	[customer_key] [int] NULL,
	[product_key] [int] NULL,
	[store_key] [int] NULL,
	[promotion_key] [int] NULL,
	[order_quantity] [int] NULL,
	[unit_price] [float] NULL,
	[unit_cost] [float] NULL,
	[unit_discount] [float] NULL,
	[sales_amount] [decimal](18, 2) NULL,
	[order_number] [nvarchar](20) NULL,
	[order_line_number] [int] NULL,
	[order_date] [date] NULL,
	[ship_date] [date] NULL,
	[payment_date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fact_partner_sales]    Script Date: 10/10/2023 3:11:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_partner_sales](
	[date_key] [int] NULL,
	[partner_key] [int] NULL,
	[employee_key] [int] NULL,
	[product_key] [int] NULL,
	[store_key] [int] NULL,
	[promotion_key] [int] NULL,
	[order_quantity] [int] NULL,
	[unit_price] [float] NULL,
	[unit_cost] [float] NULL,
	[unit_discount] [float] NULL,
	[sales_amount] [decimal](18, 2) NULL,
	[cost_amount] [decimal](18, 2) NULL,
	[discount_amount] [decimal](18, 2) NULL,
	[tax_amount] [decimal](18, 2) NULL,
	[freight] [decimal](18, 2) NULL,
	[order_number] [nvarchar](50) NOT NULL,
	[order_line_number] [int] NOT NULL,
	[order_date] [date] NULL,
	[order_time] [time](7) NULL,
	[due_date] [date] NULL,
	[ship_date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fact_retail_sales]    Script Date: 10/10/2023 3:11:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_retail_sales](
	[date_key] [int] NULL,
	[time_key] [int] NULL,
	[customer_key] [int] NULL,
	[product_key] [int] NULL,
	[store_key] [int] NULL,
	[promotion_key] [int] NULL,
	[order_quantity] [int] NULL,
	[unit_price] [float] NULL,
	[unit_cost] [float] NULL,
	[unit_discount] [float] NULL,
	[sales_amount] [decimal](18, 2) NULL,
	[order_number] [nvarchar](50) NULL,
	[order_line_number] [int] NULL,
	[order_date] [date] NULL,
	[order_time] [time](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fact_sales_online_plan]    Script Date: 10/10/2023 3:11:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_sales_online_plan](
	[year_month] [nvarchar](10) NOT NULL,
	[date_key] [int] NOT NULL,
	[store_key] [int] NOT NULL,
	[sales_plan] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fact_sales_reason]    Script Date: 10/10/2023 3:11:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_sales_reason](
	[order_number] [nvarchar](50) NOT NULL,
	[order_line_number] [int] NOT NULL,
	[sales_reason_key] [int] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Retail] SET  READ_WRITE 
GO
