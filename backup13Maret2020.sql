--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.24
-- Dumped by pg_dump version 10.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_user_id_c564eba6_fk;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.authtoken_token DROP CONSTRAINT IF EXISTS authtoken_token_user_id_35299eff_fk_auth_user_id;
ALTER TABLE IF EXISTS ONLY public.auth_user_user_permissions DROP CONSTRAINT IF EXISTS auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
ALTER TABLE IF EXISTS ONLY public.auth_user_user_permissions DROP CONSTRAINT IF EXISTS auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
ALTER TABLE IF EXISTS ONLY public.auth_user_groups DROP CONSTRAINT IF EXISTS auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
ALTER TABLE IF EXISTS ONLY public.auth_user_groups DROP CONSTRAINT IF EXISTS auth_user_groups_group_id_97559544_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
ALTER TABLE IF EXISTS ONLY public.api_rental_detail_sn DROP CONSTRAINT IF EXISTS "api_rental_detail_sn_stock_code_id_id_8a84d26a_fk_RentalSto";
ALTER TABLE IF EXISTS ONLY public.api_rental_detail_sn DROP CONSTRAINT IF EXISTS "api_rental_detail_sn_rental_detail_id_id_95305bb7_fk_RentalDet";
ALTER TABLE IF EXISTS ONLY public."StockSNHistory" DROP CONSTRAINT IF EXISTS "StockSNHistory_stock_code_id_id_1478f13f_fk_RentalSto";
ALTER TABLE IF EXISTS ONLY public."StockSNHistory" DROP CONSTRAINT IF EXISTS "StockSNHistory_RentalRef_id_id_f7ed64e7_fk_RentalHea";
ALTER TABLE IF EXISTS ONLY public."RentalStockSN" DROP CONSTRAINT IF EXISTS "RentalStockSN_stock_card_id_id_6fa39970_fk_RentalSto";
ALTER TABLE IF EXISTS ONLY public."RentalStockSN" DROP CONSTRAINT IF EXISTS "RentalStockSN_receiving_detail_sn__37cf0545_fk_Receiving";
ALTER TABLE IF EXISTS ONLY public."RentalStockCard" DROP CONSTRAINT IF EXISTS "RentalStockCard_rental_header_id_id_bef28c3a_fk_RentalHea";
ALTER TABLE IF EXISTS ONLY public."RentalStockCard" DROP CONSTRAINT IF EXISTS "RentalStockCard_rental_detail_id_id_58d13af5_fk_RentalDet";
ALTER TABLE IF EXISTS ONLY public."RentalStockCard" DROP CONSTRAINT IF EXISTS "RentalStockCard_receiving_header_id__5e951664_fk_Receiving";
ALTER TABLE IF EXISTS ONLY public."RentalStockCard" DROP CONSTRAINT IF EXISTS "RentalStockCard_receiving_detail_id__a3a09248_fk_Receiving";
ALTER TABLE IF EXISTS ONLY public."RentalOrderHeader" DROP CONSTRAINT IF EXISTS "RentalOrderHeader_user_id_id_2586eb83_fk_MasterUser_id";
ALTER TABLE IF EXISTS ONLY public."RentalOrderHeader" DROP CONSTRAINT IF EXISTS "RentalOrderHeader_location_id_id_e1ff1464_fk_MasterLok";
ALTER TABLE IF EXISTS ONLY public."RentalOrderHeader" DROP CONSTRAINT IF EXISTS "RentalOrderHeader_customer_id_id_bfec4faf_fk_MasterCus";
ALTER TABLE IF EXISTS ONLY public."RentalOrderDetail" DROP CONSTRAINT IF EXISTS "RentalOrderDetail_sales_order_id_id_94702d1f_fk_RentalOrd";
ALTER TABLE IF EXISTS ONLY public."RentalOrderDetail" DROP CONSTRAINT IF EXISTS "RentalOrderDetail_master_item_id_id_5262ae43_fk_MasterIte";
ALTER TABLE IF EXISTS ONLY public."RentalHeader" DROP CONSTRAINT IF EXISTS "RentalHeader_user_id_id_ed85f58e_fk_MasterUser_id";
ALTER TABLE IF EXISTS ONLY public."RentalHeader" DROP CONSTRAINT IF EXISTS "RentalHeader_sales_order_id_id_b18d3d33_fk_RentalOrd";
ALTER TABLE IF EXISTS ONLY public."RentalHeader" DROP CONSTRAINT IF EXISTS "RentalHeader_location_id_id_5307829f_fk_MasterLok";
ALTER TABLE IF EXISTS ONLY public."RentalHeader" DROP CONSTRAINT IF EXISTS "RentalHeader_customer_id_id_670f9d44_fk_MasterCus";
ALTER TABLE IF EXISTS ONLY public."RentalDetail" DROP CONSTRAINT IF EXISTS "RentalDetail_rental_header_id_id_f096f90f_fk_RentalHea";
ALTER TABLE IF EXISTS ONLY public."RentalDetail" DROP CONSTRAINT IF EXISTS "RentalDetail_order_detail_id_id_597d61a7_fk_RentalOrd";
ALTER TABLE IF EXISTS ONLY public."RentalDetail" DROP CONSTRAINT IF EXISTS "RentalDetail_master_item_id_id_604165a5_fk_MasterIte";
ALTER TABLE IF EXISTS ONLY public."ReceivingHeader" DROP CONSTRAINT IF EXISTS "ReceivingHeader_vendor_id_id_071c0a14_fk_MasterVendor_vendor_id";
ALTER TABLE IF EXISTS ONLY public."ReceivingHeader" DROP CONSTRAINT IF EXISTS "ReceivingHeader_user_id_id_2e42c5b5_fk_MasterUser_id";
ALTER TABLE IF EXISTS ONLY public."ReceivingHeader" DROP CONSTRAINT IF EXISTS "ReceivingHeader_location_id_id_058a430a_fk_MasterLok";
ALTER TABLE IF EXISTS ONLY public."ReceivingDetail" DROP CONSTRAINT IF EXISTS "ReceivingDetail_uom_id_id_2182f019_fk_MasterUOM_uom_id";
ALTER TABLE IF EXISTS ONLY public."ReceivingDetail" DROP CONSTRAINT IF EXISTS "ReceivingDetail_receiving_header_id__13251e20_fk_Receiving";
ALTER TABLE IF EXISTS ONLY public."ReceivingDetail" DROP CONSTRAINT IF EXISTS "ReceivingDetail_master_item_id_id_43a27bf8_fk_MasterIte";
ALTER TABLE IF EXISTS ONLY public."ReceivingDetailSN" DROP CONSTRAINT IF EXISTS "ReceivingDetailSN_receiving_detail_id__15bcd9d9_fk_Receiving";
ALTER TABLE IF EXISTS ONLY public."MasterUser" DROP CONSTRAINT IF EXISTS "MasterUser_user_id_bbf21857_fk";
ALTER TABLE IF EXISTS ONLY public."MasterUser" DROP CONSTRAINT IF EXISTS "MasterUser_employee_id_id_c01329c1_fk_MasterEmp";
ALTER TABLE IF EXISTS ONLY public."MasterItem" DROP CONSTRAINT IF EXISTS "MasterItem_uom_id_id_ea03dc57_fk_MasterUOM_uom_id";
ALTER TABLE IF EXISTS ONLY public."MasterItem" DROP CONSTRAINT IF EXISTS "MasterItem_merk_id_id_6cc75195_fk_MasterMerk_merk_id";
ALTER TABLE IF EXISTS ONLY public."MasterItem" DROP CONSTRAINT IF EXISTS "MasterItem_master_group_id_id_ee5dc254_fk_MasterGro";
ALTER TABLE IF EXISTS ONLY public."InvoiceHeader" DROP CONSTRAINT IF EXISTS "InvoiceHeader_rental_header_id_id_14640721_fk_RentalHea";
ALTER TABLE IF EXISTS ONLY public."InvoiceDetail" DROP CONSTRAINT IF EXISTS "InvoiceDetail_user_id_id_1e698a87_fk_MasterUser_id";
ALTER TABLE IF EXISTS ONLY public."InvoiceDetail" DROP CONSTRAINT IF EXISTS "InvoiceDetail_master_item_id_id_0afa9524_fk_MasterIte";
ALTER TABLE IF EXISTS ONLY public."InvoiceDetail" DROP CONSTRAINT IF EXISTS "InvoiceDetail_invoice_header_id_id_2a7b6fec_fk_InvoiceHe";
DROP INDEX IF EXISTS public.django_session_session_key_c0390e0f_like;
DROP INDEX IF EXISTS public.django_session_expire_date_a5c62663;
DROP INDEX IF EXISTS public.django_admin_log_user_id_c564eba6;
DROP INDEX IF EXISTS public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX IF EXISTS public.authtoken_token_key_10f0b77e_like;
DROP INDEX IF EXISTS public.auth_user_username_6821ab7c_like;
DROP INDEX IF EXISTS public.auth_user_user_permissions_user_id_a95ead1b;
DROP INDEX IF EXISTS public.auth_user_user_permissions_permission_id_1fbb5f2c;
DROP INDEX IF EXISTS public.auth_user_groups_user_id_6a12ed8b;
DROP INDEX IF EXISTS public.auth_user_groups_group_id_97559544;
DROP INDEX IF EXISTS public.auth_permission_content_type_id_2f476e4b;
DROP INDEX IF EXISTS public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX IF EXISTS public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX IF EXISTS public.auth_group_name_a6ea08ec_like;
DROP INDEX IF EXISTS public.api_rental_detail_sn_stock_code_id_id_8a84d26a;
DROP INDEX IF EXISTS public.api_rental_detail_sn_rental_detail_id_id_95305bb7;
DROP INDEX IF EXISTS public."StockSNHistory_stock_code_id_id_1478f13f";
DROP INDEX IF EXISTS public."StockSNHistory_RentalRef_id_id_f7ed64e7";
DROP INDEX IF EXISTS public."RentalStockSN_stock_card_id_id_6fa39970";
DROP INDEX IF EXISTS public."RentalStockCard_rental_header_id_id_bef28c3a";
DROP INDEX IF EXISTS public."RentalStockCard_rental_detail_id_id_58d13af5";
DROP INDEX IF EXISTS public."RentalStockCard_receiving_header_id_id_5e951664";
DROP INDEX IF EXISTS public."RentalStockCard_receiving_detail_id_id_a3a09248";
DROP INDEX IF EXISTS public."RentalOrderHeader_user_id_id_2586eb83";
DROP INDEX IF EXISTS public."RentalOrderHeader_location_id_id_e1ff1464";
DROP INDEX IF EXISTS public."RentalOrderHeader_customer_id_id_bfec4faf";
DROP INDEX IF EXISTS public."RentalOrderDetail_sales_order_id_id_94702d1f";
DROP INDEX IF EXISTS public."RentalOrderDetail_master_item_id_id_5262ae43";
DROP INDEX IF EXISTS public."RentalHeader_user_id_id_ed85f58e";
DROP INDEX IF EXISTS public."RentalHeader_location_id_id_5307829f";
DROP INDEX IF EXISTS public."RentalHeader_customer_id_id_670f9d44";
DROP INDEX IF EXISTS public."RentalDetail_rental_header_id_id_f096f90f";
DROP INDEX IF EXISTS public."RentalDetail_master_item_id_id_604165a5";
DROP INDEX IF EXISTS public."ReceivingHeader_vendor_id_id_071c0a14";
DROP INDEX IF EXISTS public."ReceivingHeader_user_id_id_2e42c5b5";
DROP INDEX IF EXISTS public."ReceivingHeader_location_id_id_058a430a";
DROP INDEX IF EXISTS public."ReceivingDetail_uom_id_id_2182f019";
DROP INDEX IF EXISTS public."ReceivingDetail_receiving_header_id_id_13251e20";
DROP INDEX IF EXISTS public."ReceivingDetail_master_item_id_id_43a27bf8";
DROP INDEX IF EXISTS public."ReceivingDetailSN_receiving_detail_id_id_15bcd9d9";
DROP INDEX IF EXISTS public."MasterVendor_name_9f312288_like";
DROP INDEX IF EXISTS public."MasterUOM_name_64a7c342_like";
DROP INDEX IF EXISTS public."MasterMerk_name_840cf85b_like";
DROP INDEX IF EXISTS public."MasterLokasi_name_4e2d16b7_like";
DROP INDEX IF EXISTS public."MasterLokasi_code_954c37f8_like";
DROP INDEX IF EXISTS public."MasterItem_uom_id_id_ea03dc57";
DROP INDEX IF EXISTS public."MasterItem_name_33b17ca5_like";
DROP INDEX IF EXISTS public."MasterItem_merk_id_id_6cc75195";
DROP INDEX IF EXISTS public."MasterItem_master_group_id_id_ee5dc254";
DROP INDEX IF EXISTS public."MasterGroupItem_name_c1ffa871_like";
DROP INDEX IF EXISTS public."MasterGroupItem_code_3ef35978_like";
DROP INDEX IF EXISTS public."MasterEmployee_name_62010e04_like";
DROP INDEX IF EXISTS public."MasterCustomer_name_ceed6b4a_like";
DROP INDEX IF EXISTS public."InvoiceHeader_rental_header_id_id_14640721";
DROP INDEX IF EXISTS public."InvoiceDetail_user_id_id_1e698a87";
DROP INDEX IF EXISTS public."InvoiceDetail_master_item_id_id_0afa9524";
DROP INDEX IF EXISTS public."InvoiceDetail_invoice_header_id_id_2a7b6fec";
ALTER TABLE IF EXISTS ONLY public.django_session DROP CONSTRAINT IF EXISTS django_session_pkey;
ALTER TABLE IF EXISTS ONLY public.django_migrations DROP CONSTRAINT IF EXISTS django_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_pkey;
ALTER TABLE IF EXISTS ONLY public.authtoken_token DROP CONSTRAINT IF EXISTS authtoken_token_user_id_key;
ALTER TABLE IF EXISTS ONLY public.authtoken_token DROP CONSTRAINT IF EXISTS authtoken_token_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_user DROP CONSTRAINT IF EXISTS auth_user_username_key;
ALTER TABLE IF EXISTS ONLY public.auth_user_user_permissions DROP CONSTRAINT IF EXISTS auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_user_user_permissions DROP CONSTRAINT IF EXISTS auth_user_user_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_user DROP CONSTRAINT IF EXISTS auth_user_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_user_groups DROP CONSTRAINT IF EXISTS auth_user_groups_user_id_group_id_94350c0c_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_user_groups DROP CONSTRAINT IF EXISTS auth_user_groups_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_name_key;
ALTER TABLE IF EXISTS ONLY public.api_rental_detail_sn DROP CONSTRAINT IF EXISTS api_rental_detail_sn_pkey;
ALTER TABLE IF EXISTS ONLY public.api_grouppermission DROP CONSTRAINT IF EXISTS api_grouppermission_pkey;
ALTER TABLE IF EXISTS ONLY public."StockSNHistory" DROP CONSTRAINT IF EXISTS "StockSNHistory_pkey";
ALTER TABLE IF EXISTS ONLY public."RentalStockSN" DROP CONSTRAINT IF EXISTS "RentalStockSN_receiving_detail_sn_id_id_key";
ALTER TABLE IF EXISTS ONLY public."RentalStockSN" DROP CONSTRAINT IF EXISTS "RentalStockSN_pkey";
ALTER TABLE IF EXISTS ONLY public."RentalStockCard" DROP CONSTRAINT IF EXISTS "RentalStockCard_pkey";
ALTER TABLE IF EXISTS ONLY public."RentalOrderHeader" DROP CONSTRAINT IF EXISTS "RentalOrderHeader_pkey";
ALTER TABLE IF EXISTS ONLY public."RentalOrderDetail" DROP CONSTRAINT IF EXISTS "RentalOrderDetail_pkey";
ALTER TABLE IF EXISTS ONLY public."RentalHeader" DROP CONSTRAINT IF EXISTS "RentalHeader_sales_order_id_id_key";
ALTER TABLE IF EXISTS ONLY public."RentalHeader" DROP CONSTRAINT IF EXISTS "RentalHeader_pkey";
ALTER TABLE IF EXISTS ONLY public."RentalDetail" DROP CONSTRAINT IF EXISTS "RentalDetail_pkey";
ALTER TABLE IF EXISTS ONLY public."RentalDetail" DROP CONSTRAINT IF EXISTS "RentalDetail_order_detail_id_id_key";
ALTER TABLE IF EXISTS ONLY public."ReceivingHeader" DROP CONSTRAINT IF EXISTS "ReceivingHeader_pkey";
ALTER TABLE IF EXISTS ONLY public."ReceivingDetail" DROP CONSTRAINT IF EXISTS "ReceivingDetail_pkey";
ALTER TABLE IF EXISTS ONLY public."ReceivingDetailSN" DROP CONSTRAINT IF EXISTS "ReceivingDetailSN_pkey";
ALTER TABLE IF EXISTS ONLY public."MasterVendor" DROP CONSTRAINT IF EXISTS "MasterVendor_pkey";
ALTER TABLE IF EXISTS ONLY public."MasterVendor" DROP CONSTRAINT IF EXISTS "MasterVendor_name_key";
ALTER TABLE IF EXISTS ONLY public."MasterUser" DROP CONSTRAINT IF EXISTS "MasterUser_user_id_key";
ALTER TABLE IF EXISTS ONLY public."MasterUser" DROP CONSTRAINT IF EXISTS "MasterUser_pkey";
ALTER TABLE IF EXISTS ONLY public."MasterUser" DROP CONSTRAINT IF EXISTS "MasterUser_employee_id_id_key";
ALTER TABLE IF EXISTS ONLY public."MasterUOM" DROP CONSTRAINT IF EXISTS "MasterUOM_pkey";
ALTER TABLE IF EXISTS ONLY public."MasterUOM" DROP CONSTRAINT IF EXISTS "MasterUOM_name_key";
ALTER TABLE IF EXISTS ONLY public."MasterMerk" DROP CONSTRAINT IF EXISTS "MasterMerk_pkey";
ALTER TABLE IF EXISTS ONLY public."MasterMerk" DROP CONSTRAINT IF EXISTS "MasterMerk_name_key";
ALTER TABLE IF EXISTS ONLY public."MasterLokasi" DROP CONSTRAINT IF EXISTS "MasterLokasi_pkey";
ALTER TABLE IF EXISTS ONLY public."MasterLokasi" DROP CONSTRAINT IF EXISTS "MasterLokasi_name_key";
ALTER TABLE IF EXISTS ONLY public."MasterLokasi" DROP CONSTRAINT IF EXISTS "MasterLokasi_code_key";
ALTER TABLE IF EXISTS ONLY public."MasterItem" DROP CONSTRAINT IF EXISTS "MasterItem_pkey";
ALTER TABLE IF EXISTS ONLY public."MasterItem" DROP CONSTRAINT IF EXISTS "MasterItem_name_key";
ALTER TABLE IF EXISTS ONLY public."MasterGroupItem" DROP CONSTRAINT IF EXISTS "MasterGroupItem_pkey";
ALTER TABLE IF EXISTS ONLY public."MasterGroupItem" DROP CONSTRAINT IF EXISTS "MasterGroupItem_name_key";
ALTER TABLE IF EXISTS ONLY public."MasterGroupItem" DROP CONSTRAINT IF EXISTS "MasterGroupItem_code_key";
ALTER TABLE IF EXISTS ONLY public."MasterEmployee" DROP CONSTRAINT IF EXISTS "MasterEmployee_pkey";
ALTER TABLE IF EXISTS ONLY public."MasterEmployee" DROP CONSTRAINT IF EXISTS "MasterEmployee_name_key";
ALTER TABLE IF EXISTS ONLY public."MasterCustomer" DROP CONSTRAINT IF EXISTS "MasterCustomer_pkey";
ALTER TABLE IF EXISTS ONLY public."MasterCustomer" DROP CONSTRAINT IF EXISTS "MasterCustomer_name_key";
ALTER TABLE IF EXISTS ONLY public."InvoiceHeader" DROP CONSTRAINT IF EXISTS "InvoiceHeader_pkey";
ALTER TABLE IF EXISTS ONLY public."InvoiceDetail" DROP CONSTRAINT IF EXISTS "InvoiceDetail_pkey";
ALTER TABLE IF EXISTS public.django_migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.django_content_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.django_admin_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.auth_user ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.auth_permission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.auth_group ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.api_rental_detail_sn ALTER COLUMN rental_detail_sn_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.api_grouppermission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."StockSNHistory" ALTER COLUMN stock_sn_history_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."RentalStockSN" ALTER COLUMN stock_code_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."RentalStockCard" ALTER COLUMN stock_card_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."RentalOrderHeader" ALTER COLUMN sales_order_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."RentalOrderDetail" ALTER COLUMN order_detail_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."RentalHeader" ALTER COLUMN rental_header_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."RentalDetail" ALTER COLUMN rental_detail_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."ReceivingHeader" ALTER COLUMN receiving_header_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."ReceivingDetailSN" ALTER COLUMN receiving_detail_sn_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."ReceivingDetail" ALTER COLUMN receiving_detail_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."MasterVendor" ALTER COLUMN vendor_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."MasterUser" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."MasterUOM" ALTER COLUMN uom_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."MasterMerk" ALTER COLUMN merk_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."MasterLokasi" ALTER COLUMN location_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."MasterItem" ALTER COLUMN master_item_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."MasterGroupItem" ALTER COLUMN group_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."MasterEmployee" ALTER COLUMN employee_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."MasterCustomer" ALTER COLUMN customer_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."InvoiceHeader" ALTER COLUMN invoice_header_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."InvoiceDetail" ALTER COLUMN invoice_detail_id DROP DEFAULT;
DROP TABLE IF EXISTS public.django_session;
DROP SEQUENCE IF EXISTS public.django_migrations_id_seq;
DROP TABLE IF EXISTS public.django_migrations;
DROP SEQUENCE IF EXISTS public.django_content_type_id_seq;
DROP TABLE IF EXISTS public.django_content_type;
DROP SEQUENCE IF EXISTS public.django_admin_log_id_seq;
DROP TABLE IF EXISTS public.django_admin_log;
DROP TABLE IF EXISTS public.authtoken_token;
DROP SEQUENCE IF EXISTS public.auth_user_user_permissions_id_seq;
DROP TABLE IF EXISTS public.auth_user_user_permissions;
DROP SEQUENCE IF EXISTS public.auth_user_id_seq;
DROP SEQUENCE IF EXISTS public.auth_user_groups_id_seq;
DROP TABLE IF EXISTS public.auth_user_groups;
DROP TABLE IF EXISTS public.auth_user;
DROP SEQUENCE IF EXISTS public.auth_permission_id_seq;
DROP TABLE IF EXISTS public.auth_permission;
DROP SEQUENCE IF EXISTS public.auth_group_permissions_id_seq;
DROP TABLE IF EXISTS public.auth_group_permissions;
DROP SEQUENCE IF EXISTS public.auth_group_id_seq;
DROP TABLE IF EXISTS public.auth_group;
DROP SEQUENCE IF EXISTS public.api_rental_detail_sn_rental_detail_sn_id_seq;
DROP TABLE IF EXISTS public.api_rental_detail_sn;
DROP SEQUENCE IF EXISTS public.api_grouppermission_id_seq;
DROP TABLE IF EXISTS public.api_grouppermission;
DROP SEQUENCE IF EXISTS public."StockSNHistory_stock_sn_history_id_seq";
DROP TABLE IF EXISTS public."StockSNHistory";
DROP SEQUENCE IF EXISTS public."RentalStockSN_stock_code_id_seq";
DROP TABLE IF EXISTS public."RentalStockSN";
DROP SEQUENCE IF EXISTS public."RentalStockCard_stock_card_id_seq";
DROP TABLE IF EXISTS public."RentalStockCard";
DROP SEQUENCE IF EXISTS public."RentalOrderHeader_sales_order_id_seq";
DROP TABLE IF EXISTS public."RentalOrderHeader";
DROP SEQUENCE IF EXISTS public."RentalOrderDetail_order_detail_id_seq";
DROP TABLE IF EXISTS public."RentalOrderDetail";
DROP SEQUENCE IF EXISTS public."RentalHeader_rental_header_id_seq";
DROP TABLE IF EXISTS public."RentalHeader";
DROP SEQUENCE IF EXISTS public."RentalDetail_rental_detail_id_seq";
DROP TABLE IF EXISTS public."RentalDetail";
DROP SEQUENCE IF EXISTS public."ReceivingHeader_receiving_header_id_seq";
DROP TABLE IF EXISTS public."ReceivingHeader";
DROP SEQUENCE IF EXISTS public."ReceivingDetail_receiving_detail_id_seq";
DROP SEQUENCE IF EXISTS public."ReceivingDetailSN_receiving_detail_sn_id_seq";
DROP TABLE IF EXISTS public."ReceivingDetailSN";
DROP TABLE IF EXISTS public."ReceivingDetail";
DROP SEQUENCE IF EXISTS public."MasterVendor_vendor_id_seq";
DROP TABLE IF EXISTS public."MasterVendor";
DROP SEQUENCE IF EXISTS public."MasterUser_id_seq";
DROP TABLE IF EXISTS public."MasterUser";
DROP SEQUENCE IF EXISTS public."MasterUOM_uom_id_seq";
DROP TABLE IF EXISTS public."MasterUOM";
DROP SEQUENCE IF EXISTS public."MasterMerk_merk_id_seq";
DROP TABLE IF EXISTS public."MasterMerk";
DROP SEQUENCE IF EXISTS public."MasterLokasi_location_id_seq";
DROP TABLE IF EXISTS public."MasterLokasi";
DROP SEQUENCE IF EXISTS public."MasterItem_master_item_id_seq";
DROP TABLE IF EXISTS public."MasterItem";
DROP SEQUENCE IF EXISTS public."MasterGroupItem_group_id_seq";
DROP TABLE IF EXISTS public."MasterGroupItem";
DROP SEQUENCE IF EXISTS public."MasterEmployee_employee_id_seq";
DROP TABLE IF EXISTS public."MasterEmployee";
DROP SEQUENCE IF EXISTS public."MasterCustomer_customer_id_seq";
DROP TABLE IF EXISTS public."MasterCustomer";
DROP SEQUENCE IF EXISTS public."InvoiceHeader_invoice_header_id_seq";
DROP TABLE IF EXISTS public."InvoiceHeader";
DROP SEQUENCE IF EXISTS public."InvoiceDetail_invoice_detail_id_seq";
DROP TABLE IF EXISTS public."InvoiceDetail";
DROP EXTENSION IF EXISTS plpgsql;
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: InvoiceDetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InvoiceDetail" (
    invoice_detail_id bigint NOT NULL,
    date date NOT NULL,
    type_payment character varying(50) NOT NULL,
    pay_amount bigint NOT NULL,
    pay_method character varying(50) NOT NULL,
    noted text NOT NULL,
    jml_period integer,
    period character varying(50) NOT NULL,
    harga_rental character varying(200) NOT NULL,
    invoice_header_id_id bigint,
    master_item_id_id bigint,
    user_id_id integer
);


ALTER TABLE public."InvoiceDetail" OWNER TO postgres;

--
-- Name: InvoiceDetail_invoice_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."InvoiceDetail_invoice_detail_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."InvoiceDetail_invoice_detail_id_seq" OWNER TO postgres;

--
-- Name: InvoiceDetail_invoice_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."InvoiceDetail_invoice_detail_id_seq" OWNED BY public."InvoiceDetail".invoice_detail_id;


--
-- Name: InvoiceHeader; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InvoiceHeader" (
    invoice_header_id bigint NOT NULL,
    date date NOT NULL,
    amount character varying(100) NOT NULL,
    customer bigint NOT NULL,
    pay_method integer NOT NULL,
    rental_header_id_id bigint,
    status character varying(50) NOT NULL
);


ALTER TABLE public."InvoiceHeader" OWNER TO postgres;

--
-- Name: InvoiceHeader_invoice_header_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."InvoiceHeader_invoice_header_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."InvoiceHeader_invoice_header_id_seq" OWNER TO postgres;

--
-- Name: InvoiceHeader_invoice_header_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."InvoiceHeader_invoice_header_id_seq" OWNED BY public."InvoiceHeader".invoice_header_id;


--
-- Name: MasterCustomer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MasterCustomer" (
    customer_id bigint NOT NULL,
    customer_type character varying(100) NOT NULL,
    name character varying(300) NOT NULL,
    address character varying(500) NOT NULL,
    pos_code character varying(100) NOT NULL,
    phone_code character varying(50) NOT NULL,
    phone character varying(50) NOT NULL,
    fax_code character varying(50) NOT NULL,
    fax character varying(50) NOT NULL,
    mobile_phone character varying(100) NOT NULL,
    pic_name character varying(100) NOT NULL,
    pic_number character varying(100) NOT NULL
);


ALTER TABLE public."MasterCustomer" OWNER TO postgres;

--
-- Name: MasterCustomer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MasterCustomer_customer_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MasterCustomer_customer_id_seq" OWNER TO postgres;

--
-- Name: MasterCustomer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MasterCustomer_customer_id_seq" OWNED BY public."MasterCustomer".customer_id;


--
-- Name: MasterEmployee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MasterEmployee" (
    employee_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    address character varying(300) NOT NULL,
    id_type character varying(100) NOT NULL,
    id_number character varying(100) NOT NULL,
    employee_status character varying(100) NOT NULL,
    dob date NOT NULL,
    phone_number character varying(50) NOT NULL
);


ALTER TABLE public."MasterEmployee" OWNER TO postgres;

--
-- Name: MasterEmployee_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MasterEmployee_employee_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MasterEmployee_employee_id_seq" OWNER TO postgres;

--
-- Name: MasterEmployee_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MasterEmployee_employee_id_seq" OWNED BY public."MasterEmployee".employee_id;


--
-- Name: MasterGroupItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MasterGroupItem" (
    group_id bigint NOT NULL,
    code character varying(100) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public."MasterGroupItem" OWNER TO postgres;

--
-- Name: MasterGroupItem_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MasterGroupItem_group_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MasterGroupItem_group_id_seq" OWNER TO postgres;

--
-- Name: MasterGroupItem_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MasterGroupItem_group_id_seq" OWNED BY public."MasterGroupItem".group_id;


--
-- Name: MasterItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MasterItem" (
    master_item_id bigint NOT NULL,
    code character varying(100) NOT NULL,
    counter integer,
    barcode character varying(100) NOT NULL,
    name character varying(200) NOT NULL,
    alias_name character varying(200) NOT NULL,
    price1 character varying(200) NOT NULL,
    price2 character varying(200) NOT NULL,
    price3 character varying(200) NOT NULL,
    master_group_id_id bigint NOT NULL,
    merk_id_id bigint NOT NULL,
    uom_id_id bigint NOT NULL,
    serial_number boolean NOT NULL
);


ALTER TABLE public."MasterItem" OWNER TO postgres;

--
-- Name: MasterItem_master_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MasterItem_master_item_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MasterItem_master_item_id_seq" OWNER TO postgres;

--
-- Name: MasterItem_master_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MasterItem_master_item_id_seq" OWNED BY public."MasterItem".master_item_id;


--
-- Name: MasterLokasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MasterLokasi" (
    location_id bigint NOT NULL,
    type character varying(150) NOT NULL,
    code character varying(100) NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public."MasterLokasi" OWNER TO postgres;

--
-- Name: MasterLokasi_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MasterLokasi_location_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MasterLokasi_location_id_seq" OWNER TO postgres;

--
-- Name: MasterLokasi_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MasterLokasi_location_id_seq" OWNED BY public."MasterLokasi".location_id;


--
-- Name: MasterMerk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MasterMerk" (
    merk_id bigint NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public."MasterMerk" OWNER TO postgres;

--
-- Name: MasterMerk_merk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MasterMerk_merk_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MasterMerk_merk_id_seq" OWNER TO postgres;

--
-- Name: MasterMerk_merk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MasterMerk_merk_id_seq" OWNED BY public."MasterMerk".merk_id;


--
-- Name: MasterUOM; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MasterUOM" (
    uom_id bigint NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public."MasterUOM" OWNER TO postgres;

--
-- Name: MasterUOM_uom_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MasterUOM_uom_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MasterUOM_uom_id_seq" OWNER TO postgres;

--
-- Name: MasterUOM_uom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MasterUOM_uom_id_seq" OWNED BY public."MasterUOM".uom_id;


--
-- Name: MasterUser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MasterUser" (
    id integer NOT NULL,
    user_level character varying(10) NOT NULL,
    user_type character varying(10) NOT NULL,
    employee_id_id bigint,
    user_id integer NOT NULL
);


ALTER TABLE public."MasterUser" OWNER TO postgres;

--
-- Name: MasterUser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MasterUser_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MasterUser_id_seq" OWNER TO postgres;

--
-- Name: MasterUser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MasterUser_id_seq" OWNED BY public."MasterUser".id;


--
-- Name: MasterVendor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MasterVendor" (
    vendor_id bigint NOT NULL,
    name character varying(200) NOT NULL,
    address character varying(200) NOT NULL
);


ALTER TABLE public."MasterVendor" OWNER TO postgres;

--
-- Name: MasterVendor_vendor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MasterVendor_vendor_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MasterVendor_vendor_id_seq" OWNER TO postgres;

--
-- Name: MasterVendor_vendor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MasterVendor_vendor_id_seq" OWNED BY public."MasterVendor".vendor_id;


--
-- Name: ReceivingDetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ReceivingDetail" (
    receiving_detail_id bigint NOT NULL,
    qty integer NOT NULL,
    note character varying(200) NOT NULL,
    master_item_id_id bigint,
    receiving_header_id_id bigint,
    uom_id_id bigint
);


ALTER TABLE public."ReceivingDetail" OWNER TO postgres;

--
-- Name: ReceivingDetailSN; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ReceivingDetailSN" (
    receiving_detail_sn_id bigint NOT NULL,
    first_serial_number character varying(100) NOT NULL,
    new_serial_number character varying(100) NOT NULL,
    receiving_detail_id_id bigint NOT NULL
);


ALTER TABLE public."ReceivingDetailSN" OWNER TO postgres;

--
-- Name: ReceivingDetailSN_receiving_detail_sn_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ReceivingDetailSN_receiving_detail_sn_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ReceivingDetailSN_receiving_detail_sn_id_seq" OWNER TO postgres;

--
-- Name: ReceivingDetailSN_receiving_detail_sn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ReceivingDetailSN_receiving_detail_sn_id_seq" OWNED BY public."ReceivingDetailSN".receiving_detail_sn_id;


--
-- Name: ReceivingDetail_receiving_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ReceivingDetail_receiving_detail_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ReceivingDetail_receiving_detail_id_seq" OWNER TO postgres;

--
-- Name: ReceivingDetail_receiving_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ReceivingDetail_receiving_detail_id_seq" OWNED BY public."ReceivingDetail".receiving_detail_id;


--
-- Name: ReceivingHeader; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ReceivingHeader" (
    receiving_header_id bigint NOT NULL,
    date date NOT NULL,
    number character varying(100) NOT NULL,
    number_preix character varying(100) NOT NULL,
    counter integer,
    status character varying(100) NOT NULL,
    approval1_date date,
    approval1 bigint,
    note character varying(300) NOT NULL,
    location_id_id bigint NOT NULL,
    user_id_id integer NOT NULL,
    vendor_id_id bigint NOT NULL
);


ALTER TABLE public."ReceivingHeader" OWNER TO postgres;

--
-- Name: ReceivingHeader_receiving_header_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ReceivingHeader_receiving_header_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ReceivingHeader_receiving_header_id_seq" OWNER TO postgres;

--
-- Name: ReceivingHeader_receiving_header_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ReceivingHeader_receiving_header_id_seq" OWNED BY public."ReceivingHeader".receiving_header_id;


--
-- Name: RentalDetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RentalDetail" (
    rental_detail_id bigint NOT NULL,
    price character varying(200) NOT NULL,
    qty integer NOT NULL,
    discount_type character varying(100) NOT NULL,
    discount_method character varying(200) NOT NULL,
    discount character varying(200) NOT NULL,
    total character varying(200) NOT NULL,
    master_item_id_id bigint,
    order_detail_id_id bigint,
    rental_header_id_id bigint
);


ALTER TABLE public."RentalDetail" OWNER TO postgres;

--
-- Name: RentalDetail_rental_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RentalDetail_rental_detail_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RentalDetail_rental_detail_id_seq" OWNER TO postgres;

--
-- Name: RentalDetail_rental_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RentalDetail_rental_detail_id_seq" OWNED BY public."RentalDetail".rental_detail_id;


--
-- Name: RentalHeader; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RentalHeader" (
    rental_header_id bigint NOT NULL,
    date date NOT NULL,
    number character varying(100) NOT NULL,
    number_prefix character varying(100) NOT NULL,
    counter integer NOT NULL,
    discount_type integer,
    discount character varying(100) NOT NULL,
    tax character varying(200) NOT NULL,
    delivery_cost character varying(100) NOT NULL,
    amount character varying(100) NOT NULL,
    notes character varying(500) NOT NULL,
    salesman bigint,
    notes_kwitansi character varying(300) NOT NULL,
    status character varying(100) NOT NULL,
    rental_start_date date NOT NULL,
    rental_end_date date NOT NULL,
    approved_by bigint,
    approved_date date,
    pay_type integer NOT NULL,
    pay_method integer NOT NULL,
    note_kwitansi character varying(100) NOT NULL,
    customer_id_id bigint NOT NULL,
    location_id_id bigint NOT NULL,
    sales_order_id_id bigint,
    user_id_id integer
);


ALTER TABLE public."RentalHeader" OWNER TO postgres;

--
-- Name: RentalHeader_rental_header_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RentalHeader_rental_header_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RentalHeader_rental_header_id_seq" OWNER TO postgres;

--
-- Name: RentalHeader_rental_header_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RentalHeader_rental_header_id_seq" OWNED BY public."RentalHeader".rental_header_id;


--
-- Name: RentalOrderDetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RentalOrderDetail" (
    order_detail_id bigint NOT NULL,
    price character varying(200) NOT NULL,
    qty integer NOT NULL,
    discount_type character varying(100) NOT NULL,
    discount_method character varying(100) NOT NULL,
    discount character varying(200) NOT NULL,
    total character varying(200) NOT NULL,
    master_item_id_id bigint NOT NULL,
    sales_order_id_id bigint NOT NULL
);


ALTER TABLE public."RentalOrderDetail" OWNER TO postgres;

--
-- Name: RentalOrderDetail_order_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RentalOrderDetail_order_detail_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RentalOrderDetail_order_detail_id_seq" OWNER TO postgres;

--
-- Name: RentalOrderDetail_order_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RentalOrderDetail_order_detail_id_seq" OWNED BY public."RentalOrderDetail".order_detail_id;


--
-- Name: RentalOrderHeader; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RentalOrderHeader" (
    sales_order_id bigint NOT NULL,
    date date NOT NULL,
    number character varying(100) NOT NULL,
    number_prefix character varying(100) NOT NULL,
    counter integer NOT NULL,
    tax character varying(200) NOT NULL,
    discount_type integer,
    discount character varying(100) NOT NULL,
    delivery_fee character varying(100) NOT NULL,
    amount character varying(200) NOT NULL,
    notes_kwitansi character varying(300) NOT NULL,
    salesman bigint,
    status character varying(100) NOT NULL,
    rental_start_date date NOT NULL,
    rental_end_date date NOT NULL,
    notes character varying(500) NOT NULL,
    approved_by bigint,
    approved_date date,
    customer_id_id bigint NOT NULL,
    location_id_id bigint NOT NULL,
    user_id_id integer NOT NULL
);


ALTER TABLE public."RentalOrderHeader" OWNER TO postgres;

--
-- Name: RentalOrderHeader_sales_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RentalOrderHeader_sales_order_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RentalOrderHeader_sales_order_id_seq" OWNER TO postgres;

--
-- Name: RentalOrderHeader_sales_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RentalOrderHeader_sales_order_id_seq" OWNED BY public."RentalOrderHeader".sales_order_id;


--
-- Name: RentalStockCard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RentalStockCard" (
    stock_card_id bigint NOT NULL,
    item_master_id bigint NOT NULL,
    location_id bigint NOT NULL,
    qty integer NOT NULL,
    receiving_detail_id_id bigint,
    receiving_header_id_id bigint,
    rental_detail_id_id bigint,
    rental_header_id_id bigint
);


ALTER TABLE public."RentalStockCard" OWNER TO postgres;

--
-- Name: RentalStockCard_stock_card_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RentalStockCard_stock_card_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RentalStockCard_stock_card_id_seq" OWNER TO postgres;

--
-- Name: RentalStockCard_stock_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RentalStockCard_stock_card_id_seq" OWNED BY public."RentalStockCard".stock_card_id;


--
-- Name: RentalStockSN; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RentalStockSN" (
    stock_code_id bigint NOT NULL,
    first_sn character varying(100) NOT NULL,
    new_sn character varying(100) NOT NULL,
    status character varying(10) NOT NULL,
    receiving_detail_sn_id_id bigint,
    stock_card_id_id bigint
);


ALTER TABLE public."RentalStockSN" OWNER TO postgres;

--
-- Name: RentalStockSN_stock_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RentalStockSN_stock_code_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RentalStockSN_stock_code_id_seq" OWNER TO postgres;

--
-- Name: RentalStockSN_stock_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RentalStockSN_stock_code_id_seq" OWNED BY public."RentalStockSN".stock_code_id;


--
-- Name: StockSNHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."StockSNHistory" (
    stock_sn_history_id bigint NOT NULL,
    date date NOT NULL,
    status character varying(50) NOT NULL,
    "IncomingRef_id" bigint,
    "RentalRef_id_id" bigint,
    stock_code_id_id bigint
);


ALTER TABLE public."StockSNHistory" OWNER TO postgres;

--
-- Name: StockSNHistory_stock_sn_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."StockSNHistory_stock_sn_history_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."StockSNHistory_stock_sn_history_id_seq" OWNER TO postgres;

--
-- Name: StockSNHistory_stock_sn_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."StockSNHistory_stock_sn_history_id_seq" OWNED BY public."StockSNHistory".stock_sn_history_id;


--
-- Name: api_grouppermission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_grouppermission (
    id integer NOT NULL,
    group_name character varying(100),
    kategori character varying(100),
    jenis_akses character varying(255)
);


ALTER TABLE public.api_grouppermission OWNER TO postgres;

--
-- Name: api_grouppermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_grouppermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_grouppermission_id_seq OWNER TO postgres;

--
-- Name: api_grouppermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_grouppermission_id_seq OWNED BY public.api_grouppermission.id;


--
-- Name: api_rental_detail_sn; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_rental_detail_sn (
    rental_detail_sn_id bigint NOT NULL,
    rental_detail_id_id bigint,
    stock_code_id_id bigint
);


ALTER TABLE public.api_rental_detail_sn OWNER TO postgres;

--
-- Name: api_rental_detail_sn_rental_detail_sn_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_rental_detail_sn_rental_detail_sn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_rental_detail_sn_rental_detail_sn_id_seq OWNER TO postgres;

--
-- Name: api_rental_detail_sn_rental_detail_sn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_rental_detail_sn_rental_detail_sn_id_seq OWNED BY public.api_rental_detail_sn.rental_detail_sn_id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: InvoiceDetail invoice_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InvoiceDetail" ALTER COLUMN invoice_detail_id SET DEFAULT nextval('public."InvoiceDetail_invoice_detail_id_seq"'::regclass);


--
-- Name: InvoiceHeader invoice_header_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InvoiceHeader" ALTER COLUMN invoice_header_id SET DEFAULT nextval('public."InvoiceHeader_invoice_header_id_seq"'::regclass);


--
-- Name: MasterCustomer customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterCustomer" ALTER COLUMN customer_id SET DEFAULT nextval('public."MasterCustomer_customer_id_seq"'::regclass);


--
-- Name: MasterEmployee employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterEmployee" ALTER COLUMN employee_id SET DEFAULT nextval('public."MasterEmployee_employee_id_seq"'::regclass);


--
-- Name: MasterGroupItem group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterGroupItem" ALTER COLUMN group_id SET DEFAULT nextval('public."MasterGroupItem_group_id_seq"'::regclass);


--
-- Name: MasterItem master_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterItem" ALTER COLUMN master_item_id SET DEFAULT nextval('public."MasterItem_master_item_id_seq"'::regclass);


--
-- Name: MasterLokasi location_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterLokasi" ALTER COLUMN location_id SET DEFAULT nextval('public."MasterLokasi_location_id_seq"'::regclass);


--
-- Name: MasterMerk merk_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterMerk" ALTER COLUMN merk_id SET DEFAULT nextval('public."MasterMerk_merk_id_seq"'::regclass);


--
-- Name: MasterUOM uom_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterUOM" ALTER COLUMN uom_id SET DEFAULT nextval('public."MasterUOM_uom_id_seq"'::regclass);


--
-- Name: MasterUser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterUser" ALTER COLUMN id SET DEFAULT nextval('public."MasterUser_id_seq"'::regclass);


--
-- Name: MasterVendor vendor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterVendor" ALTER COLUMN vendor_id SET DEFAULT nextval('public."MasterVendor_vendor_id_seq"'::regclass);


--
-- Name: ReceivingDetail receiving_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReceivingDetail" ALTER COLUMN receiving_detail_id SET DEFAULT nextval('public."ReceivingDetail_receiving_detail_id_seq"'::regclass);


--
-- Name: ReceivingDetailSN receiving_detail_sn_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReceivingDetailSN" ALTER COLUMN receiving_detail_sn_id SET DEFAULT nextval('public."ReceivingDetailSN_receiving_detail_sn_id_seq"'::regclass);


--
-- Name: ReceivingHeader receiving_header_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReceivingHeader" ALTER COLUMN receiving_header_id SET DEFAULT nextval('public."ReceivingHeader_receiving_header_id_seq"'::regclass);


--
-- Name: RentalDetail rental_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalDetail" ALTER COLUMN rental_detail_id SET DEFAULT nextval('public."RentalDetail_rental_detail_id_seq"'::regclass);


--
-- Name: RentalHeader rental_header_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalHeader" ALTER COLUMN rental_header_id SET DEFAULT nextval('public."RentalHeader_rental_header_id_seq"'::regclass);


--
-- Name: RentalOrderDetail order_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalOrderDetail" ALTER COLUMN order_detail_id SET DEFAULT nextval('public."RentalOrderDetail_order_detail_id_seq"'::regclass);


--
-- Name: RentalOrderHeader sales_order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalOrderHeader" ALTER COLUMN sales_order_id SET DEFAULT nextval('public."RentalOrderHeader_sales_order_id_seq"'::regclass);


--
-- Name: RentalStockCard stock_card_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalStockCard" ALTER COLUMN stock_card_id SET DEFAULT nextval('public."RentalStockCard_stock_card_id_seq"'::regclass);


--
-- Name: RentalStockSN stock_code_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalStockSN" ALTER COLUMN stock_code_id SET DEFAULT nextval('public."RentalStockSN_stock_code_id_seq"'::regclass);


--
-- Name: StockSNHistory stock_sn_history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StockSNHistory" ALTER COLUMN stock_sn_history_id SET DEFAULT nextval('public."StockSNHistory_stock_sn_history_id_seq"'::regclass);


--
-- Name: api_grouppermission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_grouppermission ALTER COLUMN id SET DEFAULT nextval('public.api_grouppermission_id_seq'::regclass);


--
-- Name: api_rental_detail_sn rental_detail_sn_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_rental_detail_sn ALTER COLUMN rental_detail_sn_id SET DEFAULT nextval('public.api_rental_detail_sn_rental_detail_sn_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: InvoiceDetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."InvoiceDetail" (invoice_detail_id, date, type_payment, pay_amount, pay_method, noted, jml_period, period, harga_rental, invoice_header_id_id, master_item_id_id, user_id_id) FROM stdin;
\.


--
-- Data for Name: InvoiceHeader; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."InvoiceHeader" (invoice_header_id, date, amount, customer, pay_method, rental_header_id_id, status) FROM stdin;
53	2020-01-21	1000000	72	1	86	SEDANG BERJALAN
\.


--
-- Data for Name: MasterCustomer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MasterCustomer" (customer_id, customer_type, name, address, pos_code, phone_code, phone, fax_code, fax, mobile_phone, pic_name, pic_number) FROM stdin;
1	Rumah Sakit	RSPxxx punya pak akbar	Jl. Letjen M.T. Haryono No.Kav 11, RT.1/RW.6, Cawang, Kec. Kramat jati, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta, sebelah indomaret, gg buntu no 234X . masuk mobil dan motor. rumah pager ijo ada kucing oren	19748	0211	2524553453	021	7643745764	0828-4736-7367	bapak ignatius andrian	0819-3434-1679
3	Rumah Sakit	PT Medikaloka Husada / RS Hermina Depok	Jalan Siliwangi No.50, Depok, Pancoran MAS, Kota Depok, Jawa Barat 16436		0	0			0838-0658-4906	Rusmi	0838-0658-4906
4	Rumah Sakit	BMC Mayapada Hospital Bogor	Jl Pajajaran Indah V No.97 Baranangsiang Bogor Timur Kota Bogor		0	0			0857-1858-0676	Dian	0857-1858-0676
5	PT	PT Asih Eka Abadi	Jl Rambu No.17 RT 005/06, Cipete Selatan Cilandak Jaksel	0	0	0			0812-9571-300	Astrid	0812-9571-300
6	PT	PT Biometrik Riset Indonesia	Ruko Paramount Sparks A20/21 Jl. Bolevard Raya Gading Serpong Kelapa Dua		0	0878707642			0852-7050-7300	Carina	
7	Rumah Sakit	PT Medikaloka Bitung / RS Hermina Bitung	Jl Raya Serang KM 10 POS Bitung RT 001 RW 004 Kadu Curug Kab Tangerang Banten		0	0822982182				Jihan	
8	Rumah Sakit	PT Medikaloka Cileungsi / RS Hermina Mekarsari	Jl. Raya Cileungsi-Jonggol KM1 RT 004 / RW 004 Cileungsi Kidul Cileungsi Bogor Jawa Barat		0	0813870590				Louise	
9	Rumah Sakit	PT Medikaloka Galaxi / RS Hermina Galaxi	Jl Gardenia Raya Blok BA-1 No 11 Grand Galaxi City Bekasi 17147		0	0838076806				Neneng	
10	Rumah Sakit	PT Medikaloka Grand Bekasi / RS Hermina Grand Wisata	Jl Celebration Boulevard Grand Wisata Tambun Selatan Bekasi		0	0813189833				Ayu	
11	Rumah Sakit	PT Medikaloka Internusa / RS Hermina Kemayoran	Jl Selangit Komplek Kemayoran B-10 No. Kav. 4 Gunung Sahari Selatan Kemayoran Jakpus 10610		0	0896136416				Devi	
12	Rumah Sakit	PT Medikaloka Sukabumi	Jl Raya Sukaraja Sukabumi Rt03/03 Sukaraja Kab.Sukabumi		0	0812218184				Dr. Andre	
13	Rumah Sakit	RS Columbia Asia Pulomas	Jl Kayu Putih Raya No. 1 RW 16 Pulo Mas Barat V Jakarta Timur 13210		0	0813194975				Welianny	
14	Rumah Sakit	Rumah Sakit Haji Jakarta	Jl. Raya Pondok Gede No.4, Pinang Ranti, Makasar, RT.1/RW.1, Pinang Ranti, Makasar, Kota Jakarta Timur		0	0813141377			0815-9117-093	Yudi	
15	Personal	Arief Wicaksono	Simo Rukun 5/34 AA 005/004 Simomulya, Sukomanunggal surabaya		0	0812321173				Arif	
16	Personal	Bapak Anatolii Pysarevskyi/Nama Bayi Matvii Pysarevskyi	Apartemen Puri Casablanca D 06-05 Jl. Casablanca 1 JakSel		0	0878785634				Anatolii	
17	Personal	Bapak Birowo S	Diantar ke Sawah Lama, Ciputat, South Tangerang City, Banten 15413/ alamat rumah Jln Merpati Raya Sawah baru Ciputat Tangerang Selatan		0	0			0816-8090-92	Bapak Birowo S	0816-8090-92
18	Personal	Bapak Dani Adinugraha Nama Anak Agiska Keanna Rahajeng	Komp. PTB Duren Sawit Blok C 3/2 Rt 005/011 Klender		0	0			0811-9590-264	Bapak Dani Adinugraha	0811-9590-264
19	PT	Bapak Eki / Bapak Maskur PT.Fergaco Indonesia	Pondok Pinang Centre Blok C-24 Jl.Ciputat Raya Pondok Indah 12310		0	0878787671			0878-7876-71	Bapak Eki / Bapak Maskur	0878-7876-71
20	Personal	Bapak Felix Suryadi	Perum. Gading Serpong, Cluster Beryl Timur No. 37		0	0				Bapak Felix Suryadi	
21	Personal	Bapak Muhamad Ma'mun	Kebon Pala Rt 006/001 Kel. Kebon Pala Kec. Makasar Jakarta Timur		0	0812188224			0812-1882-2476	Bapak Muhamad Ma'mun	0812-1882-2476
22	Personal	Bapak Ocky Karuniadi	Jl Nusa Indah I Raya No.2 Rt 005/013 Malaka Jaya Kec. Duren Sawit / Komplek Depkes 3 Jalan Kesehatan 3 No. 62		0	0813825535			0813-8255-3545	Bapak Ocky Karuniadi	0813-8255-3545
23	PT	Bapak Ogi/ CV Momentum Kreasindo Untuk Bpk Dadan	Cimanggu Perikanan Darat Jl Ikan Mujair No.30 Bogor		0	0819776643			0819-7766-4333	Bapak Ogi	0819-7766-4333
24	Personal	Bapak Robby Pasien Dr Juice	Jl Teluk gong jalan V No. 114 A Rt 14 Rw 10		0	0895331782			0895-3317-82	Robby	0895-3317-82
25	Rumah Sakit	Bapak Sutopo / Koko RS Jatisampurna	Topo Design Indonesia Lingkungan palamanis Rt 2 Rw 5 Blok B No.63 Cirimekar Cibinong Bogor		0	0813825574			0813-8255-7444	Bapak Sutopo / Koko	0813-8255-7444
26	Personal	Bpk A Bong/ Dr Arie	Jl Angke indah 2 No.40 Rt 009/003 Belakang SDN Angke Belakang Rusun		0	0821668818			0821-6688-1898	Bpk A Bong/ Dr Arie	0821-6688-1898
27	Personal	Bpk Haryono	Komp Perum Duta Harapan, Jl Duta Graha V Blok E2 No 41 Bekasi		0	0819341623			0819-3416-23	Bpk Haryono	0819-3416-23
28	Personal	Bpk Wirah	Jl Pulomas Raya No.38 Rt10/11 Jakarta Timur 13210		0	0813183711			0813-1837-11	Bpk Wirah	0813-1837-11
29	Personal	Bpk Yoshika Mackmur Tampubolon/ Anak Miguello	Cluster Pesona Lareno Blok B No. 1 Jl. Busidin Rt 03/02 Kel. Mustika Sari  Kec. Mustika Jaya Bekasi Timur		0	0813159217			0813-1592-1767	Bpk Yoshika Mackmur Tampubolon/ Anak Miguello	0813-1592-1767
30	CV	CV Amanah Homecare/ Ibu Dessy	Komplek Taman Ratu Indah Blok  C4 No.18 Rt 004/013 Kel. Duri Kepa Kec. Kebon Jeruk JakBar		0	0831483044				Gista	
31	Personal	Dr Esty / Pak Tatang	Jl. Anggrek neli murni II Blok C No.64 Slipi Jakarta Barat		0	0811847811				Dr Esty	
32	Personal	Drg Dini	Jl H Marjuki Rt6/3 No.40 Kebun Jeruk Jakbar		0	0812808808				Drg Dini	
33	Personal	Erich Chandra Surya/ Dr. Damayanti	Diantar ke RS Hermina Jatinegara Lt. 3 Kamar 308		0	0811660393			0878-7708-0111	Ercih/Sherly	
34	Personal	Hafiz Pradana/ Pasien Hudzaifah	Kp. Pisangan RT 006/004, Penggilingan, Cakung, jakarta Timur		0	0857117346				Hafiz Pradana	
35	Personal	Ibu Ayu/ a.n Rendi Agustian	Vila Dago Tol Blok C26 No. 8 RT 005/011, Ciater, Serpong Tangsel		0	0812988972				Rendi	
36	Personal	Ibu Bertha Samantha Bayi Daniella	APT Sunter Icon Lt 8/810 Jl. Griya Sejahtera Rt 008/004 Sunter Agung Tanjung Priok		0	0898093686				Bertha	
37	Personal	Ibu Ester Karnadi, Ibu Irma/pasien dr juice	Jl Karang bolong 1 No.13 Ancol		0	0812871289				juice	
38	Personal	Ibu Fitri / RS Bunda Mulia	Jl. Raya Imam Bonjol No.80A, Sukadanau, Kec. Cikarang Bar., Bekasi, Jawa Barat 17530		0	0812947286				Lina	
39	Personal	Ibu Julueta Persada	Greenlake City Cluster Amerika Jl. Boulevard No.8 Duri Kosambi		0	0813861207				Julueta	
40	Personal	Ibu Liliana Arumasari	Jl Gelong Baru No.1 Rt 010/001 Grogol Petamburan		0	0813813782				Liliana	
41	Personal	Ibu Lisa Pasien Fadilah	Gedung Graha Irama Lt.10 unit C-D Jl.HR Rasuna Said kav.1-2 JakSel		0	0852964209				Lisa	
42	Personal	Ibu Livia	The Green Cluater Mirage Blok AB 6/10 Sebelah stasiun KA Rawa Buntu BSD		0	0819056369			0815-1942-9101	Livia/ Nia	
43	Personal	Ibu Lusiana Kusnadi/ Pasien Rayhan Saka Hilman	Rosella Residence No. 20 RT 2/21, Sukamaju, Cilodong Depok		0	0852822202				Lusiana	
44	Personal	Ibu Mila	Midtown Simatupang Residence, Tower 20, Lantai 7, Jl TB Simatupang Kav 20, Cilandak Barat		0	0812112606				Mila	
45	Personal	Ibu Nadia/ Pasien Filosofia Parama Azkania	The Icon BSD City Cluster Simplicity Blok A9 No. 8, Tangeran Banten		0	0811162121				Nadia	
46	Personal	Ibu Novi Kurniawati	Apartement Teluk Intan Saphire Lt. 7K Penjaringan Jakarta Utara		0	0813116189			0812-1597-1671	Novi/ Mami	
47	Personal	Ibu Nursetya Afiani	Jl. Manuhua II No.3-K Rt 001/014 Halim JakTim		0	0813882270				Nursetya Afiani	
48	Personal	Ibu Sri/Ely	Cut Mutia Bekasi		0	0813836945				Sri	
49	Personal	Ibu Tengku Nurul Chairunissa	Perum Tamansari persada raya blok 13 No.2 Jatibening Bekasi		0	0811812150				Nisa	
50	Personal	Ibu Theresia Asih Winanti	Jl Raya Kelapa Dua No.8 Rt 003/001 Kel. Kelapa Dua Kec. Kebon Jeruk		0	0816757631				Theresia	
51	Personal	Ibu Vicenni	Jl Angke indah 2 No.40 Rt 009/003 Belakang SDN Angke Belakang Rusun		0	0821100089				Vicenni	
52	Personal	Klinik Tiara Medical / Dr Salman	Jl pahlawan revolusi no 6. klender jak tim		0	0811806334				Dr Salman	
53	Personal	Lim Sutomo	Jl. Taruna gg 1 No. 10 Rt 4/3 Serdang Kemayoran JakPus		0	0811187737				Lim Sutomo	
54	Personal	Lisa Homecare 24	Gedung Graha Irama Lt.10 unit C-D Jl.HR Rasuna Said kav.1-2 JakSel		0	0852964209				Lisa	
55	Personal	Mohammad Iqbal	Komplek Polisi Militer Blok M-3 Jl.Raya ceger, Cipayung,Jakarta timur		0	0811887878				Mohammad Iqbal	
56	Rumah Sakit	PT Siloam International Hospital Tbk	Jl Gamisun Dalam No. 2-3 Kel Karet Semanggi Setiabudi		0	0822462454				Sary	
57	Personal	Muhammad Khamami	Komplek Bukit Cengkeh Satu, jalan Jakarta kav.7, kelurahan tugu kecamatan cimanggis, Kota depok		0	0812750146				Khamami	
58	Personal	Nia Holistic Homecare	-		0	0815194291				Nia	
59	PT	PT Cahaya Restu Pratama	Jl Raya Ngabean Boja Kel. Kendal Jawa Tengah		0	0813884741				Ari	
60	Rumah Sakit	PT Sumber Rizki Persada	Ruko Cyber Village Blok R 1/12, Cilodong, Depok		0	0819088330				Monica	
61	Rumah Sakit	RS Bhineka Bakti Husada	Jl. Pd. Cabe Raya No.17, Pd. Cabe Udik, Kec. Pamulang, Kota Tangerang Selatan, Banten 15418		0	0896758447				Dwi	
62	Personal	RS Eka Hospital/ a.n Rendi Agustian	RS Eka Hospital Delatinos cluster centro havana M6-7 BSD		0	0812988972				Rendi	
63	Personal	RS Graha Kedoya/ ibu dessy	Jalan Panjang Arteri No.26, RT.15/RW.7, Kedoya Utara, Kec. Kb. Jeruk, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11520		0	0811146657				Mey	
64	Rumah Sakit	RS Islam Pondok Kopi	Jl Pondok Kopi raya Rt 2 Rw 1 Pondok Kopi Kec. Duren Sawit Kota JakTim		0	0812199791			0895-2281-9654	Dewi/ Amrullah	
65	Rumah Sakit	RS Pelni Petamburan	Jl Aipda KS Tubun No. 92-94 Jakarta		0	0819088114				Ugi	
66	Rumah Sakit	RSIA Bunda Jakarta	Jl. Teuku Cik Ditiro No.28, RT.9/RW.2, Gondangdia, Kec. Menteng, Kota Jakarta Pusat		0	0812917249				Dontie	
67	Rumah Sakit	RSIA Evasari	Jl Rawamangun No. 47 Jakarta Pusat		0	0813148686				Rina	
68	Rumah Sakit	RSIA Graha Bandung	Jl. Terusan Jakarta No.15 - 17, Babakan Surabaya, Kec. Kiaracondong, Kota Bandung, Jawa Barat 40281		0	0822407309				Novita	
69	Rumah Sakit	Rumah Sakit Simpangan Depok	Jl Raya Bogor Km.36 Sukamaju Cilodong Depok 16414		0	0812190551				Lia	
70	Personal	Swiss-Belhotel Airport, Jakarta	Jl. Husein Sastra Negara Kav. I Bandara Soekarno-Hatta		0	0813160531				Iswahyudi	
71	Personal	Bapak Satia Salamat/ Ibu Sutini	Jl. Pinisi Indah 2 No. 7, RT 002/007, Kapuk Muara, Penjaringan, Jakarta Utara		0	0813101781				Satia	0813-1017-8178
72	Rumah Sakit	Rumah Sakit Harum Sisma Medika	Jl. S. Kalimalang Tarum Barat, RT.1/RW.13, Cipinang Melayu, Kec. Makasar, Kota Jakarta Timur		0	0897894867			0897-8948-672	Artha	
\.


--
-- Data for Name: MasterEmployee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MasterEmployee" (employee_id, name, address, id_type, id_number, employee_status, dob, phone_number) FROM stdin;
9	AdminPPM	PPM	KTP	747104140112222	Permanen	2019-10-01	0980-9747-2184
17	Sami	Surakarta	KTP	12345	Permanen	1991-12-28	1231-2412-3
19	Ami	-	SIM	9	Permanen	2020-01-03	0
\.


--
-- Data for Name: MasterGroupItem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MasterGroupItem" (group_id, code, name) FROM stdin;
3	PM	PATIENT MONITOR
5	AC	AUTOCLAVE
6	AU	AUDIOMETRY
7	ELECTRIK 3 CRANK	BED ELECTRIK 3 CRANK
8	BP	BIPAP
9	BB	BOX BAYI
10	BC	BUBLE CPAP
11	CT	CAUTER
12	CP	COMPRESSOR
13	CPP	CPAP
14	CTG	CTG
15	DB	DEFIBRILATOR
17	IC	INCUBATOR
18	IW	INFANT WARMER
19	IP	INFUS PUMP
20	KR	KURSI RODA
21	KRE	KURSI RODA ELECTRIK
22	BL	LAMPU BLUE LIGHT
23	MN	MANIKIN
24	MANUAL 1 CRANK	BED MANUAL 1 CRANK
25	MANUAL 2 CRANK	BED MANUAL 2 CRANK
27	NB	NEBULIZER
28	OC	OXYGEN CONCENTRATOR
4	AN	ANESTESI
29	PO	PLUS OXYMETER
30	PR	PRINTER USG
31	SM	SPIROMETRY
32	ST	STRECHER
33	SC	SUCTION
34	SP	SYRINGE PUMP
35	USG - P	USG PORTABLE
36	USG - M	USG MOBILE
37	USG	USG V3
38	VP	VENTILATOR PNEUMACARE
39	VM	VENTILATOR MEK
47	BL - YDE 500D	LAMPU OPERASI YDE 500D
26	MANUAL 3 CRANK	BED MANUAL 3 CRANK
1	AED	AED
16	ECG	ECG
\.


--
-- Data for Name: MasterItem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MasterItem" (master_item_id, code, counter, barcode, name, alias_name, price1, price2, price3, master_group_id_id, merk_id_id, uom_id_id, serial_number) FROM stdin;
1	AED	\N		AED HR-501	Automatic External Defibrilator	2000000			1	1	1	t
65	ECG	\N		ECG 3 CHANNEL		3000000			16	2	1	t
8	AED	\N	123	AED HR-503		2300000	800000		1	2	1	t
9	AM	\N		ANESTESI AM-831 (1 PAVO)	AM-831 (1)	10000000			4	3	1	t
10	AC	\N		AUTOCLAVE ESSTEL	AC ESSTEL	5000000			5	7	1	t
11	AU	\N		AUDIOMETRY HARMONIC - X3	AU HARMONIC - X3	5000000			6	9	1	t
14	BB	\N		BOX BAYI - HOSTECH	BB - HOSTECH	350000			9	3	1	t
15	BC	\N		BUBLE CPAP	BC - FISHER & PAYKEL	10000000			10	11	1	t
16	CT	\N		CAUTER - ZEUS	CT - ZEUS	5500000			11	8	1	t
17	CT	\N		CAUTER - HOSTECH	CT - HOSTECH	5000000			11	3	1	t
18	CP	\N		COMPRESSOR TAURUS	CP - TAURUS	5000000			12	12	1	t
19	CPP	\N		CPAP RESMED	CPP - RESMED	3500000			13	10	1	t
13	BP	\N		BIPAP - RESMED	BP - RESMED	6000000			8	10	1	t
20	CTG	\N		CTG HOSTECH	CTG - HOSTECH	5000000			14	3	1	t
21	CTG	\N		CTG BISTOS	CTG - BISTOS	5000000			14	13	1	t
22	DB	\N		DEFIBRILATOR DM 7000 - M&B	DB - M&B	5000000			15	5	1	t
23	IC	\N		INCUBATOR HOSTECH	IC - HOSTECH	5000000			17	3	1	t
24	IW	\N		INFANT WARMER - HOSTECH	IW - HOSTECH	5000000			18	3	1	t
25	IP	\N		INFUS PUMP TERUMO	IP - TERUMO	1500000			19	14	1	t
26	IP	\N		INFUS PUMP ENMIND	IP - ENMIND	1500000			19	15	1	t
29	KR	\N		KURSI RODA HOSTECH	KR MANUAL - HOSTECH	400000			20	3	1	t
30	KRE	\N		KURSI RODA ELECTRIK - KY140LA	KR ELECTRIK KY140LA - HOSTECH	2500000			21	3	1	t
31	BL	\N		LAMPU BLUE LIGHT - HOSTECH	BL - HOSTECH	3000000			22	3	1	t
32	BL - YDE 500D	\N		LAMPU OPERASI YDE 500D - HOSTECH	BL - YDE 500D HOSTECH	5000000			47	3	1	t
33	MANUAL 1 CRANK	\N		MANUAL BED 1 CRANK	MANUAL 1 CRANK - HOSTECH	1500000			24	3	1	t
34	MANUAL 2 CRANK	\N		MANUAL BED 2 CRANK	MANUAL 2 CRANK - HOSTECH	1500000			25	3	1	t
35	MANUAL 3 CRANK	\N		MANUAL BED 3 CRANK	MANUAL 3 CRANK	1800000			26	3	1	t
36	NB	\N		NEBULIZER OMRON	NB - OMRON	350000			27	17	1	t
37	OC	\N		OXYGEN CONCENTRATOR 5 L	OC - HOSTECH	2000000			28	3	1	t
38	OC	\N		OXYGEN CONCENTRATOR 10 L	OC - HOSTECH	2500000			28	3	1	t
39	PM	\N		PATIENT MONITOR PM 7000C	PM - ZONCARE	3000000			3	2	1	t
40	PO	\N		PLUS OXYMETER MP-110	PO MP-110 MEK	900000			29	4	1	t
41	PR	\N		PRINTER USG SONY	PR USG - SONY	1000000			30	18	1	t
42	SM	\N		SPIROMETRY MSA 99	SM MSA 99 - M&B	5000000			31	5	1	t
43	ST	\N		STRECHER HOSTECH	ST - HOSTECH	2500000			32	3	1	t
44	SC	\N		SUCTION MOBILE 2 TABUNG ASCO	SC - ASCO	1200000			33	19	1	t
45	SC	\N		SUCTION PORTABLE	SC - PORTABLE	750000			33	19	1	t
46	SP	\N		SYRINGE PUMP TERUMO	SP - TERUMO	1500000			34	14	1	t
47	SP	\N		SYRINGE PUMP ENMIND	SP - ENMIND	1500000			34	15	1	t
48	USG - P	\N		USG PORTABLE 2D i50	USG P 2D i50 - ZONCARE	3500000			35	2	1	t
49	USG - M	\N		USG MOBILE 4D Q7	USG M - ZONCARE	13000000			36	2	1	t
50	USG - M	\N		USG MOBILE 4D Q9	USG M - ZONCARE	16000000			36	2	1	t
51	USG - M	\N		USG MOBILE 4D Q3	USG - M	12000000			36	2	1	t
52	USG	\N		USG V3	USG V3 - ZONCARE	8000000			37	2	1	t
53	VP	\N		VENTILATOR PNEUMACARE HIJAU	VP HIJAU - MEK	16000000			38	4	1	t
54	VP	\N		VENTILATOR PNEUMACARE BIRU	VP BIRU - MEK	16000000			38	4	1	t
57	VM	\N		VENTILATOR SU:M3 HFO	VM SU:M3 - MEK	35000000			39	4	1	t
55	VM	\N		VENTILATOR SU:M2	VM SU:M2 - MEK	18000000			39	4	1	t
60	PM	\N		PATIENT MONITOR JR	PM EVAKUASI	3000000			3	20	1	t
59	PM	\N		PATIENT MONITOR GT	PM EVAKUASI	3000000			3	21	1	t
61	AU	\N		AUDIOMETRY	AU	5000000	2000000		6	22	1	t
12	ELECTRIK 3 CRANK	\N	0	BED ELECTRIK 3 CRANK	ELECTRIK 3 CRANK	2500000			7	3	1	t
62	USG - P	\N		USG 2D ZQ-6601		3500000			35	2	1	t
63	USG - P	\N		USG 2D ZQ-9902		5000000			35	2	1	t
64	USG - P	\N		USG Q9		16000000			35	2	1	t
66	ECG	\N		ECG 6 CHANNEL		4000000			16	2	1	t
67	ECG	\N		ECG 12 CHANNEL		16000000			16	2	1	t
68	ECG	\N		ECG 1 CHANNEL		2500000			16	2	1	t
69	PR	\N		PRINTER USG SONY UP-X898MD		1000000			30	18	1	t
\.


--
-- Data for Name: MasterLokasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MasterLokasi" (location_id, type, code, name) FROM stdin;
1	Head Office	HO001	HO RENTMED
\.


--
-- Data for Name: MasterMerk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MasterMerk" (merk_id, name) FROM stdin;
1	Heart Guardian
2	ZONCARE
3	HOSTECH
4	MEK
5	M&B
6	LABTECH
7	ESSTELL
8	ZEUS
9	HARMONIC
10	RESMED
11	FISHER & PAYKEL
12	TAURUS
13	BISTOS
14	TERUMO
15	ENMIND
17	OMRON
18	SONY
19	ASCO
20	JR
21	GT
22	INTERACOUSTIC
23	Ermua Spain
\.


--
-- Data for Name: MasterUOM; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MasterUOM" (uom_id, name) FROM stdin;
1	Unit
2	Pcs
3	Set
\.


--
-- Data for Name: MasterUser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MasterUser" (id, user_level, user_type, employee_id_id, user_id) FROM stdin;
24	Admin	user	19	22
12	CEO	user	9	12
26			\N	1
\.


--
-- Data for Name: MasterVendor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MasterVendor" (vendor_id, name, address) FROM stdin;
1	PT Permana Putra Mandiri	Taman Mini
\.


--
-- Data for Name: ReceivingDetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ReceivingDetail" (receiving_detail_id, qty, note, master_item_id_id, receiving_header_id_id, uom_id_id) FROM stdin;
89	1		69	55	1
52	12		55	46	1
48	5		55	45	1
53	2		24	47	1
54	4		14	47	1
55	1		31	47	1
56	2		15	47	1
57	1		29	47	1
58	1		40	47	1
59	1		17	47	1
60	2		49	47	1
61	2		51	47	1
62	1		48	47	1
63	2		41	47	1
64	1		42	47	1
65	1		45	47	1
66	1		39	48	1
67	1		60	48	1
68	1		59	48	1
69	1		61	49	1
70	3		54	50	1
71	3		53	51	1
72	1		12	52	1
73	8		1	53	1
74	2		8	53	1
75	3		18	53	1
76	8		23	53	1
77	1		24	53	1
78	2		25	53	1
79	1		31	53	1
80	2		45	53	1
81	1		52	53	1
82	1		55	53	1
83	3		38	53	1
84	2		37	53	1
85	2		26	53	1
86	1		62	54	1
87	1		63	54	1
88	1		55	54	1
\.


--
-- Data for Name: ReceivingDetailSN; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ReceivingDetailSN" (receiving_detail_sn_id, first_serial_number, new_serial_number, receiving_detail_id_id) FROM stdin;
185	MV2000QA1F0078		52
186	MV2000QQA1A0010		52
187	MV2000PA1A0063		52
188	MV2000RA1B0036		52
189	MV2000PA1F0064		52
190	MV2000MT12H0063		52
191	MV2000QA1F0077		52
192	MV2000PA1F0060		52
193	MV2000OA1E0071		52
194	MV2000NA1G0265		52
195	MV2000NA1J0374		52
196	MV2000QA1B0011		52
180	MV2000PA1F0060		48
181	MV2000QA1F0077		48
182	MV2000NA1J0374		48
183	MV2000NA1G0265		48
184	MV2000OA1E0071		48
197	V3/170101033		53
198	V3/150702019		53
199	-		54
200	-		54
201	-		54
202	-		54
203	181280484		55
204	SH180E201908008		56
205	61G17110035001		56
206	-		57
207	MP570TNA1A0045		58
229	D01218120159		73
230	D01219020128		73
231	D0216040017		73
208	B1812063		59
209	H812190506N0002		60
210	G7121903066N0015		60
211	CC0415001V1Q7B		61
212	B719406N0006		61
213	I911150105212N0002		62
214	UP-X898MD		63
215	UP-897MD		63
216	MSA601804008		64
217	-		65
218	D81216010SN0159		66
219	-		67
220	158494039		68
221	669770		69
222	MTVKSA1B0032		70
223	MTV1KQA110148		70
224	MTV100012J0140		70
225	MTV1KPA1B0094		71
226	MTV1KPA1B0091		71
227	MTV1KPA1B0089		71
228	-		72
232	D0216040024		73
233	D0218120105		73
234	D0218120565		73
235	D0219020106		73
236	D0219020142		73
237	D02118070027		74
238	D02218070028		74
239	THC13661		75
240	THC14817		75
241	THC14840		75
242	01150301036		76
243	01170203016		76
244	01170304028		76
245	01170403014		76
246	01170403017		76
247	171180400		76
248	1812280491		76
249	181280488		76
250	150304032		77
251	97070230		78
252	0610158		78
253	181280478		79
254	SU607		80
255	SU65		80
256	J51CW9303A017		81
257	MV2000QA1B0011		82
258	02		83
259	03		83
260	MZJ10506858		83
261	01		84
262	MZJ5585962		84
263	70161101017		85
264	70171125040		85
265	SC111301314V301BCE		86
266	151CW5102A067		87
267	MV2000RA1B0036		88
268	-		89
\.


--
-- Data for Name: ReceivingHeader; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ReceivingHeader" (receiving_header_id, date, number, number_preix, counter, status, approval1_date, approval1, note, location_id_id, user_id_id, vendor_id_id) FROM stdin;
43	2020-01-09	IN/0001/01/2020		1	DRAFT	2020-01-09	12		1	12	1
44	2020-01-09	IN/0002/01/2020		2	DRAFT	2020-01-09	12		1	12	1
46	2020-01-09	IN/0004/01/2020		4	APPROVED	2020-01-09	12		1	12	1
45	2020-01-09	IN/0003/01/2020		3	DRAFT	2020-01-09	12		1	12	1
47	2020-01-09	IN/0005/01/2020		5	APPROVED	2020-01-09	12		1	12	1
48	2020-01-09	IN/0006/01/2020		6	APPROVED	2020-01-13	12		1	12	1
49	2020-01-09	IN/0007/01/2020		7	APPROVED	2020-01-13	12		1	12	1
50	2020-01-09	IN/0008/01/2020		8	APPROVED	2020-01-13	12		1	12	1
51	2020-01-09	IN/0009/01/2020		9	APPROVED	2020-01-13	12		1	12	1
52	2020-01-15	IN/0010/01/2020		10	APPROVED	2020-01-15	12		1	12	1
53	2020-01-20	IN/0011/01/2020		11	APPROVED	2020-01-20	12		1	12	1
54	2020-01-20	IN/0012/01/2020		12	APPROVED	2020-01-21	12		1	12	1
55	2020-01-21	IN/0013/01/2020		13	APPROVED	2020-01-21	12		1	12	1
\.


--
-- Data for Name: RentalDetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RentalDetail" (rental_detail_id, price, qty, discount_type, discount_method, discount, total, master_item_id_id, order_detail_id_id, rental_header_id_id) FROM stdin;
88	18000000	1	2	1	12000000	6000000	55	\N	82
90	2500000	1				2500000	12	\N	84
91	18000000	1			0	18000000	55	\N	85
92	1000000	1			0	1000000	69	\N	86
93	2500000	1			0	2500000	12	\N	87
94	1600000	1			0	1600000	55	\N	88
\.


--
-- Data for Name: RentalHeader; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RentalHeader" (rental_header_id, date, number, number_prefix, counter, discount_type, discount, tax, delivery_cost, amount, notes, salesman, notes_kwitansi, status, rental_start_date, rental_end_date, approved_by, approved_date, pay_type, pay_method, note_kwitansi, customer_id_id, location_id_id, sales_order_id_id, user_id_id) FROM stdin;
82	2020-01-09	RN/0001/01/2020		1	\N	0	600000	0	6600000		\N	Enam Juta Rupiah	APPROVED	2020-01-09	2020-01-16	1	2020-01-09	2	1	Enam Juta Rupiah	3	1	\N	12
84	2020-01-15	RN/0002/01/2020		2	\N	0	0	0	2500000		\N	Dua Juta Lima Ratus Ribu Rupiah	APPROVED	2020-01-14	2020-02-13	1	2020-01-15	2	1	Dua Juta Lima Ratus Ribu Rupiah	71	1	\N	12
85	2020-01-21	RN/0003/01/2020		3	\N	0	0	0	18000000		\N	Delapan Belas Juta Rupiah	DRAFT	2020-01-18	2020-01-21	1	2020-01-21	2	1	Tiga Juta Seratus Lima Puluh Ribu Rupiah	7	1	\N	12
86	2020-01-21	RN/0004/01/2020		4	\N	0	100000	0	1100000		\N	Satu Juta Seratus Ribu Rupiah	DRAFT	2020-01-20	2020-02-19	1	2020-01-21	2	1	Satu Juta Rupiah	72	1	\N	12
87	2020-02-19	RN/0005/02/2020		5	\N	0	0	0	2500000	14 Feb 2020 - 14 Mar 2020	\N		DRAFT	2020-02-14	2020-03-13	1	2020-02-19	2	1	Perpanjang Sewa 1 Bulan 1 Unit Electric Bed Periode 14 Feb 2020 - 14 Mar 2020	71	1	\N	12
88	2020-02-19	RN/0006/02/2020		6	\N	0	0	0	1600000	Sewa 1 Hari 1 Unit Ventilator SU:M2 Bayi Periode 19 Feb 2020 - 20 Feb 2020	\N	Sewa 1 Hari 1 Unit Ventilator SU:M2 Bayi Periode 19 Feb 2020 - 20 Feb 2020	DRAFT	2020-02-19	2020-02-19	1	2020-02-19	2	1	Satu Juta Enam Ratus Ribu Rupiah	9	1	\N	12
\.


--
-- Data for Name: RentalOrderDetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RentalOrderDetail" (order_detail_id, price, qty, discount_type, discount_method, discount, total, master_item_id_id, sales_order_id_id) FROM stdin;
\.


--
-- Data for Name: RentalOrderHeader; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RentalOrderHeader" (sales_order_id, date, number, number_prefix, counter, tax, discount_type, discount, delivery_fee, amount, notes_kwitansi, salesman, status, rental_start_date, rental_end_date, notes, approved_by, approved_date, customer_id_id, location_id_id, user_id_id) FROM stdin;
\.


--
-- Data for Name: RentalStockCard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RentalStockCard" (stock_card_id, item_master_id, location_id, qty, receiving_detail_id_id, receiving_header_id_id, rental_detail_id_id, rental_header_id_id) FROM stdin;
36	55	1	12	52	46	\N	\N
37	24	1	2	53	47	\N	\N
38	14	1	4	54	47	\N	\N
39	31	1	1	55	47	\N	\N
40	15	1	2	56	47	\N	\N
41	29	1	1	57	47	\N	\N
42	40	1	1	58	47	\N	\N
43	17	1	1	59	47	\N	\N
44	49	1	2	60	47	\N	\N
45	51	1	2	61	47	\N	\N
46	48	1	1	62	47	\N	\N
47	41	1	2	63	47	\N	\N
48	42	1	1	64	47	\N	\N
49	45	1	1	65	47	\N	\N
50	39	1	1	66	48	\N	\N
51	60	1	1	67	48	\N	\N
52	59	1	1	68	48	\N	\N
53	61	1	1	69	49	\N	\N
54	54	1	3	70	50	\N	\N
55	53	1	3	71	51	\N	\N
56	12	1	1	72	52	\N	\N
57	1	1	8	73	53	\N	\N
58	8	1	2	74	53	\N	\N
59	18	1	3	75	53	\N	\N
60	23	1	8	76	53	\N	\N
61	24	1	1	77	53	\N	\N
62	25	1	2	78	53	\N	\N
63	31	1	1	79	53	\N	\N
64	45	1	2	80	53	\N	\N
65	52	1	1	81	53	\N	\N
66	55	1	1	82	53	\N	\N
67	38	1	3	83	53	\N	\N
68	37	1	2	84	53	\N	\N
69	26	1	2	85	53	\N	\N
70	62	1	1	86	54	\N	\N
71	63	1	1	87	54	\N	\N
72	55	1	1	88	54	\N	\N
73	69	1	1	89	55	\N	\N
\.


--
-- Data for Name: RentalStockSN; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RentalStockSN" (stock_code_id, first_sn, new_sn, status, receiving_detail_sn_id_id, stock_card_id_id) FROM stdin;
112	MV2000QA1F0078		MASUK	\N	36
113	MV2000QQA1A0010		MASUK	\N	36
114	MV2000PA1A0063		MASUK	\N	36
115	MV2000RA1B0036		MASUK	\N	36
116	MV2000PA1F0064		MASUK	\N	36
117	MV2000MT12H0063		MASUK	\N	36
123	MV2000QA1B0011		KELUAR	\N	36
124	V3/170101033		MASUK	\N	37
125	V3/150702019		MASUK	\N	37
126	-		MASUK	\N	38
127	-		MASUK	\N	38
128	-		MASUK	\N	38
129	-		MASUK	\N	38
130	181280484		MASUK	\N	39
131	SH180E201908008		MASUK	\N	40
132	61G17110035001		MASUK	\N	40
133	-		MASUK	\N	41
134	MP570TNA1A0045		MASUK	\N	42
135	B1812063		MASUK	\N	43
136	H812190506N0002		MASUK	\N	44
137	G7121903066N0015		MASUK	\N	44
138	CC0415001V1Q7B		MASUK	\N	45
139	B719406N0006		MASUK	\N	45
140	I911150105212N0002		MASUK	\N	46
141	UP-X898MD		MASUK	\N	47
142	UP-897MD		MASUK	\N	47
143	MSA601804008		MASUK	\N	48
144	-		MASUK	\N	49
120	MV2000OA1E0071		MASUK	\N	36
121	MV2000NA1G0265		MASUK	\N	36
122	MV2000NA1J0374		MASUK	\N	36
118	MV2000QA1F0077		MASUK	\N	36
119	MV2000PA1F0060		MASUK	\N	36
145	D81216010SN0159		MASUK	\N	50
146	-		MASUK	\N	51
147	158494039		MASUK	\N	52
148	669770		MASUK	\N	53
149	MTVKSA1B0032		MASUK	\N	54
150	MTV1KQA110148		MASUK	\N	54
151	MTV100012J0140		MASUK	\N	54
152	MTV1KPA1B0094		MASUK	\N	55
153	MTV1KPA1B0091		MASUK	\N	55
154	MTV1KPA1B0089		MASUK	\N	55
155	-		KELUAR	\N	56
156	D01218120159		MASUK	\N	57
157	D01219020128		MASUK	\N	57
158	D0216040017		MASUK	\N	57
159	D0216040024		MASUK	\N	57
160	D0218120105		MASUK	\N	57
161	D0218120565		MASUK	\N	57
162	D0219020106		MASUK	\N	57
163	D0219020142		MASUK	\N	57
164	D02118070027		MASUK	\N	58
165	D02218070028		MASUK	\N	58
166	THC13661		MASUK	\N	59
167	THC14817		MASUK	\N	59
168	THC14840		MASUK	\N	59
169	01150301036		MASUK	\N	60
170	01170203016		MASUK	\N	60
171	01170304028		MASUK	\N	60
172	01170403014		MASUK	\N	60
173	01170403017		MASUK	\N	60
174	171180400		MASUK	\N	60
175	1812280491		MASUK	\N	60
176	181280488		MASUK	\N	60
177	150304032		MASUK	\N	61
178	97070230		MASUK	\N	62
179	0610158		MASUK	\N	62
180	181280478		MASUK	\N	63
181	SU607		MASUK	\N	64
182	SU65		MASUK	\N	64
183	J51CW9303A017		MASUK	\N	65
184	MV2000QA1B0011		MASUK	\N	66
185	02		MASUK	\N	67
186	03		MASUK	\N	67
187	MZJ10506858		MASUK	\N	67
188	01		MASUK	\N	68
189	MZJ5585962		MASUK	\N	68
190	70161101017		MASUK	\N	69
191	70171125040		MASUK	\N	69
192	SC111301314V301BCE		MASUK	\N	70
193	151CW5102A067		MASUK	\N	71
194	MV2000RA1B0036		MASUK	\N	72
195	-		KELUAR	\N	73
\.


--
-- Data for Name: StockSNHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."StockSNHistory" (stock_sn_history_id, date, status, "IncomingRef_id", "RentalRef_id_id", stock_code_id_id) FROM stdin;
252	2020-01-06	MASUK	46	\N	112
253	2020-01-06	MASUK	46	\N	113
254	2020-01-06	MASUK	46	\N	114
255	2020-01-06	MASUK	46	\N	115
256	2020-01-06	MASUK	46	\N	116
257	2020-01-06	MASUK	46	\N	117
258	2020-01-06	MASUK	46	\N	118
259	2020-01-06	MASUK	46	\N	119
260	2020-01-06	MASUK	46	\N	120
261	2020-01-06	MASUK	46	\N	121
262	2020-01-06	MASUK	46	\N	122
263	2020-01-06	MASUK	46	\N	123
264	2020-01-09	KELUAR	\N	82	123
265	2020-01-06	MASUK	47	\N	124
266	2020-01-06	MASUK	47	\N	125
267	2020-01-06	MASUK	47	\N	126
268	2020-01-06	MASUK	47	\N	127
269	2020-01-06	MASUK	47	\N	128
270	2020-01-06	MASUK	47	\N	129
271	2020-01-06	MASUK	47	\N	130
272	2020-01-06	MASUK	47	\N	131
273	2020-01-06	MASUK	47	\N	132
274	2020-01-06	MASUK	47	\N	133
275	2020-01-06	MASUK	47	\N	134
276	2020-01-06	MASUK	47	\N	135
277	2020-01-06	MASUK	47	\N	136
278	2020-01-06	MASUK	47	\N	137
279	2020-01-06	MASUK	47	\N	138
280	2020-01-06	MASUK	47	\N	139
281	2020-01-06	MASUK	47	\N	140
282	2020-01-06	MASUK	47	\N	141
283	2020-01-06	MASUK	47	\N	142
284	2020-01-06	MASUK	47	\N	143
285	2020-01-06	MASUK	47	\N	144
291	2020-01-06	MASUK	48	\N	145
292	2020-01-06	MASUK	48	\N	146
293	2020-01-06	MASUK	48	\N	147
294	2020-01-06	MASUK	49	\N	148
295	2020-01-06	MASUK	50	\N	149
296	2020-01-06	MASUK	50	\N	150
297	2020-01-06	MASUK	50	\N	151
298	2020-01-06	MASUK	51	\N	152
299	2020-01-06	MASUK	51	\N	153
300	2020-01-06	MASUK	51	\N	154
301	2020-01-06	MASUK	52	\N	155
302	2020-01-15	KELUAR	\N	84	155
303	2020-01-06	MASUK	53	\N	156
304	2020-01-06	MASUK	53	\N	157
305	2020-01-06	MASUK	53	\N	158
306	2020-01-06	MASUK	53	\N	159
307	2020-01-06	MASUK	53	\N	160
308	2020-01-06	MASUK	53	\N	161
309	2020-01-06	MASUK	53	\N	162
310	2020-01-06	MASUK	53	\N	163
311	2020-01-06	MASUK	53	\N	164
312	2020-01-06	MASUK	53	\N	165
313	2020-01-06	MASUK	53	\N	166
314	2020-01-06	MASUK	53	\N	167
315	2020-01-06	MASUK	53	\N	168
316	2020-01-06	MASUK	53	\N	169
317	2020-01-06	MASUK	53	\N	170
318	2020-01-06	MASUK	53	\N	171
319	2020-01-06	MASUK	53	\N	172
320	2020-01-06	MASUK	53	\N	173
321	2020-01-06	MASUK	53	\N	174
322	2020-01-06	MASUK	53	\N	175
323	2020-01-06	MASUK	53	\N	176
324	2020-01-06	MASUK	53	\N	177
325	2020-01-06	MASUK	53	\N	178
326	2020-01-06	MASUK	53	\N	179
327	2020-01-06	MASUK	53	\N	180
328	2020-01-06	MASUK	53	\N	181
329	2020-01-06	MASUK	53	\N	182
330	2020-01-06	MASUK	53	\N	183
331	2020-01-06	MASUK	53	\N	184
332	2020-01-06	MASUK	53	\N	185
333	2020-01-06	MASUK	53	\N	186
334	2020-01-06	MASUK	53	\N	187
335	2020-01-06	MASUK	53	\N	188
336	2020-01-06	MASUK	53	\N	189
337	2020-01-06	MASUK	53	\N	190
338	2020-01-06	MASUK	53	\N	191
339	2020-01-21	MASUK	54	\N	192
340	2020-01-21	MASUK	54	\N	193
341	2020-01-21	MASUK	54	\N	194
342	2020-01-21	MASUK	55	\N	195
343	2020-01-21	KELUAR	\N	86	195
\.


--
-- Data for Name: api_grouppermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_grouppermission (id, group_name, kategori, jenis_akses) FROM stdin;
5	CEO	Manajemen Master	Hanya Lihat | Proses Data
6	CEO	Manajemen Pengguna	Hanya Lihat | Proses Data
7	CEO	Manajemen Inventori	Hanya Lihat | Proses Data | Menyetujui | Closing
8	CEO	Manajemen Kerja	Hanya Lihat | Proses Data | Menyetujui | Closing
9	Supervisor	Manajemen Master	Hanya Lihat | Proses Data
10	Supervisor	Manajemen Pengguna	Hanya Lihat | Proses Data
11	Supervisor	Manajemen Inventori	Hanya Lihat | Closing
12	Supervisor	Manajemen Kerja	Hanya Lihat | Closing
21	Magang	Manajemen Master	Hanya Lihat
22	Magang	Manajemen Pengguna	Hanya Lihat
23	Magang	Manajemen Inventori	Hanya Lihat
24	Magang	Manajemen Kerja	Hanya Lihat
29	Magangx	Manajemen Master	Hanya Lihat
30	Magangx	Manajemen Pengguna	Hanya Lihat
31	Magangx	Manajemen Inventori	Hanya Lihat
32	Magangx	Manajemen Kerja	Hanya Lihat
45	Admin	Manajemen Master	Hanya Lihat | Proses Data
46	Admin		
47	Admin	Manajemen Inventori	Hanya Lihat | Proses Data | Menyetujui
48	Admin	Manajemen Kerja	Hanya Lihat | Proses Data | Menyetujui
\.


--
-- Data for Name: api_rental_detail_sn; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_rental_detail_sn (rental_detail_sn_id, rental_detail_id_id, stock_code_id_id) FROM stdin;
140	88	123
157	90	155
158	91	115
159	92	195
160	94	115
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
13	CEO
14	Supervisor
12	Magangx
15	Admin
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add Token	7	add_token
20	Can change Token	7	change_token
21	Can delete Token	7	delete_token
22	Can add invoice_detail	8	add_invoice_detail
23	Can change invoice_detail	8	change_invoice_detail
24	Can delete invoice_detail	8	delete_invoice_detail
25	Can add invoice_header	9	add_invoice_header
26	Can change invoice_header	9	change_invoice_header
27	Can delete invoice_header	9	delete_invoice_header
28	Can add master_customer	10	add_master_customer
29	Can change master_customer	10	change_master_customer
30	Can delete master_customer	10	delete_master_customer
31	Can add master_employee	11	add_master_employee
32	Can change master_employee	11	change_master_employee
33	Can delete master_employee	11	delete_master_employee
34	Can add master_group_item	12	add_master_group_item
35	Can change master_group_item	12	change_master_group_item
36	Can delete master_group_item	12	delete_master_group_item
37	Can add master_item	13	add_master_item
38	Can change master_item	13	change_master_item
39	Can delete master_item	13	delete_master_item
40	Can add master_location	14	add_master_location
41	Can change master_location	14	change_master_location
42	Can delete master_location	14	delete_master_location
43	Can add master_merk	15	add_master_merk
44	Can change master_merk	15	change_master_merk
45	Can delete master_merk	15	delete_master_merk
46	Can add master_uom	16	add_master_uom
47	Can change master_uom	16	change_master_uom
48	Can delete master_uom	16	delete_master_uom
49	Can add master_user	17	add_master_user
50	Can change master_user	17	change_master_user
51	Can delete master_user	17	delete_master_user
52	Can add master_vendor	18	add_master_vendor
53	Can change master_vendor	18	change_master_vendor
54	Can delete master_vendor	18	delete_master_vendor
55	Can add receiving_detail	19	add_receiving_detail
56	Can change receiving_detail	19	change_receiving_detail
57	Can delete receiving_detail	19	delete_receiving_detail
58	Can add receiving_detail_sn	20	add_receiving_detail_sn
59	Can change receiving_detail_sn	20	change_receiving_detail_sn
60	Can delete receiving_detail_sn	20	delete_receiving_detail_sn
61	Can add receiving_header	21	add_receiving_header
62	Can change receiving_header	21	change_receiving_header
63	Can delete receiving_header	21	delete_receiving_header
64	Can add rental_detail	22	add_rental_detail
65	Can change rental_detail	22	change_rental_detail
66	Can delete rental_detail	22	delete_rental_detail
67	Can add rental_header	23	add_rental_header
68	Can change rental_header	23	change_rental_header
69	Can delete rental_header	23	delete_rental_header
70	Can add rental_order_detail	24	add_rental_order_detail
71	Can change rental_order_detail	24	change_rental_order_detail
72	Can delete rental_order_detail	24	delete_rental_order_detail
73	Can add rental_order_header	25	add_rental_order_header
74	Can change rental_order_header	25	change_rental_order_header
75	Can delete rental_order_header	25	delete_rental_order_header
76	Can add rental_stock_card	26	add_rental_stock_card
77	Can change rental_stock_card	26	change_rental_stock_card
78	Can delete rental_stock_card	26	delete_rental_stock_card
79	Can add rental_stock_sn	27	add_rental_stock_sn
80	Can change rental_stock_sn	27	change_rental_stock_sn
81	Can delete rental_stock_sn	27	delete_rental_stock_sn
82	Can add stock_sn_history	28	add_stock_sn_history
83	Can change stock_sn_history	28	change_stock_sn_history
84	Can delete stock_sn_history	28	delete_stock_sn_history
85	Can add group permission	29	add_grouppermission
86	Can change group permission	29	change_grouppermission
87	Can delete group permission	29	delete_grouppermission
88	Can add rental_detail_sn	30	add_rental_detail_sn
89	Can change rental_detail_sn	30	change_rental_detail_sn
90	Can delete rental_detail_sn	30	delete_rental_detail_sn
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
21	pbkdf2_sha256$100000$PMO4grRRl5UG$+488Pyyq5H9g6rnPhS0zV0cR9e42T4SkN3i+sVzhzZ0=	\N	f	tes				f	t	2020-01-09 05:07:22.557265+00
22	pbkdf2_sha256$100000$Gs0OG6SHVKSz$aT2qQ3ojwlFpfIce5J+rGK6HpRsh9wd9/f1BHDyOMts=	\N	f	ami				f	t	2020-01-09 05:09:39.896979+00
12	pbkdf2_sha256$100000$OyZQ0KuwcIEf$ni2VCc1ugxS/OabfYRmWCrMc4qOkYF0pYWjcVepEavg=	2020-01-31 04:29:20.482143+00	t	Adminppm				t	t	2019-10-24 04:12:16+00
1	pbkdf2_sha256$100000$xgNGlmKt0rnF$WhZ9IB4CrmiofnptGTZ7ahC5eH5FzFWXT1Fh7gfMvOw=	2019-10-20 02:39:58.436928+00	t	admin				t	t	2019-08-06 20:21:45.588109+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
55d6e221a732123f67006f20c83957392f1ab70d	2019-08-06 20:22:23.622408+00	1
f285efbd73b2f50ed106bd28f7e0cd1d34902822	2019-10-24 04:12:51.065035+00	12
a839fc0dbed1e103c8d146157057a450903174de	2020-01-09 06:03:31.523643+00	22
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
10	2019-10-24 06:22:56.833589+00	12	Adminppm	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	4	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	authtoken	token
8	api	invoice_detail
9	api	invoice_header
10	api	master_customer
11	api	master_employee
12	api	master_group_item
13	api	master_item
14	api	master_location
15	api	master_merk
16	api	master_uom
17	api	master_user
18	api	master_vendor
19	api	receiving_detail
20	api	receiving_detail_sn
21	api	receiving_header
22	api	rental_detail
23	api	rental_header
24	api	rental_order_detail
25	api	rental_order_header
26	api	rental_stock_card
27	api	rental_stock_sn
28	api	stock_sn_history
29	api	grouppermission
30	api	rental_detail_sn
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-08-06 18:30:18.224098+00
2	auth	0001_initial	2019-08-06 18:30:18.383186+00
3	admin	0001_initial	2019-08-06 18:30:18.440862+00
4	admin	0002_logentry_remove_auto_add	2019-08-06 18:30:18.460336+00
5	api	0001_initial	2019-08-06 18:30:20.703799+00
6	contenttypes	0002_remove_content_type_name	2019-08-06 18:30:20.829591+00
7	auth	0002_alter_permission_name_max_length	2019-08-06 18:30:20.849917+00
8	auth	0003_alter_user_email_max_length	2019-08-06 18:30:20.893467+00
9	auth	0004_alter_user_username_opts	2019-08-06 18:30:20.929221+00
10	auth	0005_alter_user_last_login_null	2019-08-06 18:30:20.968743+00
11	auth	0006_require_contenttypes_0002	2019-08-06 18:30:20.974337+00
12	auth	0007_alter_validators_add_error_messages	2019-08-06 18:30:21.022325+00
13	auth	0008_alter_user_username_max_length	2019-08-06 18:30:21.140856+00
14	auth	0009_alter_user_last_name_max_length	2019-08-06 18:30:21.184051+00
15	authtoken	0001_initial	2019-08-06 18:30:21.243611+00
16	authtoken	0002_auto_20160226_1747	2019-08-06 18:30:21.371051+00
17	sessions	0001_initial	2019-08-06 18:30:21.407556+00
18	api	0002_grouppermission	2019-10-22 01:54:12.141214+00
19	api	0003_rental_detail_sn	2019-10-26 14:18:17.460328+00
20	api	0004_rental_detail_sn_stock_code_id	2019-10-28 02:10:24.496915+00
21	api	0005_auto_20191030_0826	2019-10-30 08:26:57.842321+00
22	api	0006_auto_20191104_0109	2019-11-04 10:18:51.930666+00
23	api	0007_auto_20191112_0847	2019-11-12 08:47:27.943291+00
24	api	0008_auto_20200121_1011	2020-01-21 03:11:23.308385+00
25	api	0009_auto_20200127_0933	2020-01-27 02:33:16.945205+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
wusmdr4pizglwjbyjyf2orxo9hax6kxd	NmUyOWNhM2FkZGFhOTI1NjIwNjVmNmMzYzM5NDc5NzdiNjZmMzlhYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYmIyNzFkMTE2MzM3MjU3NzdlZDA2YTk0ZTcxNTI3MDcxNWY4MmVlIn0=	2019-11-02 12:52:40.692186+00
4ch0j86l74xsr6mgnzu46vbox69veqzj	OGY0N2M3MmI1MWI0MDc5OWVhNjQ5Y2EyYzUxNjQwZGNiMzY1NzQxNzp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjE0YjYyY2YwOTQ3NTE4ZjlkZWQ0MGIwMWI0NzNlNTIzYmQ3ZDI0ZiJ9	2019-12-02 07:54:11.865524+00
7ofj5wsh8mnxcgrkcvflmz0djhefgw58	OGY0N2M3MmI1MWI0MDc5OWVhNjQ5Y2EyYzUxNjQwZGNiMzY1NzQxNzp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjE0YjYyY2YwOTQ3NTE4ZjlkZWQ0MGIwMWI0NzNlNTIzYmQ3ZDI0ZiJ9	2019-12-03 22:19:37.644898+00
isktfgt36lg4nmkcsn0t9oundo7yzsgd	OGY0N2M3MmI1MWI0MDc5OWVhNjQ5Y2EyYzUxNjQwZGNiMzY1NzQxNzp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjE0YjYyY2YwOTQ3NTE4ZjlkZWQ0MGIwMWI0NzNlNTIzYmQ3ZDI0ZiJ9	2019-12-12 01:44:41.264114+00
te00vp93dmadkg5qfto1p2it5dziwssc	OGY0N2M3MmI1MWI0MDc5OWVhNjQ5Y2EyYzUxNjQwZGNiMzY1NzQxNzp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjE0YjYyY2YwOTQ3NTE4ZjlkZWQ0MGIwMWI0NzNlNTIzYmQ3ZDI0ZiJ9	2020-01-03 14:46:38.878322+00
f473nnu79lamx4f8rfrxgpcenpcst8dv	OGY0N2M3MmI1MWI0MDc5OWVhNjQ5Y2EyYzUxNjQwZGNiMzY1NzQxNzp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjE0YjYyY2YwOTQ3NTE4ZjlkZWQ0MGIwMWI0NzNlNTIzYmQ3ZDI0ZiJ9	2020-01-18 09:01:58.405788+00
jjxflkf7wz8nnt76f5md0l009sct7c0v	OGY0N2M3MmI1MWI0MDc5OWVhNjQ5Y2EyYzUxNjQwZGNiMzY1NzQxNzp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjE0YjYyY2YwOTQ3NTE4ZjlkZWQ0MGIwMWI0NzNlNTIzYmQ3ZDI0ZiJ9	2020-02-14 04:29:20.493079+00
\.


--
-- Name: InvoiceDetail_invoice_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."InvoiceDetail_invoice_detail_id_seq"', 37, true);


--
-- Name: InvoiceHeader_invoice_header_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."InvoiceHeader_invoice_header_id_seq"', 53, true);


--
-- Name: MasterCustomer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MasterCustomer_customer_id_seq"', 72, true);


--
-- Name: MasterEmployee_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MasterEmployee_employee_id_seq"', 20, true);


--
-- Name: MasterGroupItem_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MasterGroupItem_group_id_seq"', 48, true);


--
-- Name: MasterItem_master_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MasterItem_master_item_id_seq"', 69, true);


--
-- Name: MasterLokasi_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MasterLokasi_location_id_seq"', 2, true);


--
-- Name: MasterMerk_merk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MasterMerk_merk_id_seq"', 23, true);


--
-- Name: MasterUOM_uom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MasterUOM_uom_id_seq"', 3, true);


--
-- Name: MasterUser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MasterUser_id_seq"', 26, true);


--
-- Name: MasterVendor_vendor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MasterVendor_vendor_id_seq"', 2, true);


--
-- Name: ReceivingDetailSN_receiving_detail_sn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ReceivingDetailSN_receiving_detail_sn_id_seq"', 268, true);


--
-- Name: ReceivingDetail_receiving_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ReceivingDetail_receiving_detail_id_seq"', 89, true);


--
-- Name: ReceivingHeader_receiving_header_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ReceivingHeader_receiving_header_id_seq"', 55, true);


--
-- Name: RentalDetail_rental_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RentalDetail_rental_detail_id_seq"', 94, true);


--
-- Name: RentalHeader_rental_header_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RentalHeader_rental_header_id_seq"', 88, true);


--
-- Name: RentalOrderDetail_order_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RentalOrderDetail_order_detail_id_seq"', 16, true);


--
-- Name: RentalOrderHeader_sales_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RentalOrderHeader_sales_order_id_seq"', 12, true);


--
-- Name: RentalStockCard_stock_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RentalStockCard_stock_card_id_seq"', 73, true);


--
-- Name: RentalStockSN_stock_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RentalStockSN_stock_code_id_seq"', 195, true);


--
-- Name: StockSNHistory_stock_sn_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."StockSNHistory_stock_sn_history_id_seq"', 343, true);


--
-- Name: api_grouppermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_grouppermission_id_seq', 48, true);


--
-- Name: api_rental_detail_sn_rental_detail_sn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_rental_detail_sn_rental_detail_sn_id_seq', 160, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 15, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 90, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 22, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 13, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 30, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- Name: InvoiceDetail InvoiceDetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InvoiceDetail"
    ADD CONSTRAINT "InvoiceDetail_pkey" PRIMARY KEY (invoice_detail_id);


--
-- Name: InvoiceHeader InvoiceHeader_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InvoiceHeader"
    ADD CONSTRAINT "InvoiceHeader_pkey" PRIMARY KEY (invoice_header_id);


--
-- Name: MasterCustomer MasterCustomer_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterCustomer"
    ADD CONSTRAINT "MasterCustomer_name_key" UNIQUE (name);


--
-- Name: MasterCustomer MasterCustomer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterCustomer"
    ADD CONSTRAINT "MasterCustomer_pkey" PRIMARY KEY (customer_id);


--
-- Name: MasterEmployee MasterEmployee_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterEmployee"
    ADD CONSTRAINT "MasterEmployee_name_key" UNIQUE (name);


--
-- Name: MasterEmployee MasterEmployee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterEmployee"
    ADD CONSTRAINT "MasterEmployee_pkey" PRIMARY KEY (employee_id);


--
-- Name: MasterGroupItem MasterGroupItem_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterGroupItem"
    ADD CONSTRAINT "MasterGroupItem_code_key" UNIQUE (code);


--
-- Name: MasterGroupItem MasterGroupItem_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterGroupItem"
    ADD CONSTRAINT "MasterGroupItem_name_key" UNIQUE (name);


--
-- Name: MasterGroupItem MasterGroupItem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterGroupItem"
    ADD CONSTRAINT "MasterGroupItem_pkey" PRIMARY KEY (group_id);


--
-- Name: MasterItem MasterItem_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterItem"
    ADD CONSTRAINT "MasterItem_name_key" UNIQUE (name);


--
-- Name: MasterItem MasterItem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterItem"
    ADD CONSTRAINT "MasterItem_pkey" PRIMARY KEY (master_item_id);


--
-- Name: MasterLokasi MasterLokasi_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterLokasi"
    ADD CONSTRAINT "MasterLokasi_code_key" UNIQUE (code);


--
-- Name: MasterLokasi MasterLokasi_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterLokasi"
    ADD CONSTRAINT "MasterLokasi_name_key" UNIQUE (name);


--
-- Name: MasterLokasi MasterLokasi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterLokasi"
    ADD CONSTRAINT "MasterLokasi_pkey" PRIMARY KEY (location_id);


--
-- Name: MasterMerk MasterMerk_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterMerk"
    ADD CONSTRAINT "MasterMerk_name_key" UNIQUE (name);


--
-- Name: MasterMerk MasterMerk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterMerk"
    ADD CONSTRAINT "MasterMerk_pkey" PRIMARY KEY (merk_id);


--
-- Name: MasterUOM MasterUOM_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterUOM"
    ADD CONSTRAINT "MasterUOM_name_key" UNIQUE (name);


--
-- Name: MasterUOM MasterUOM_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterUOM"
    ADD CONSTRAINT "MasterUOM_pkey" PRIMARY KEY (uom_id);


--
-- Name: MasterUser MasterUser_employee_id_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterUser"
    ADD CONSTRAINT "MasterUser_employee_id_id_key" UNIQUE (employee_id_id);


--
-- Name: MasterUser MasterUser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterUser"
    ADD CONSTRAINT "MasterUser_pkey" PRIMARY KEY (id);


--
-- Name: MasterUser MasterUser_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterUser"
    ADD CONSTRAINT "MasterUser_user_id_key" UNIQUE (user_id);


--
-- Name: MasterVendor MasterVendor_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterVendor"
    ADD CONSTRAINT "MasterVendor_name_key" UNIQUE (name);


--
-- Name: MasterVendor MasterVendor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterVendor"
    ADD CONSTRAINT "MasterVendor_pkey" PRIMARY KEY (vendor_id);


--
-- Name: ReceivingDetailSN ReceivingDetailSN_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReceivingDetailSN"
    ADD CONSTRAINT "ReceivingDetailSN_pkey" PRIMARY KEY (receiving_detail_sn_id);


--
-- Name: ReceivingDetail ReceivingDetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReceivingDetail"
    ADD CONSTRAINT "ReceivingDetail_pkey" PRIMARY KEY (receiving_detail_id);


--
-- Name: ReceivingHeader ReceivingHeader_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReceivingHeader"
    ADD CONSTRAINT "ReceivingHeader_pkey" PRIMARY KEY (receiving_header_id);


--
-- Name: RentalDetail RentalDetail_order_detail_id_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalDetail"
    ADD CONSTRAINT "RentalDetail_order_detail_id_id_key" UNIQUE (order_detail_id_id);


--
-- Name: RentalDetail RentalDetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalDetail"
    ADD CONSTRAINT "RentalDetail_pkey" PRIMARY KEY (rental_detail_id);


--
-- Name: RentalHeader RentalHeader_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalHeader"
    ADD CONSTRAINT "RentalHeader_pkey" PRIMARY KEY (rental_header_id);


--
-- Name: RentalHeader RentalHeader_sales_order_id_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalHeader"
    ADD CONSTRAINT "RentalHeader_sales_order_id_id_key" UNIQUE (sales_order_id_id);


--
-- Name: RentalOrderDetail RentalOrderDetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalOrderDetail"
    ADD CONSTRAINT "RentalOrderDetail_pkey" PRIMARY KEY (order_detail_id);


--
-- Name: RentalOrderHeader RentalOrderHeader_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalOrderHeader"
    ADD CONSTRAINT "RentalOrderHeader_pkey" PRIMARY KEY (sales_order_id);


--
-- Name: RentalStockCard RentalStockCard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalStockCard"
    ADD CONSTRAINT "RentalStockCard_pkey" PRIMARY KEY (stock_card_id);


--
-- Name: RentalStockSN RentalStockSN_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalStockSN"
    ADD CONSTRAINT "RentalStockSN_pkey" PRIMARY KEY (stock_code_id);


--
-- Name: RentalStockSN RentalStockSN_receiving_detail_sn_id_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalStockSN"
    ADD CONSTRAINT "RentalStockSN_receiving_detail_sn_id_id_key" UNIQUE (receiving_detail_sn_id_id);


--
-- Name: StockSNHistory StockSNHistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StockSNHistory"
    ADD CONSTRAINT "StockSNHistory_pkey" PRIMARY KEY (stock_sn_history_id);


--
-- Name: api_grouppermission api_grouppermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_grouppermission
    ADD CONSTRAINT api_grouppermission_pkey PRIMARY KEY (id);


--
-- Name: api_rental_detail_sn api_rental_detail_sn_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_rental_detail_sn
    ADD CONSTRAINT api_rental_detail_sn_pkey PRIMARY KEY (rental_detail_sn_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: InvoiceDetail_invoice_header_id_id_2a7b6fec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "InvoiceDetail_invoice_header_id_id_2a7b6fec" ON public."InvoiceDetail" USING btree (invoice_header_id_id);


--
-- Name: InvoiceDetail_master_item_id_id_0afa9524; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "InvoiceDetail_master_item_id_id_0afa9524" ON public."InvoiceDetail" USING btree (master_item_id_id);


--
-- Name: InvoiceDetail_user_id_id_1e698a87; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "InvoiceDetail_user_id_id_1e698a87" ON public."InvoiceDetail" USING btree (user_id_id);


--
-- Name: InvoiceHeader_rental_header_id_id_14640721; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "InvoiceHeader_rental_header_id_id_14640721" ON public."InvoiceHeader" USING btree (rental_header_id_id);


--
-- Name: MasterCustomer_name_ceed6b4a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MasterCustomer_name_ceed6b4a_like" ON public."MasterCustomer" USING btree (name varchar_pattern_ops);


--
-- Name: MasterEmployee_name_62010e04_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MasterEmployee_name_62010e04_like" ON public."MasterEmployee" USING btree (name varchar_pattern_ops);


--
-- Name: MasterGroupItem_code_3ef35978_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MasterGroupItem_code_3ef35978_like" ON public."MasterGroupItem" USING btree (code varchar_pattern_ops);


--
-- Name: MasterGroupItem_name_c1ffa871_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MasterGroupItem_name_c1ffa871_like" ON public."MasterGroupItem" USING btree (name varchar_pattern_ops);


--
-- Name: MasterItem_master_group_id_id_ee5dc254; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MasterItem_master_group_id_id_ee5dc254" ON public."MasterItem" USING btree (master_group_id_id);


--
-- Name: MasterItem_merk_id_id_6cc75195; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MasterItem_merk_id_id_6cc75195" ON public."MasterItem" USING btree (merk_id_id);


--
-- Name: MasterItem_name_33b17ca5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MasterItem_name_33b17ca5_like" ON public."MasterItem" USING btree (name varchar_pattern_ops);


--
-- Name: MasterItem_uom_id_id_ea03dc57; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MasterItem_uom_id_id_ea03dc57" ON public."MasterItem" USING btree (uom_id_id);


--
-- Name: MasterLokasi_code_954c37f8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MasterLokasi_code_954c37f8_like" ON public."MasterLokasi" USING btree (code varchar_pattern_ops);


--
-- Name: MasterLokasi_name_4e2d16b7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MasterLokasi_name_4e2d16b7_like" ON public."MasterLokasi" USING btree (name varchar_pattern_ops);


--
-- Name: MasterMerk_name_840cf85b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MasterMerk_name_840cf85b_like" ON public."MasterMerk" USING btree (name varchar_pattern_ops);


--
-- Name: MasterUOM_name_64a7c342_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MasterUOM_name_64a7c342_like" ON public."MasterUOM" USING btree (name varchar_pattern_ops);


--
-- Name: MasterVendor_name_9f312288_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MasterVendor_name_9f312288_like" ON public."MasterVendor" USING btree (name varchar_pattern_ops);


--
-- Name: ReceivingDetailSN_receiving_detail_id_id_15bcd9d9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ReceivingDetailSN_receiving_detail_id_id_15bcd9d9" ON public."ReceivingDetailSN" USING btree (receiving_detail_id_id);


--
-- Name: ReceivingDetail_master_item_id_id_43a27bf8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ReceivingDetail_master_item_id_id_43a27bf8" ON public."ReceivingDetail" USING btree (master_item_id_id);


--
-- Name: ReceivingDetail_receiving_header_id_id_13251e20; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ReceivingDetail_receiving_header_id_id_13251e20" ON public."ReceivingDetail" USING btree (receiving_header_id_id);


--
-- Name: ReceivingDetail_uom_id_id_2182f019; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ReceivingDetail_uom_id_id_2182f019" ON public."ReceivingDetail" USING btree (uom_id_id);


--
-- Name: ReceivingHeader_location_id_id_058a430a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ReceivingHeader_location_id_id_058a430a" ON public."ReceivingHeader" USING btree (location_id_id);


--
-- Name: ReceivingHeader_user_id_id_2e42c5b5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ReceivingHeader_user_id_id_2e42c5b5" ON public."ReceivingHeader" USING btree (user_id_id);


--
-- Name: ReceivingHeader_vendor_id_id_071c0a14; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ReceivingHeader_vendor_id_id_071c0a14" ON public."ReceivingHeader" USING btree (vendor_id_id);


--
-- Name: RentalDetail_master_item_id_id_604165a5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RentalDetail_master_item_id_id_604165a5" ON public."RentalDetail" USING btree (master_item_id_id);


--
-- Name: RentalDetail_rental_header_id_id_f096f90f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RentalDetail_rental_header_id_id_f096f90f" ON public."RentalDetail" USING btree (rental_header_id_id);


--
-- Name: RentalHeader_customer_id_id_670f9d44; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RentalHeader_customer_id_id_670f9d44" ON public."RentalHeader" USING btree (customer_id_id);


--
-- Name: RentalHeader_location_id_id_5307829f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RentalHeader_location_id_id_5307829f" ON public."RentalHeader" USING btree (location_id_id);


--
-- Name: RentalHeader_user_id_id_ed85f58e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RentalHeader_user_id_id_ed85f58e" ON public."RentalHeader" USING btree (user_id_id);


--
-- Name: RentalOrderDetail_master_item_id_id_5262ae43; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RentalOrderDetail_master_item_id_id_5262ae43" ON public."RentalOrderDetail" USING btree (master_item_id_id);


--
-- Name: RentalOrderDetail_sales_order_id_id_94702d1f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RentalOrderDetail_sales_order_id_id_94702d1f" ON public."RentalOrderDetail" USING btree (sales_order_id_id);


--
-- Name: RentalOrderHeader_customer_id_id_bfec4faf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RentalOrderHeader_customer_id_id_bfec4faf" ON public."RentalOrderHeader" USING btree (customer_id_id);


--
-- Name: RentalOrderHeader_location_id_id_e1ff1464; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RentalOrderHeader_location_id_id_e1ff1464" ON public."RentalOrderHeader" USING btree (location_id_id);


--
-- Name: RentalOrderHeader_user_id_id_2586eb83; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RentalOrderHeader_user_id_id_2586eb83" ON public."RentalOrderHeader" USING btree (user_id_id);


--
-- Name: RentalStockCard_receiving_detail_id_id_a3a09248; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RentalStockCard_receiving_detail_id_id_a3a09248" ON public."RentalStockCard" USING btree (receiving_detail_id_id);


--
-- Name: RentalStockCard_receiving_header_id_id_5e951664; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RentalStockCard_receiving_header_id_id_5e951664" ON public."RentalStockCard" USING btree (receiving_header_id_id);


--
-- Name: RentalStockCard_rental_detail_id_id_58d13af5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RentalStockCard_rental_detail_id_id_58d13af5" ON public."RentalStockCard" USING btree (rental_detail_id_id);


--
-- Name: RentalStockCard_rental_header_id_id_bef28c3a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RentalStockCard_rental_header_id_id_bef28c3a" ON public."RentalStockCard" USING btree (rental_header_id_id);


--
-- Name: RentalStockSN_stock_card_id_id_6fa39970; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RentalStockSN_stock_card_id_id_6fa39970" ON public."RentalStockSN" USING btree (stock_card_id_id);


--
-- Name: StockSNHistory_RentalRef_id_id_f7ed64e7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "StockSNHistory_RentalRef_id_id_f7ed64e7" ON public."StockSNHistory" USING btree ("RentalRef_id_id");


--
-- Name: StockSNHistory_stock_code_id_id_1478f13f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "StockSNHistory_stock_code_id_id_1478f13f" ON public."StockSNHistory" USING btree (stock_code_id_id);


--
-- Name: api_rental_detail_sn_rental_detail_id_id_95305bb7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_rental_detail_sn_rental_detail_id_id_95305bb7 ON public.api_rental_detail_sn USING btree (rental_detail_id_id);


--
-- Name: api_rental_detail_sn_stock_code_id_id_8a84d26a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_rental_detail_sn_stock_code_id_id_8a84d26a ON public.api_rental_detail_sn USING btree (stock_code_id_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: InvoiceDetail InvoiceDetail_invoice_header_id_id_2a7b6fec_fk_InvoiceHe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InvoiceDetail"
    ADD CONSTRAINT "InvoiceDetail_invoice_header_id_id_2a7b6fec_fk_InvoiceHe" FOREIGN KEY (invoice_header_id_id) REFERENCES public."InvoiceHeader"(invoice_header_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: InvoiceDetail InvoiceDetail_master_item_id_id_0afa9524_fk_MasterIte; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InvoiceDetail"
    ADD CONSTRAINT "InvoiceDetail_master_item_id_id_0afa9524_fk_MasterIte" FOREIGN KEY (master_item_id_id) REFERENCES public."MasterItem"(master_item_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: InvoiceDetail InvoiceDetail_user_id_id_1e698a87_fk_MasterUser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InvoiceDetail"
    ADD CONSTRAINT "InvoiceDetail_user_id_id_1e698a87_fk_MasterUser_id" FOREIGN KEY (user_id_id) REFERENCES public."MasterUser"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: InvoiceHeader InvoiceHeader_rental_header_id_id_14640721_fk_RentalHea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InvoiceHeader"
    ADD CONSTRAINT "InvoiceHeader_rental_header_id_id_14640721_fk_RentalHea" FOREIGN KEY (rental_header_id_id) REFERENCES public."RentalHeader"(rental_header_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: MasterItem MasterItem_master_group_id_id_ee5dc254_fk_MasterGro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterItem"
    ADD CONSTRAINT "MasterItem_master_group_id_id_ee5dc254_fk_MasterGro" FOREIGN KEY (master_group_id_id) REFERENCES public."MasterGroupItem"(group_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: MasterItem MasterItem_merk_id_id_6cc75195_fk_MasterMerk_merk_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterItem"
    ADD CONSTRAINT "MasterItem_merk_id_id_6cc75195_fk_MasterMerk_merk_id" FOREIGN KEY (merk_id_id) REFERENCES public."MasterMerk"(merk_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: MasterItem MasterItem_uom_id_id_ea03dc57_fk_MasterUOM_uom_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterItem"
    ADD CONSTRAINT "MasterItem_uom_id_id_ea03dc57_fk_MasterUOM_uom_id" FOREIGN KEY (uom_id_id) REFERENCES public."MasterUOM"(uom_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: MasterUser MasterUser_employee_id_id_c01329c1_fk_MasterEmp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterUser"
    ADD CONSTRAINT "MasterUser_employee_id_id_c01329c1_fk_MasterEmp" FOREIGN KEY (employee_id_id) REFERENCES public."MasterEmployee"(employee_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: MasterUser MasterUser_user_id_bbf21857_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MasterUser"
    ADD CONSTRAINT "MasterUser_user_id_bbf21857_fk" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ReceivingDetailSN ReceivingDetailSN_receiving_detail_id__15bcd9d9_fk_Receiving; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReceivingDetailSN"
    ADD CONSTRAINT "ReceivingDetailSN_receiving_detail_id__15bcd9d9_fk_Receiving" FOREIGN KEY (receiving_detail_id_id) REFERENCES public."ReceivingDetail"(receiving_detail_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ReceivingDetail ReceivingDetail_master_item_id_id_43a27bf8_fk_MasterIte; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReceivingDetail"
    ADD CONSTRAINT "ReceivingDetail_master_item_id_id_43a27bf8_fk_MasterIte" FOREIGN KEY (master_item_id_id) REFERENCES public."MasterItem"(master_item_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ReceivingDetail ReceivingDetail_receiving_header_id__13251e20_fk_Receiving; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReceivingDetail"
    ADD CONSTRAINT "ReceivingDetail_receiving_header_id__13251e20_fk_Receiving" FOREIGN KEY (receiving_header_id_id) REFERENCES public."ReceivingHeader"(receiving_header_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ReceivingDetail ReceivingDetail_uom_id_id_2182f019_fk_MasterUOM_uom_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReceivingDetail"
    ADD CONSTRAINT "ReceivingDetail_uom_id_id_2182f019_fk_MasterUOM_uom_id" FOREIGN KEY (uom_id_id) REFERENCES public."MasterUOM"(uom_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ReceivingHeader ReceivingHeader_location_id_id_058a430a_fk_MasterLok; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReceivingHeader"
    ADD CONSTRAINT "ReceivingHeader_location_id_id_058a430a_fk_MasterLok" FOREIGN KEY (location_id_id) REFERENCES public."MasterLokasi"(location_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ReceivingHeader ReceivingHeader_user_id_id_2e42c5b5_fk_MasterUser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReceivingHeader"
    ADD CONSTRAINT "ReceivingHeader_user_id_id_2e42c5b5_fk_MasterUser_id" FOREIGN KEY (user_id_id) REFERENCES public."MasterUser"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ReceivingHeader ReceivingHeader_vendor_id_id_071c0a14_fk_MasterVendor_vendor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReceivingHeader"
    ADD CONSTRAINT "ReceivingHeader_vendor_id_id_071c0a14_fk_MasterVendor_vendor_id" FOREIGN KEY (vendor_id_id) REFERENCES public."MasterVendor"(vendor_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: RentalDetail RentalDetail_master_item_id_id_604165a5_fk_MasterIte; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalDetail"
    ADD CONSTRAINT "RentalDetail_master_item_id_id_604165a5_fk_MasterIte" FOREIGN KEY (master_item_id_id) REFERENCES public."MasterItem"(master_item_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: RentalDetail RentalDetail_order_detail_id_id_597d61a7_fk_RentalOrd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalDetail"
    ADD CONSTRAINT "RentalDetail_order_detail_id_id_597d61a7_fk_RentalOrd" FOREIGN KEY (order_detail_id_id) REFERENCES public."RentalOrderDetail"(order_detail_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: RentalDetail RentalDetail_rental_header_id_id_f096f90f_fk_RentalHea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalDetail"
    ADD CONSTRAINT "RentalDetail_rental_header_id_id_f096f90f_fk_RentalHea" FOREIGN KEY (rental_header_id_id) REFERENCES public."RentalHeader"(rental_header_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: RentalHeader RentalHeader_customer_id_id_670f9d44_fk_MasterCus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalHeader"
    ADD CONSTRAINT "RentalHeader_customer_id_id_670f9d44_fk_MasterCus" FOREIGN KEY (customer_id_id) REFERENCES public."MasterCustomer"(customer_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: RentalHeader RentalHeader_location_id_id_5307829f_fk_MasterLok; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalHeader"
    ADD CONSTRAINT "RentalHeader_location_id_id_5307829f_fk_MasterLok" FOREIGN KEY (location_id_id) REFERENCES public."MasterLokasi"(location_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: RentalHeader RentalHeader_sales_order_id_id_b18d3d33_fk_RentalOrd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalHeader"
    ADD CONSTRAINT "RentalHeader_sales_order_id_id_b18d3d33_fk_RentalOrd" FOREIGN KEY (sales_order_id_id) REFERENCES public."RentalOrderHeader"(sales_order_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: RentalHeader RentalHeader_user_id_id_ed85f58e_fk_MasterUser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalHeader"
    ADD CONSTRAINT "RentalHeader_user_id_id_ed85f58e_fk_MasterUser_id" FOREIGN KEY (user_id_id) REFERENCES public."MasterUser"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: RentalOrderDetail RentalOrderDetail_master_item_id_id_5262ae43_fk_MasterIte; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalOrderDetail"
    ADD CONSTRAINT "RentalOrderDetail_master_item_id_id_5262ae43_fk_MasterIte" FOREIGN KEY (master_item_id_id) REFERENCES public."MasterItem"(master_item_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: RentalOrderDetail RentalOrderDetail_sales_order_id_id_94702d1f_fk_RentalOrd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalOrderDetail"
    ADD CONSTRAINT "RentalOrderDetail_sales_order_id_id_94702d1f_fk_RentalOrd" FOREIGN KEY (sales_order_id_id) REFERENCES public."RentalOrderHeader"(sales_order_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: RentalOrderHeader RentalOrderHeader_customer_id_id_bfec4faf_fk_MasterCus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalOrderHeader"
    ADD CONSTRAINT "RentalOrderHeader_customer_id_id_bfec4faf_fk_MasterCus" FOREIGN KEY (customer_id_id) REFERENCES public."MasterCustomer"(customer_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: RentalOrderHeader RentalOrderHeader_location_id_id_e1ff1464_fk_MasterLok; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalOrderHeader"
    ADD CONSTRAINT "RentalOrderHeader_location_id_id_e1ff1464_fk_MasterLok" FOREIGN KEY (location_id_id) REFERENCES public."MasterLokasi"(location_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: RentalOrderHeader RentalOrderHeader_user_id_id_2586eb83_fk_MasterUser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalOrderHeader"
    ADD CONSTRAINT "RentalOrderHeader_user_id_id_2586eb83_fk_MasterUser_id" FOREIGN KEY (user_id_id) REFERENCES public."MasterUser"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: RentalStockCard RentalStockCard_receiving_detail_id__a3a09248_fk_Receiving; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalStockCard"
    ADD CONSTRAINT "RentalStockCard_receiving_detail_id__a3a09248_fk_Receiving" FOREIGN KEY (receiving_detail_id_id) REFERENCES public."ReceivingDetail"(receiving_detail_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: RentalStockCard RentalStockCard_receiving_header_id__5e951664_fk_Receiving; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalStockCard"
    ADD CONSTRAINT "RentalStockCard_receiving_header_id__5e951664_fk_Receiving" FOREIGN KEY (receiving_header_id_id) REFERENCES public."ReceivingHeader"(receiving_header_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: RentalStockCard RentalStockCard_rental_detail_id_id_58d13af5_fk_RentalDet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalStockCard"
    ADD CONSTRAINT "RentalStockCard_rental_detail_id_id_58d13af5_fk_RentalDet" FOREIGN KEY (rental_detail_id_id) REFERENCES public."RentalDetail"(rental_detail_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: RentalStockCard RentalStockCard_rental_header_id_id_bef28c3a_fk_RentalHea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalStockCard"
    ADD CONSTRAINT "RentalStockCard_rental_header_id_id_bef28c3a_fk_RentalHea" FOREIGN KEY (rental_header_id_id) REFERENCES public."RentalHeader"(rental_header_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: RentalStockSN RentalStockSN_receiving_detail_sn__37cf0545_fk_Receiving; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalStockSN"
    ADD CONSTRAINT "RentalStockSN_receiving_detail_sn__37cf0545_fk_Receiving" FOREIGN KEY (receiving_detail_sn_id_id) REFERENCES public."ReceivingDetailSN"(receiving_detail_sn_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: RentalStockSN RentalStockSN_stock_card_id_id_6fa39970_fk_RentalSto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RentalStockSN"
    ADD CONSTRAINT "RentalStockSN_stock_card_id_id_6fa39970_fk_RentalSto" FOREIGN KEY (stock_card_id_id) REFERENCES public."RentalStockCard"(stock_card_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: StockSNHistory StockSNHistory_RentalRef_id_id_f7ed64e7_fk_RentalHea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StockSNHistory"
    ADD CONSTRAINT "StockSNHistory_RentalRef_id_id_f7ed64e7_fk_RentalHea" FOREIGN KEY ("RentalRef_id_id") REFERENCES public."RentalHeader"(rental_header_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: StockSNHistory StockSNHistory_stock_code_id_id_1478f13f_fk_RentalSto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StockSNHistory"
    ADD CONSTRAINT "StockSNHistory_stock_code_id_id_1478f13f_fk_RentalSto" FOREIGN KEY (stock_code_id_id) REFERENCES public."RentalStockSN"(stock_code_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_rental_detail_sn api_rental_detail_sn_rental_detail_id_id_95305bb7_fk_RentalDet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_rental_detail_sn
    ADD CONSTRAINT "api_rental_detail_sn_rental_detail_id_id_95305bb7_fk_RentalDet" FOREIGN KEY (rental_detail_id_id) REFERENCES public."RentalDetail"(rental_detail_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_rental_detail_sn api_rental_detail_sn_stock_code_id_id_8a84d26a_fk_RentalSto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_rental_detail_sn
    ADD CONSTRAINT "api_rental_detail_sn_stock_code_id_id_8a84d26a_fk_RentalSto" FOREIGN KEY (stock_code_id_id) REFERENCES public."RentalStockSN"(stock_code_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

