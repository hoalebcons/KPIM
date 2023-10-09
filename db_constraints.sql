
USE kpim;

# channel_key
ALTER TABLE `dbo.dim_channel` ADD PRIMARY KEY(channel_key);
ALTER TABLE `dbo.fact_ecommerce_sales` ADD FOREIGN KEY (channel_key) REFERENCES `dbo.dim_channel`(channel_key);

# customer_key

ALTER TABLE `dbo.dim_customer` ADD PRIMARY KEY(customer_key);
ALTER TABLE `dbo.fact_ecommerce_sales` ADD FOREIGN KEY (customer_key) REFERENCES `dbo.dim_customer`(customer_key);
ALTER TABLE `dbo.fact_online_sales` ADD FOREIGN KEY (customer_key) REFERENCES `dbo.dim_customer`(customer_key);
ALTER TABLE `dbo.fact_retail_sales` ADD FOREIGN KEY (customer_key) REFERENCES `dbo.dim_customer`(customer_key);

# date_key
ALTER TABLE `dbo.dim_date` ADD PRIMARY KEY(date_key);
ALTER TABLE `dbo.fact_ecommerce_sales` ADD FOREIGN KEY (date_key) REFERENCES `dbo.dim_date`(date_key);
ALTER TABLE `dbo.fact_franchise_sales_quota` ADD FOREIGN KEY (date_key) REFERENCES `dbo.dim_date`(date_key);
ALTER TABLE `dbo.fact_partner_sales` ADD FOREIGN KEY (date_key) REFERENCES `dbo.dim_date`(date_key);
ALTER TABLE `dbo.fact_retail_sales` ADD FOREIGN KEY (date_key) REFERENCES `dbo.dim_date`(date_key);

# employee_key
ALTER TABLE `dbo.dim_employee` ADD PRIMARY KEY(employee_key);
ALTER TABLE `dbo.fact_franchise_sales_quota` ADD FOREIGN KEY (employee_key) REFERENCES `dbo.dim_employee`(employee_key);
ALTER TABLE `dbo.fact_partner_sales` ADD FOREIGN KEY (employee_key) REFERENCES `dbo.dim_employee`(employee_key);

# partner_key
ALTER TABLE `dbo.dim_partner` ADD PRIMARY KEY(partner_key);
ALTER TABLE `dbo.fact_partner_sales` ADD FOREIGN KEY (partner_key) REFERENCES `dbo.dim_partner`(partner_key);

# product_key
ALTER TABLE `dbo.dim_product` ADD PRIMARY KEY(product_key);
ALTER TABLE `dbo.fact_ecommerce_sales` ADD FOREIGN KEY (product_key) REFERENCES `dbo.dim_product`(product_key);
ALTER TABLE `dbo.fact_online_sales` ADD FOREIGN KEY (product_key) REFERENCES `dbo.dim_product`(product_key);
ALTER TABLE `dbo.fact_partner_sales` ADD FOREIGN KEY (product_key) REFERENCES `dbo.dim_product`(product_key);
ALTER TABLE `dbo.fact_retail_sales` ADD FOREIGN KEY (product_key) REFERENCES `dbo.dim_product`(product_key);

# promotion_key
ALTER TABLE `dbo.dim_promotion` ADD PRIMARY KEY(promotion_key);
ALTER TABLE `dbo.fact_ecommerce_sales` ADD FOREIGN KEY (promotion_key) REFERENCES `dbo.dim_promotion`(promotion_key);
ALTER TABLE `dbo.fact_online_sales` ADD FOREIGN KEY (promotion_key) REFERENCES `dbo.dim_promotion`(promotion_key);
ALTER TABLE `dbo.fact_partner_sales` ADD FOREIGN KEY (promotion_key) REFERENCES `dbo.dim_promotion`(promotion_key);
ALTER TABLE `dbo.fact_retail_sales` ADD FOREIGN KEY (promotion_key) REFERENCES `dbo.dim_promotion`(promotion_key);

# sales_reason_key
ALTER TABLE `dbo.dim_sales_reason` ADD PRIMARY KEY(sales_reason_key);
ALTER TABLE `dbo.fact_sales_reason` ADD FOREIGN KEY (sales_reason_key) REFERENCES `dbo.dim_sales_reason`(sales_reason_key);

# store_key
ALTER TABLE `dbo.dim_store` ADD PRIMARY KEY(store_key);
ALTER TABLE `dbo.fact_ecommerce_sales` ADD FOREIGN KEY (store_key) REFERENCES `dbo.dim_store`(store_key);
ALTER TABLE `dbo.fact_online_sales` ADD FOREIGN KEY (store_key) REFERENCES `dbo.dim_store`(store_key);
ALTER TABLE `dbo.fact_partner_sales` ADD FOREIGN KEY (store_key) REFERENCES `dbo.dim_store`(store_key);
ALTER TABLE `dbo.fact_retail_sales` ADD FOREIGN KEY (store_key) REFERENCES `dbo.dim_store`(store_key);
ALTER TABLE `dbo.dim_employee` ADD FOREIGN KEY (store_key) REFERENCES `dbo.dim_store`(store_key);

# time_key
ALTER TABLE `dbo.dim_time` ADD PRIMARY KEY(time_key);
ALTER TABLE `dbo.fact_ecommerce_sales` ADD FOREIGN KEY (time_key) REFERENCES `dbo.dim_time`(time_key);
ALTER TABLE `dbo.fact_retail_sales` ADD FOREIGN KEY (time_key) REFERENCES `dbo.dim_time`(time_key);

# sales_quota_key
ALTER TABLE `dbo.fact_franchise_sales_quota` ADD PRIMARY KEY(sales_quota_key);

# order_number, order_line_number
ALTER TABLE `dbo.fact_sales_reason` ADD PRIMARY KEY(order_number, order_line_number);
ALTER TABLE `dbo.fact_ecommerce_sales` ADD FOREIGN KEY (order_number, order_line_number) REFERENCES `dbo.fact_sales_reason`(order_number, order_line_number);
ALTER TABLE `dbo.fact_online_sales` ADD FOREIGN KEY (order_number, order_line_number) REFERENCES `dbo.fact_sales_reason`(order_number, order_line_number);
ALTER TABLE `dbo.fact_retail_sales` ADD FOREIGN KEY (order_number, order_line_number) REFERENCES `dbo.fact_sales_reason`(order_number, order_line_number);
ALTER TABLE `dbo.fact_partner_sales` ADD FOREIGN KEY (order_number, order_line_number) REFERENCES `dbo.fact_sales_reason`(order_number, order_line_number);

ALTER TABLE `dbo.fact_partner_sales` ADD PRIMARY KEY(order_number, order_line_number);


ALTER TABLE `dbo.fact_sales_reason`
MODIFY COLUMN order_line_number VARCHAR(50);

DELETE FROM `dbo.fact_sales_reason`;

ALTER TABLE `dbo.fact_partner_sales` DROP PRIMARY KEY;
ALTER TABLE `dbo.fact_sales_reason` DROP FOREIGN KEY `dbo.fact_sales_reason_ibfk_3`; 

ALTER TABLE `dbo.dim_partner` DROP COLUMN `MyUnknownColumn_[3`dbo.dim_partner``dbo.dim_employee``dbo.dim_partner`]`;