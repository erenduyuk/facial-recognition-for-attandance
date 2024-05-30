--
-- PostgreSQL database cluster dump
--

-- Started on 2024-05-30 23:08:09 +03

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE admindb;
ALTER ROLE admindb WITH NOSUPERUSER INHERIT CREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md599c2627a633019d72c8b0f92cebd0dcc';
CREATE ROLE azure_pg_admin;
ALTER ROLE azure_pg_admin WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE azuresu;
ALTER ROLE azuresu WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE replication;
ALTER ROLE replication WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN REPLICATION NOBYPASSRLS;

--
-- User Configurations
--

--
-- User Config "azuresu"
--

ALTER ROLE azuresu SET search_path TO 'pg_catalog';


--
-- Role memberships
--

GRANT azure_pg_admin TO admindb WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_checkpoint TO azure_pg_admin WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_create_subscription TO azure_pg_admin WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_monitor TO azure_pg_admin WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_read_all_data TO azure_pg_admin WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_read_all_settings TO admindb WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_read_all_settings TO azure_pg_admin WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_read_all_stats TO admindb WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_read_all_stats TO azure_pg_admin WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_stat_scan_tables TO admindb WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_stat_scan_tables TO azure_pg_admin WITH ADMIN OPTION, INHERIT TRUE GRANTED BY azuresu;
GRANT pg_use_reserved_connections TO replication WITH INHERIT TRUE GRANTED BY azuresu;




--
-- Tablespaces
--

CREATE TABLESPACE temptblspace OWNER azure_pg_admin LOCATION '/mnt/pg_tmp';


--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.3

-- Started on 2024-05-30 23:08:11 +03

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

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: azure_pg_admin
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO azure_pg_admin;

--
-- TOC entry 3924 (class 0 OID 0)
-- Dependencies: 215
-- Name: FUNCTION pg_replication_origin_advance(text, pg_lsn); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_advance(text, pg_lsn) TO azure_pg_admin;


--
-- TOC entry 3925 (class 0 OID 0)
-- Dependencies: 228
-- Name: FUNCTION pg_replication_origin_create(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_create(text) TO azure_pg_admin;


--
-- TOC entry 3926 (class 0 OID 0)
-- Dependencies: 220
-- Name: FUNCTION pg_replication_origin_drop(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_drop(text) TO azure_pg_admin;


--
-- TOC entry 3927 (class 0 OID 0)
-- Dependencies: 221
-- Name: FUNCTION pg_replication_origin_oid(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_oid(text) TO azure_pg_admin;


--
-- TOC entry 3928 (class 0 OID 0)
-- Dependencies: 222
-- Name: FUNCTION pg_replication_origin_progress(text, boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_progress(text, boolean) TO azure_pg_admin;


--
-- TOC entry 3929 (class 0 OID 0)
-- Dependencies: 223
-- Name: FUNCTION pg_replication_origin_session_is_setup(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_is_setup() TO azure_pg_admin;


--
-- TOC entry 3930 (class 0 OID 0)
-- Dependencies: 224
-- Name: FUNCTION pg_replication_origin_session_progress(boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_progress(boolean) TO azure_pg_admin;


--
-- TOC entry 3931 (class 0 OID 0)
-- Dependencies: 229
-- Name: FUNCTION pg_replication_origin_session_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_reset() TO azure_pg_admin;


--
-- TOC entry 3932 (class 0 OID 0)
-- Dependencies: 225
-- Name: FUNCTION pg_replication_origin_session_setup(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_setup(text) TO azure_pg_admin;


--
-- TOC entry 3933 (class 0 OID 0)
-- Dependencies: 226
-- Name: FUNCTION pg_replication_origin_xact_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_reset() TO azure_pg_admin;


--
-- TOC entry 3934 (class 0 OID 0)
-- Dependencies: 227
-- Name: FUNCTION pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone) TO azure_pg_admin;


--
-- TOC entry 3935 (class 0 OID 0)
-- Dependencies: 230
-- Name: FUNCTION pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn) TO azure_pg_admin;


--
-- TOC entry 3936 (class 0 OID 0)
-- Dependencies: 216
-- Name: FUNCTION pg_stat_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset() TO azure_pg_admin;


--
-- TOC entry 3937 (class 0 OID 0)
-- Dependencies: 217
-- Name: FUNCTION pg_stat_reset_shared(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_shared(text) TO azure_pg_admin;


--
-- TOC entry 3938 (class 0 OID 0)
-- Dependencies: 219
-- Name: FUNCTION pg_stat_reset_single_function_counters(oid); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_function_counters(oid) TO azure_pg_admin;


--
-- TOC entry 3939 (class 0 OID 0)
-- Dependencies: 218
-- Name: FUNCTION pg_stat_reset_single_table_counters(oid); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_table_counters(oid) TO azure_pg_admin;


--
-- TOC entry 3940 (class 0 OID 0)
-- Dependencies: 98
-- Name: COLUMN pg_config.name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(name) ON TABLE pg_catalog.pg_config TO azure_pg_admin;


--
-- TOC entry 3941 (class 0 OID 0)
-- Dependencies: 98
-- Name: COLUMN pg_config.setting; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(setting) ON TABLE pg_catalog.pg_config TO azure_pg_admin;


--
-- TOC entry 3942 (class 0 OID 0)
-- Dependencies: 94
-- Name: COLUMN pg_hba_file_rules.line_number; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(line_number) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 3943 (class 0 OID 0)
-- Dependencies: 94
-- Name: COLUMN pg_hba_file_rules.type; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(type) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 3944 (class 0 OID 0)
-- Dependencies: 94
-- Name: COLUMN pg_hba_file_rules.database; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(database) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 3945 (class 0 OID 0)
-- Dependencies: 94
-- Name: COLUMN pg_hba_file_rules.user_name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(user_name) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 3946 (class 0 OID 0)
-- Dependencies: 94
-- Name: COLUMN pg_hba_file_rules.address; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(address) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 3947 (class 0 OID 0)
-- Dependencies: 94
-- Name: COLUMN pg_hba_file_rules.netmask; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(netmask) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 3948 (class 0 OID 0)
-- Dependencies: 94
-- Name: COLUMN pg_hba_file_rules.auth_method; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(auth_method) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 3949 (class 0 OID 0)
-- Dependencies: 94
-- Name: COLUMN pg_hba_file_rules.options; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(options) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 3950 (class 0 OID 0)
-- Dependencies: 94
-- Name: COLUMN pg_hba_file_rules.error; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(error) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 3951 (class 0 OID 0)
-- Dependencies: 144
-- Name: COLUMN pg_replication_origin_status.local_id; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(local_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 3952 (class 0 OID 0)
-- Dependencies: 144
-- Name: COLUMN pg_replication_origin_status.external_id; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(external_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 3953 (class 0 OID 0)
-- Dependencies: 144
-- Name: COLUMN pg_replication_origin_status.remote_lsn; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(remote_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 3954 (class 0 OID 0)
-- Dependencies: 144
-- Name: COLUMN pg_replication_origin_status.local_lsn; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(local_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 3955 (class 0 OID 0)
-- Dependencies: 99
-- Name: COLUMN pg_shmem_allocations.name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(name) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 3956 (class 0 OID 0)
-- Dependencies: 99
-- Name: COLUMN pg_shmem_allocations.off; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(off) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 3957 (class 0 OID 0)
-- Dependencies: 99
-- Name: COLUMN pg_shmem_allocations.size; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 3958 (class 0 OID 0)
-- Dependencies: 99
-- Name: COLUMN pg_shmem_allocations.allocated_size; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(allocated_size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 3959 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.starelid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(starelid) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3960 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.staattnum; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staattnum) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3961 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stainherit; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stainherit) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3962 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stanullfrac; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanullfrac) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3963 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stawidth; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stawidth) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3964 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stadistinct; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stadistinct) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3965 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stakind1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3966 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stakind2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3967 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stakind3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3968 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stakind4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3969 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stakind5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3970 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.staop1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3971 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.staop2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3972 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.staop3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3973 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.staop4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3974 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.staop5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3975 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stacoll1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3976 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stacoll2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3977 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stacoll3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3978 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stacoll4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3979 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stacoll5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3980 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stanumbers1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3981 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stanumbers2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3982 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stanumbers3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3983 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stanumbers4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3984 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stanumbers5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3985 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stavalues1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3986 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stavalues2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3987 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stavalues3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3988 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stavalues4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3989 (class 0 OID 0)
-- Dependencies: 39
-- Name: COLUMN pg_statistic.stavalues5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 3990 (class 0 OID 0)
-- Dependencies: 64
-- Name: COLUMN pg_subscription.oid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(oid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 3991 (class 0 OID 0)
-- Dependencies: 64
-- Name: COLUMN pg_subscription.subdbid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subdbid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 3992 (class 0 OID 0)
-- Dependencies: 64
-- Name: COLUMN pg_subscription.subname; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 3993 (class 0 OID 0)
-- Dependencies: 64
-- Name: COLUMN pg_subscription.subowner; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subowner) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 3994 (class 0 OID 0)
-- Dependencies: 64
-- Name: COLUMN pg_subscription.subenabled; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subenabled) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 3995 (class 0 OID 0)
-- Dependencies: 64
-- Name: COLUMN pg_subscription.subconninfo; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subconninfo) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 3996 (class 0 OID 0)
-- Dependencies: 64
-- Name: COLUMN pg_subscription.subslotname; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subslotname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 3997 (class 0 OID 0)
-- Dependencies: 64
-- Name: COLUMN pg_subscription.subsynccommit; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subsynccommit) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 3998 (class 0 OID 0)
-- Dependencies: 64
-- Name: COLUMN pg_subscription.subpublications; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subpublications) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


-- Completed on 2024-05-30 23:08:23 +03

--
-- PostgreSQL database dump complete
--

--
-- Database "azure_maintenance" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.3

-- Started on 2024-05-30 23:08:23 +03

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

--
-- TOC entry 3920 (class 1262 OID 16384)
-- Name: azure_maintenance; Type: DATABASE; Schema: -; Owner: azuresu
--

CREATE DATABASE azure_maintenance WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE azure_maintenance OWNER TO azuresu;

\connect azure_maintenance

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

--
-- TOC entry 2 (class 3079 OID 32769)
-- Name: pg_availability; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_availability WITH SCHEMA pg_catalog;


--
-- TOC entry 3921 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pg_availability; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_availability IS 'pg_availability - availability and monitoring extension for PostgreSQL service';


--
-- TOC entry 3922 (class 0 OID 0)
-- Dependencies: 219
-- Name: FUNCTION pg_ls_dir(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_ls_dir(text) TO replication;


--
-- TOC entry 3923 (class 0 OID 0)
-- Dependencies: 220
-- Name: FUNCTION pg_ls_dir(text, boolean, boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_ls_dir(text, boolean, boolean) TO replication;


--
-- TOC entry 3924 (class 0 OID 0)
-- Dependencies: 222
-- Name: FUNCTION pg_read_binary_file(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_read_binary_file(text) TO replication;


--
-- TOC entry 3925 (class 0 OID 0)
-- Dependencies: 223
-- Name: FUNCTION pg_read_binary_file(text, bigint, bigint); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_read_binary_file(text, bigint, bigint) TO replication;


--
-- TOC entry 3926 (class 0 OID 0)
-- Dependencies: 218
-- Name: FUNCTION pg_read_binary_file(text, bigint, bigint, boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_read_binary_file(text, bigint, bigint, boolean) TO replication;


--
-- TOC entry 3927 (class 0 OID 0)
-- Dependencies: 221
-- Name: FUNCTION pg_stat_file(filename text, OUT size bigint, OUT access timestamp with time zone, OUT modification timestamp with time zone, OUT change timestamp with time zone, OUT creation timestamp with time zone, OUT isdir boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_file(filename text, OUT size bigint, OUT access timestamp with time zone, OUT modification timestamp with time zone, OUT change timestamp with time zone, OUT creation timestamp with time zone, OUT isdir boolean) TO replication;


--
-- TOC entry 3928 (class 0 OID 0)
-- Dependencies: 217
-- Name: FUNCTION pg_stat_file(filename text, missing_ok boolean, OUT size bigint, OUT access timestamp with time zone, OUT modification timestamp with time zone, OUT change timestamp with time zone, OUT creation timestamp with time zone, OUT isdir boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_file(filename text, missing_ok boolean, OUT size bigint, OUT access timestamp with time zone, OUT modification timestamp with time zone, OUT change timestamp with time zone, OUT creation timestamp with time zone, OUT isdir boolean) TO replication;


-- Completed on 2024-05-30 23:08:34 +03

--
-- PostgreSQL database dump complete
--

--
-- Database "azure_sys" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.3

-- Started on 2024-05-30 23:08:34 +03

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

--
-- TOC entry 4078 (class 1262 OID 32777)
-- Name: azure_sys; Type: DATABASE; Schema: -; Owner: azuresu
--

CREATE DATABASE azure_sys WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE azure_sys OWNER TO azuresu;

\connect azure_sys

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

--
-- TOC entry 10 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: azure_pg_admin
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO azure_pg_admin;

--
-- TOC entry 6 (class 3079 OID 32800)
-- Name: pg_qs; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_qs WITH SCHEMA public;


--
-- TOC entry 4079 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION pg_qs; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_qs IS 'Query Store';


--
-- TOC entry 4 (class 3079 OID 32956)
-- Name: pgms_stats; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgms_stats WITH SCHEMA public;


--
-- TOC entry 4080 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION pgms_stats; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgms_stats IS 'PG Microsoft Stats';


--
-- TOC entry 5 (class 3079 OID 32964)
-- Name: azure; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS azure WITH SCHEMA public;


--
-- TOC entry 4081 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION azure; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION azure IS 'azure extension for PostgreSQL service';


--
-- TOC entry 3 (class 3079 OID 32799)
-- Name: pgms_wait_sampling; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgms_wait_sampling WITH SCHEMA public;


--
-- TOC entry 4082 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION pgms_wait_sampling; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgms_wait_sampling IS 'PG Microsoft Wait Sampling';


--
-- TOC entry 2 (class 3079 OID 32778)
-- Name: tablefunc; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;


--
-- TOC entry 4083 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION tablefunc; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';


--
-- TOC entry 4084 (class 0 OID 0)
-- Dependencies: 254
-- Name: FUNCTION pg_replication_origin_advance(text, pg_lsn); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_advance(text, pg_lsn) TO azure_pg_admin;


--
-- TOC entry 4085 (class 0 OID 0)
-- Dependencies: 282
-- Name: FUNCTION pg_replication_origin_create(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_create(text) TO azure_pg_admin;


--
-- TOC entry 4086 (class 0 OID 0)
-- Dependencies: 273
-- Name: FUNCTION pg_replication_origin_drop(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_drop(text) TO azure_pg_admin;


--
-- TOC entry 4087 (class 0 OID 0)
-- Dependencies: 274
-- Name: FUNCTION pg_replication_origin_oid(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_oid(text) TO azure_pg_admin;


--
-- TOC entry 4088 (class 0 OID 0)
-- Dependencies: 275
-- Name: FUNCTION pg_replication_origin_progress(text, boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_progress(text, boolean) TO azure_pg_admin;


--
-- TOC entry 4089 (class 0 OID 0)
-- Dependencies: 276
-- Name: FUNCTION pg_replication_origin_session_is_setup(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_is_setup() TO azure_pg_admin;


--
-- TOC entry 4090 (class 0 OID 0)
-- Dependencies: 277
-- Name: FUNCTION pg_replication_origin_session_progress(boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_progress(boolean) TO azure_pg_admin;


--
-- TOC entry 4091 (class 0 OID 0)
-- Dependencies: 283
-- Name: FUNCTION pg_replication_origin_session_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_reset() TO azure_pg_admin;


--
-- TOC entry 4092 (class 0 OID 0)
-- Dependencies: 278
-- Name: FUNCTION pg_replication_origin_session_setup(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_setup(text) TO azure_pg_admin;


--
-- TOC entry 4093 (class 0 OID 0)
-- Dependencies: 279
-- Name: FUNCTION pg_replication_origin_xact_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_reset() TO azure_pg_admin;


--
-- TOC entry 4094 (class 0 OID 0)
-- Dependencies: 280
-- Name: FUNCTION pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone) TO azure_pg_admin;


--
-- TOC entry 4095 (class 0 OID 0)
-- Dependencies: 284
-- Name: FUNCTION pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn) TO azure_pg_admin;


--
-- TOC entry 4096 (class 0 OID 0)
-- Dependencies: 255
-- Name: FUNCTION pg_stat_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset() TO azure_pg_admin;


--
-- TOC entry 4097 (class 0 OID 0)
-- Dependencies: 256
-- Name: FUNCTION pg_stat_reset_shared(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_shared(text) TO azure_pg_admin;


--
-- TOC entry 4098 (class 0 OID 0)
-- Dependencies: 268
-- Name: FUNCTION pg_stat_reset_single_function_counters(oid); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_function_counters(oid) TO azure_pg_admin;


--
-- TOC entry 4099 (class 0 OID 0)
-- Dependencies: 267
-- Name: FUNCTION pg_stat_reset_single_table_counters(oid); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_table_counters(oid) TO azure_pg_admin;


--
-- TOC entry 4100 (class 0 OID 0)
-- Dependencies: 106
-- Name: COLUMN pg_config.name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(name) ON TABLE pg_catalog.pg_config TO azure_pg_admin;


--
-- TOC entry 4101 (class 0 OID 0)
-- Dependencies: 106
-- Name: COLUMN pg_config.setting; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(setting) ON TABLE pg_catalog.pg_config TO azure_pg_admin;


--
-- TOC entry 4102 (class 0 OID 0)
-- Dependencies: 102
-- Name: COLUMN pg_hba_file_rules.line_number; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(line_number) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4103 (class 0 OID 0)
-- Dependencies: 102
-- Name: COLUMN pg_hba_file_rules.type; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(type) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4104 (class 0 OID 0)
-- Dependencies: 102
-- Name: COLUMN pg_hba_file_rules.database; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(database) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4105 (class 0 OID 0)
-- Dependencies: 102
-- Name: COLUMN pg_hba_file_rules.user_name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(user_name) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4106 (class 0 OID 0)
-- Dependencies: 102
-- Name: COLUMN pg_hba_file_rules.address; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(address) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4107 (class 0 OID 0)
-- Dependencies: 102
-- Name: COLUMN pg_hba_file_rules.netmask; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(netmask) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4108 (class 0 OID 0)
-- Dependencies: 102
-- Name: COLUMN pg_hba_file_rules.auth_method; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(auth_method) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4109 (class 0 OID 0)
-- Dependencies: 102
-- Name: COLUMN pg_hba_file_rules.options; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(options) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4110 (class 0 OID 0)
-- Dependencies: 102
-- Name: COLUMN pg_hba_file_rules.error; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(error) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4111 (class 0 OID 0)
-- Dependencies: 152
-- Name: COLUMN pg_replication_origin_status.local_id; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(local_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 4112 (class 0 OID 0)
-- Dependencies: 152
-- Name: COLUMN pg_replication_origin_status.external_id; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(external_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 4113 (class 0 OID 0)
-- Dependencies: 152
-- Name: COLUMN pg_replication_origin_status.remote_lsn; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(remote_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 4114 (class 0 OID 0)
-- Dependencies: 152
-- Name: COLUMN pg_replication_origin_status.local_lsn; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(local_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 4115 (class 0 OID 0)
-- Dependencies: 107
-- Name: COLUMN pg_shmem_allocations.name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(name) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 4116 (class 0 OID 0)
-- Dependencies: 107
-- Name: COLUMN pg_shmem_allocations.off; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(off) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 4117 (class 0 OID 0)
-- Dependencies: 107
-- Name: COLUMN pg_shmem_allocations.size; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 4118 (class 0 OID 0)
-- Dependencies: 107
-- Name: COLUMN pg_shmem_allocations.allocated_size; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(allocated_size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 4119 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.starelid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(starelid) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4120 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.staattnum; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staattnum) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4121 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stainherit; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stainherit) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4122 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stanullfrac; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanullfrac) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4123 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stawidth; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stawidth) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4124 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stadistinct; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stadistinct) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4125 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stakind1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4126 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stakind2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4127 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stakind3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4128 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stakind4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4129 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stakind5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4130 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.staop1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4131 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.staop2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4132 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.staop3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4133 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.staop4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4134 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.staop5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4135 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stacoll1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4136 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stacoll2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4137 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stacoll3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4138 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stacoll4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4139 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stacoll5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4140 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stanumbers1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4141 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stanumbers2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4142 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stanumbers3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4143 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stanumbers4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4144 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stanumbers5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4145 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stavalues1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4146 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stavalues2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4147 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stavalues3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4148 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stavalues4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4149 (class 0 OID 0)
-- Dependencies: 47
-- Name: COLUMN pg_statistic.stavalues5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4150 (class 0 OID 0)
-- Dependencies: 72
-- Name: COLUMN pg_subscription.oid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(oid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4151 (class 0 OID 0)
-- Dependencies: 72
-- Name: COLUMN pg_subscription.subdbid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subdbid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4152 (class 0 OID 0)
-- Dependencies: 72
-- Name: COLUMN pg_subscription.subname; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4153 (class 0 OID 0)
-- Dependencies: 72
-- Name: COLUMN pg_subscription.subowner; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subowner) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4154 (class 0 OID 0)
-- Dependencies: 72
-- Name: COLUMN pg_subscription.subenabled; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subenabled) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4155 (class 0 OID 0)
-- Dependencies: 72
-- Name: COLUMN pg_subscription.subconninfo; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subconninfo) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4156 (class 0 OID 0)
-- Dependencies: 72
-- Name: COLUMN pg_subscription.subslotname; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subslotname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4157 (class 0 OID 0)
-- Dependencies: 72
-- Name: COLUMN pg_subscription.subsynccommit; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subsynccommit) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4158 (class 0 OID 0)
-- Dependencies: 72
-- Name: COLUMN pg_subscription.subpublications; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subpublications) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


-- Completed on 2024-05-30 23:08:48 +03

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.3

-- Started on 2024-05-30 23:08:48 +03

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

--
-- TOC entry 7 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: azure_pg_admin
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO azure_pg_admin;

--
-- TOC entry 3 (class 3079 OID 32975)
-- Name: azure; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS azure WITH SCHEMA pg_catalog;


--
-- TOC entry 3992 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION azure; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION azure IS 'azure extension for PostgreSQL service';


--
-- TOC entry 2 (class 3079 OID 24577)
-- Name: pgaadauth; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgaadauth WITH SCHEMA pg_catalog;


--
-- TOC entry 3993 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgaadauth; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgaadauth IS 'Azure Active Directory Authentication';


--
-- TOC entry 240 (class 1255 OID 33235)
-- Name: add_attendance_trigger(); Type: FUNCTION; Schema: public; Owner: admindb
--

CREATE FUNCTION public.add_attendance_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO attendance (attendanceid, studentid, lectureid, time, ishere, lecturename)
    SELECT 
        md5(random()::text), -- attendanceid için benzersiz bir değer oluşturma
        studentid, 
        NEW.lectureid,
        CURRENT_TIME,  -- Zaman bilgisi o anlık olarak eklenir
        FALSE,  -- Varsayılan olarak ishere değeri FALSE
        (SELECT lecturename FROM lecture WHERE lectureid = NEW.lectureid) -- lecture tablosundan lecturename alınır
    FROM student;
    
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.add_attendance_trigger() OWNER TO admindb;

--
-- TOC entry 231 (class 1255 OID 33217)
-- Name: add_user_to_appropriate_table(); Type: FUNCTION; Schema: public; Owner: admindb
--

CREATE FUNCTION public.add_user_to_appropriate_table() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.userid LIKE 'a%' THEN
        INSERT INTO lecturer (lecturerid) VALUES (NEW.userid);
    ELSIF NEW.userid LIKE 'o%' THEN
        INSERT INTO student (studentid) VALUES (NEW.userid);
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.add_user_to_appropriate_table() OWNER TO admindb;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 33161)
-- Name: attendance; Type: TABLE; Schema: public; Owner: admindb
--

CREATE TABLE public.attendance (
    attendanceid character varying(255) NOT NULL,
    studentid character varying(255),
    lectureid character varying(255),
    "time" time without time zone,
    ishere boolean,
    lecturename character varying(255)
);


ALTER TABLE public.attendance OWNER TO admindb;

--
-- TOC entry 218 (class 1259 OID 33168)
-- Name: lecture; Type: TABLE; Schema: public; Owner: admindb
--

CREATE TABLE public.lecture (
    lectureid character varying(255) NOT NULL,
    date character varying(255),
    lecturerid character varying(255),
    lecturename character varying(255)
);


ALTER TABLE public.lecture OWNER TO admindb;

--
-- TOC entry 223 (class 1259 OID 33222)
-- Name: lecturelist; Type: TABLE; Schema: public; Owner: admindb
--

CREATE TABLE public.lecturelist (
    lecturelistid integer NOT NULL,
    lecturerid character varying(255) NOT NULL,
    lecturename character varying(255) NOT NULL
);


ALTER TABLE public.lecturelist OWNER TO admindb;

--
-- TOC entry 222 (class 1259 OID 33221)
-- Name: lecturelist_lecturelistid_seq; Type: SEQUENCE; Schema: public; Owner: admindb
--

CREATE SEQUENCE public.lecturelist_lecturelistid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lecturelist_lecturelistid_seq OWNER TO admindb;

--
-- TOC entry 4069 (class 0 OID 0)
-- Dependencies: 222
-- Name: lecturelist_lecturelistid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admindb
--

ALTER SEQUENCE public.lecturelist_lecturelistid_seq OWNED BY public.lecturelist.lecturelistid;


--
-- TOC entry 225 (class 1259 OID 33252)
-- Name: lectureliststudent; Type: TABLE; Schema: public; Owner: admindb
--

CREATE TABLE public.lectureliststudent (
    lectureliststudentid integer NOT NULL,
    studentid character varying(255) NOT NULL,
    lecturename character varying(255) NOT NULL
);


ALTER TABLE public.lectureliststudent OWNER TO admindb;

--
-- TOC entry 224 (class 1259 OID 33251)
-- Name: lectureliststudent_lectureliststudentid_seq; Type: SEQUENCE; Schema: public; Owner: admindb
--

CREATE SEQUENCE public.lectureliststudent_lectureliststudentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lectureliststudent_lectureliststudentid_seq OWNER TO admindb;

--
-- TOC entry 4070 (class 0 OID 0)
-- Dependencies: 224
-- Name: lectureliststudent_lectureliststudentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admindb
--

ALTER SEQUENCE public.lectureliststudent_lectureliststudentid_seq OWNED BY public.lectureliststudent.lectureliststudentid;


--
-- TOC entry 219 (class 1259 OID 33175)
-- Name: lecturer; Type: TABLE; Schema: public; Owner: admindb
--

CREATE TABLE public.lecturer (
    lecturerid character varying(255) NOT NULL
);


ALTER TABLE public.lecturer OWNER TO admindb;

--
-- TOC entry 221 (class 1259 OID 33187)
-- Name: student; Type: TABLE; Schema: public; Owner: admindb
--

CREATE TABLE public.student (
    studentid character varying(255) NOT NULL
);


ALTER TABLE public.student OWNER TO admindb;

--
-- TOC entry 220 (class 1259 OID 33180)
-- Name: users; Type: TABLE; Schema: public; Owner: admindb
--

CREATE TABLE public.users (
    userid character varying(255) NOT NULL,
    username character varying(255),
    userpassword character varying(255)
);


ALTER TABLE public.users OWNER TO admindb;

--
-- TOC entry 3810 (class 2604 OID 33225)
-- Name: lecturelist lecturelistid; Type: DEFAULT; Schema: public; Owner: admindb
--

ALTER TABLE ONLY public.lecturelist ALTER COLUMN lecturelistid SET DEFAULT nextval('public.lecturelist_lecturelistid_seq'::regclass);


--
-- TOC entry 3811 (class 2604 OID 33255)
-- Name: lectureliststudent lectureliststudentid; Type: DEFAULT; Schema: public; Owner: admindb
--

ALTER TABLE ONLY public.lectureliststudent ALTER COLUMN lectureliststudentid SET DEFAULT nextval('public.lectureliststudent_lectureliststudentid_seq'::regclass);


--
-- TOC entry 3978 (class 0 OID 33161)
-- Dependencies: 217
-- Data for Name: attendance; Type: TABLE DATA; Schema: public; Owner: admindb
--

COPY public.attendance (attendanceid, studentid, lectureid, "time", ishere, lecturename) FROM stdin;
at1	o1	lec1	09:00:00	t	Computer Organization
at2	o2	lec1	09:00:00	f	Computer Organization
at3	o3	lec2	10:00:00	t	Software Engineering
at4	o1	lec3	11:00:00	t	Formal Languages & Automata
at5	o2	lec3	11:00:00	f	Formal Languages & Automata
63c9bbfe9cdb0186745b0ef2f8e5f116	o1	lec4	09:55:54.341511	f	Operations Research
f5686acdc3e2f774d8341cf46bda2316	o2	lec4	09:55:54.341511	f	Operations Research
1f33eac38cff43149b3a20079d0b85b4	o4	lec4	09:55:54.341511	f	Operations Research
7e0a43b28773eebe39d1ab2a4ab453a2	o1	lec5	08:40:09.426954	f	Software Engineering
74cd3002dd0717176849c333f9d84ed1	o2	lec5	08:40:09.426954	f	Software Engineering
c3fdada386e43c0a09af6e6e8196c28f	o3	lec5	08:40:09.426954	f	Software Engineering
2bc54e401d34108710f4bdd072ddc974	o4	lec5	08:40:09.426954	f	Software Engineering
80a01ebdbcd3e505ab3bf82e60d9c528	o1	Instance of 'Uuid'	13:13:13.074767	f	Operations Research
f0edc92708dab32e4b941b373d9e8fdd	o2	Instance of 'Uuid'	13:13:13.074767	f	Operations Research
98b96e01e05d167873552db041904669	o3	Instance of 'Uuid'	13:13:13.074767	f	Operations Research
074ca8722658f06bd05c7a53322a360f	o4	Instance of 'Uuid'	13:13:13.074767	f	Operations Research
25b8982e85e0e2775e7ea250faac1639	o1	09b8fbc6-8f07-4bf7-a348-255c31e2649f	13:19:56.484016	f	Computer Organization
10d3ec4638dc2e8991979bf4e2130811	o2	09b8fbc6-8f07-4bf7-a348-255c31e2649f	13:19:56.484016	f	Computer Organization
cabe5f52bd5ab1dbf32ae23b948b8183	o3	09b8fbc6-8f07-4bf7-a348-255c31e2649f	13:19:56.484016	f	Computer Organization
511eda1f148bb199eefcc18ab7113304	o4	09b8fbc6-8f07-4bf7-a348-255c31e2649f	13:19:56.484016	f	Computer Organization
7fd1291dd79b8707809308fe51474ac2	o1	057fd1f4-fb59-46b5-b66e-7633a6d9d227	13:20:03.186635	f	Operations Research
04b69265c7901f6b6d35f9e382d3b771	o2	057fd1f4-fb59-46b5-b66e-7633a6d9d227	13:20:03.186635	f	Operations Research
5b697280683d6c62db6edee0213e75b6	o3	057fd1f4-fb59-46b5-b66e-7633a6d9d227	13:20:03.186635	f	Operations Research
d8205f824ed8e9bbfea57a82b2c146f7	o4	057fd1f4-fb59-46b5-b66e-7633a6d9d227	13:20:03.186635	f	Operations Research
21df74a1e407fd3f37ef0e1454d1561c	o1	093d7ea8-4004-488c-a322-a051a5db2a27	13:55:41.106502	f	Operations Research
6211053164ede7fce3905d3bb2550583	o2	093d7ea8-4004-488c-a322-a051a5db2a27	13:55:41.106502	f	Operations Research
ad48e8d51832a39a9ecdee06c5b2213d	o3	093d7ea8-4004-488c-a322-a051a5db2a27	13:55:41.106502	f	Operations Research
6121a52afe01edd10d533b683143a4af	o4	093d7ea8-4004-488c-a322-a051a5db2a27	13:55:41.106502	f	Operations Research
c5781874b6935245ca028e11baa4a5c2	o1	6ae5e967-4d33-40ba-8573-1c4d48e5417c	13:56:53.387685	f	Computer Organization
4ac89c90827f97930766c03b457f778f	o2	6ae5e967-4d33-40ba-8573-1c4d48e5417c	13:56:53.387685	f	Computer Organization
e45d0fe0b42b6eed2363d4385addaaba	o3	6ae5e967-4d33-40ba-8573-1c4d48e5417c	13:56:53.387685	f	Computer Organization
39e05a4f6cd1e370f3e573369e58d387	o4	6ae5e967-4d33-40ba-8573-1c4d48e5417c	13:56:53.387685	f	Computer Organization
ebc32e3cab27f55c918acf4550ec8afd	o1	145efcb6-d6e7-411f-8cc5-e81d959d4817	07:48:38.368271	f	Computer Organization
0e766e37efc4430307c271dd6711b5ec	o2	145efcb6-d6e7-411f-8cc5-e81d959d4817	07:48:38.368271	f	Computer Organization
bd73bc8ff4bc3e4aa84dd5d2e5683e32	o3	145efcb6-d6e7-411f-8cc5-e81d959d4817	07:48:38.368271	f	Computer Organization
753a2f669db432977313ae0a5c2cc9e2	o4	145efcb6-d6e7-411f-8cc5-e81d959d4817	07:48:38.368271	f	Computer Organization
a4caa3c88c3dd83cea4e51d83a74aa3f	o1	17803a0a-16fa-4332-92e9-9521b4f61e9e	07:51:09.936002	f	Computer Organization
c12632fe7c0684f8a4d3b558383819bc	o2	17803a0a-16fa-4332-92e9-9521b4f61e9e	07:51:09.936002	f	Computer Organization
db4255aec828128f7dd2eb64e27abef2	o3	17803a0a-16fa-4332-92e9-9521b4f61e9e	07:51:09.936002	f	Computer Organization
a4eb923d4063b79a1738d49a67f80c4b	o4	17803a0a-16fa-4332-92e9-9521b4f61e9e	07:51:09.936002	f	Computer Organization
8e5500478fcf84b3f0cf4130a90c288f	o1	0cb9ee18-f5f2-4163-8553-eec96092e69c	08:15:29.689739	f	Computer Organization
9449a2d235a56726918f6036e1d68112	o2	0cb9ee18-f5f2-4163-8553-eec96092e69c	08:15:29.689739	f	Computer Organization
3c2928cdf46c140d5683b81988395fd0	o3	0cb9ee18-f5f2-4163-8553-eec96092e69c	08:15:29.689739	f	Computer Organization
f9331bf2da6c368eab92de1c1b32c80b	o4	0cb9ee18-f5f2-4163-8553-eec96092e69c	08:15:29.689739	f	Computer Organization
5327a3350465a52582ea2bf167894f69	o1	f2ı3hfujpo	09:38:29.190934	f	Computer Organization
57c9e37d3b42c6eef86823f8ed32fd30	o2	f2ı3hfujpo	09:38:29.190934	f	Computer Organization
d11cf159eed7f9dc29b5ce03ca9bed30	o3	f2ı3hfujpo	09:38:29.190934	f	Computer Organization
c5bcb08671937017620852d6c03486e1	o4	f2ı3hfujpo	09:38:29.190934	f	Computer Organization
a5d68c803478e23e834c0c3e281a519b	o1	f2ı3hfujpoo	09:41:40.117715	f	Computer Organization
e818c68242152ebc42e08e215e9aeb0f	o2	f2ı3hfujpoo	09:41:40.117715	f	Computer Organization
e8070fe9d25d1caa3a50a91d99cfe690	o3	f2ı3hfujpoo	09:41:40.117715	f	Computer Organization
3a23745a643b939ba5c166ba00c4fcaa	o4	f2ı3hfujpoo	09:41:40.117715	f	Computer Organization
fd8a7888340b9a1830ba5ea601f890c7	o1	fsıuheojfe	09:44:12.753414	f	Computer Organization
04f1ce96c29815237ddb49cecd002b55	o2	fsıuheojfe	09:44:12.753414	f	Computer Organization
b4ea0dc7f585149c94f3c313be1cb72d	o3	fsıuheojfe	09:44:12.753414	f	Computer Organization
39b1addfb74b3a35205a0e67ccfe862c	o4	fsıuheojfe	09:44:12.753414	f	Computer Organization
91844b92fccd0b894558737f80e32257	o1	fsıuheojfee	09:44:53.956113	f	Computer Organization
147e5cf616782e1e2609d15975fcac42	o2	fsıuheojfee	09:44:53.956113	f	Computer Organization
d481b1ffdfce0baa1430a4cd70896717	o3	fsıuheojfee	09:44:53.956113	f	Computer Organization
0538e8786ac2a9c10fcdd3a45d950018	o4	fsıuheojfee	09:44:53.956113	f	Computer Organization
04f18cb48535fb4007cfe51aec321463	o3	lec4	09:55:54.341511	t	Operations Research
012174a262f1bc12ed8316b5fc5b78f8	o1	fsıuheojfeee	09:46:16.097122	f	Computer Organization
cfe60d4ceeb40f4394476e3479da0c20	o2	fsıuheojfeee	09:46:16.097122	f	Computer Organization
1a762351f21ef107b73898a46dbb95a9	o3	fsıuheojfeee	09:46:16.097122	f	Computer Organization
b256b61955cd6b451681cf0b6ee82972	o4	fsıuheojfeee	09:46:16.097122	f	Computer Organization
f44bd36795953e14bbccc4dc5736be2c	o1	fsıuheojfeeee	09:49:32.633196	f	Computer Organization
f5873db8518985990bf75ec563c33510	o2	fsıuheojfeeee	09:49:32.633196	f	Computer Organization
9d8fb4dbc345fa0592f51745cdee0f22	o3	fsıuheojfeeee	09:49:32.633196	f	Computer Organization
785da0a3f4de8938b8b9700dfb10b918	o4	fsıuheojfeeee	09:49:32.633196	f	Computer Organization
8e9c1d1ebea52cf1c4982390e0a9c451	o1	wfsıuheojfeeee	09:50:03.321847	f	Computer Organization
003f360ba14d85c871eff8c1b46d0807	o2	wfsıuheojfeeee	09:50:03.321847	f	Computer Organization
4ecc46154d7e022802f4f96ac36a1f1b	o3	wfsıuheojfeeee	09:50:03.321847	f	Computer Organization
34c7d423fc181956eaf79f411db752f7	o4	wfsıuheojfeeee	09:50:03.321847	f	Computer Organization
d8f9041d2166598580b4ab8e7d4c5778	o1	wfsıuheojfeeeed	09:50:29.124078	f	Computer Organization
b4a75376c6fd295d8aacf7b997409be8	o2	wfsıuheojfeeeed	09:50:29.124078	f	Computer Organization
0eebd440a848362636fc32bf53c2c16c	o3	wfsıuheojfeeeed	09:50:29.124078	f	Computer Organization
d28a16b33a18379b3503f0158d7fab34	o4	wfsıuheojfeeeed	09:50:29.124078	f	Computer Organization
0efa138820c1287234971f6078f2c4e8	o1	wfsıuheojfeeeedd	09:50:51.828993	f	Computer Organization
0a6d3770f918f4d955dbeeb16ec16415	o2	wfsıuheojfeeeedd	09:50:51.828993	f	Computer Organization
136e0dde2f8a59ce49b4802bd0fbe790	o3	wfsıuheojfeeeedd	09:50:51.828993	f	Computer Organization
4b1312831e83c1f2edca5b2bf7b7430a	o4	wfsıuheojfeeeedd	09:50:51.828993	f	Computer Organization
dc2cfcd029f0d5006a41eddd2aa017aa	o1	1234	10:49:25.417381	f	Computer Organization
87fd3ab8b3298ae21c51c0f61cdc2457	o2	1234	10:49:25.417381	f	Computer Organization
8512b7aa4f84b20137e7c4f78410219c	o3	1234	10:49:25.417381	f	Computer Organization
c65b952e57ebbd63898a300fc3b40f55	o4	1234	10:49:25.417381	f	Computer Organization
e09c5b8bdf3ed5ef676ce00b357f0fa2	o1	bfoıqph432314123415jkd	10:50:20.274744	f	Computer Organization
07d4b289cdba3d0c5d8832534ea93125	o2	bfoıqph432314123415jkd	10:50:20.274744	f	Computer Organization
e1cacbe60ad290fd074e8e84486c62c5	o3	bfoıqph432314123415jkd	10:50:20.274744	f	Computer Organization
4f88793d89fed536ae0022adbbcea9b2	o4	bfoıqph432314123415jkd	10:50:20.274744	f	Computer Organization
c14de77ec9229e4f24efe4e2bd196f76	o1	wfsıuheojfeeeeddea	10:52:19.371933	f	Computer Organization
3612e0cb14aed665a626f77eb5f3fc32	o2	wfsıuheojfeeeeddea	10:52:19.371933	f	Computer Organization
572fdd90c9bc631a523038212f83cc99	o3	wfsıuheojfeeeeddea	10:52:19.371933	f	Computer Organization
02f3db67950071ada21c48277a29d6eb	o4	wfsıuheojfeeeeddea	10:52:19.371933	f	Computer Organization
70d1161b28d059671dbf5c0427b94bdb	o2	0e137a65-2a80-43b5-89fe-48e84b9cd4c5	10:57:10.979591	f	Computer Organization
9d1bdb2e470c6ee3a409beb712574b6d	o3	0e137a65-2a80-43b5-89fe-48e84b9cd4c5	10:57:10.979591	f	Computer Organization
e65f9a14bafe7c8ef98bd99dcb4b3400	o4	0e137a65-2a80-43b5-89fe-48e84b9cd4c5	10:57:10.979591	f	Computer Organization
46fc5ac891efd9f714e7ae34640e49dd	o1	0e137a65-2a80-43b5-89fe-48e84b9cd4c5	10:57:10.979591	t	Computer Organization
6f1027b4a86a3772c454ee5801c11f51	o1	ba6a9909-53c5-4e3a-80b2-02e4a5e3a7cf	11:07:45.910773	f	Computer Organization
02ca2c2059482ea35f02fe9599943a92	o2	ba6a9909-53c5-4e3a-80b2-02e4a5e3a7cf	11:07:45.910773	f	Computer Organization
04b890430907602a3f50799b7fbc2002	o3	ba6a9909-53c5-4e3a-80b2-02e4a5e3a7cf	11:07:45.910773	f	Computer Organization
417d92169f880b2e220c9a0649c5785f	o4	ba6a9909-53c5-4e3a-80b2-02e4a5e3a7cf	11:07:45.910773	f	Computer Organization
3029411d8f69e92f1fe239129f8101ee	o1	3898aa66-e0dc-42a8-909c-e98f474f50b9	11:10:03.934249	f	Operations Research
d93a2dea2d5d3b1d3d77ddf2a10d0995	o2	3898aa66-e0dc-42a8-909c-e98f474f50b9	11:10:03.934249	f	Operations Research
316bda8757092f4a34d10174ae58794c	o3	3898aa66-e0dc-42a8-909c-e98f474f50b9	11:10:03.934249	f	Operations Research
1581c13d90e15249c70bd9eaf532c7b7	o4	3898aa66-e0dc-42a8-909c-e98f474f50b9	11:10:03.934249	f	Operations Research
8d9063084d6fcf8e9daf45b3d4cdd9a4	o1	04da0c20-60ca-49a6-89d6-1dd352bc99db	11:22:03.70589	f	Computer Organization
514e0bb1f9c26cc187ed305e153cc80e	o2	04da0c20-60ca-49a6-89d6-1dd352bc99db	11:22:03.70589	f	Computer Organization
ab391d7ab9fc38949f2e4421891267d1	o3	04da0c20-60ca-49a6-89d6-1dd352bc99db	11:22:03.70589	f	Computer Organization
27a7fe3209e15c96740db31ddf008fb1	o4	04da0c20-60ca-49a6-89d6-1dd352bc99db	11:22:03.70589	f	Computer Organization
50049957e0797ff5bd1d6636dcdc64ff	o1	003103f9-14dd-4957-a267-5cfb91ab6c44	11:29:36.260544	f	Computer Organization
d6935647b07abf02d680dff90bdafe43	o2	003103f9-14dd-4957-a267-5cfb91ab6c44	11:29:36.260544	f	Computer Organization
9a5c0bd6de300dd2bb374baa6a8b7406	o3	003103f9-14dd-4957-a267-5cfb91ab6c44	11:29:36.260544	f	Computer Organization
898df7dcdee4b661e208d5c7721f724d	o4	003103f9-14dd-4957-a267-5cfb91ab6c44	11:29:36.260544	f	Computer Organization
9cafd658cf51ba9e1f8c11d39131a6af	o3	b5b539ab-048e-487b-836f-e16393a50a4c	11:44:32.367206	f	Computer Organization
9db1a5629d7b35165e038acdd8dadd7a	o4	b5b539ab-048e-487b-836f-e16393a50a4c	11:44:32.367206	f	Computer Organization
b96559359320134335f977d1a0800293	o1	b5b539ab-048e-487b-836f-e16393a50a4c	11:44:32.367206	t	Computer Organization
15c56f86d7f4861c72ef2b7772cc73dc	o2	b5b539ab-048e-487b-836f-e16393a50a4c	11:44:32.367206	t	Computer Organization
a894b2fc353b653a1d38c320c46a63be	o1	cd3b3882-5777-4ec5-bfc1-807dbd01420c	22:13:02.104919	f	Computer Organization
93f6773575a40f2b54cb5b8f281f2a13	o1	fe10a0d8-a10c-4d01-885e-939ab27a63b2	22:02:32.746382	f	Operations Research
3f35c944198b126519071a748df91b1a	o2	fe10a0d8-a10c-4d01-885e-939ab27a63b2	22:02:32.746382	f	Operations Research
affdbeb0ba39b71145ddb6fac7728df6	o3	fe10a0d8-a10c-4d01-885e-939ab27a63b2	22:02:32.746382	f	Operations Research
ac1f6b102b7dd370775966e26240f296	o4	fe10a0d8-a10c-4d01-885e-939ab27a63b2	22:02:32.746382	f	Operations Research
993156f088ca67f55a1635fd614ef856	o2	cd3b3882-5777-4ec5-bfc1-807dbd01420c	22:13:02.104919	f	Computer Organization
9e292fdb25a8951606d08aead5676776	o3	cd3b3882-5777-4ec5-bfc1-807dbd01420c	22:13:02.104919	f	Computer Organization
20ffdf6084309ef377d676b94abad412	o4	cd3b3882-5777-4ec5-bfc1-807dbd01420c	22:13:02.104919	f	Computer Organization
59e121e9a183ebee271c9a66b9c12c7b	o1	b66afe21-0baf-44e5-a4f8-6652dc5b8a4d	10:14:43.743713	f	Computer Organization
94bf0fbf453f1bc77aa4b5ba180a659a	o2	b66afe21-0baf-44e5-a4f8-6652dc5b8a4d	10:14:43.743713	f	Computer Organization
d80080156c80c7326d0184db73f594fe	o3	b66afe21-0baf-44e5-a4f8-6652dc5b8a4d	10:14:43.743713	f	Computer Organization
427e8d7d44cd47029613b60d4b87844a	o4	b66afe21-0baf-44e5-a4f8-6652dc5b8a4d	10:14:43.743713	f	Computer Organization
777223dbc4de6a5eb9f573b53f839cec	o1	0c7ca06c-32d8-4622-9742-58a5696bcac8	10:19:14.474158	f	Computer Organization
41b06971152fcc517fd17e8e3ad2fd3e	o2	0c7ca06c-32d8-4622-9742-58a5696bcac8	10:19:14.474158	f	Computer Organization
7fdf68aa8e762c5366a67b196532d965	o3	0c7ca06c-32d8-4622-9742-58a5696bcac8	10:19:14.474158	f	Computer Organization
9127cf6c937e4211dfdff577a04ace94	o4	0c7ca06c-32d8-4622-9742-58a5696bcac8	10:19:14.474158	f	Computer Organization
7a29d10dd64c514bd463b14a30ec7879	o1	d32efd5e-fd9a-40c7-851a-9bb95ffc6555	10:23:11.596912	f	Computer Organization
1e5403aabbf0a3b6a8f8d797b004f9d8	o2	d32efd5e-fd9a-40c7-851a-9bb95ffc6555	10:23:11.596912	f	Computer Organization
bb35181094183bee1d1125f91f7a97b7	o3	d32efd5e-fd9a-40c7-851a-9bb95ffc6555	10:23:11.596912	f	Computer Organization
3e5924050ad81753dff1a3eb9ea051ca	o4	d32efd5e-fd9a-40c7-851a-9bb95ffc6555	10:23:11.596912	f	Computer Organization
ee516047a34f78f82b01ad2f5a56ac50	o1	4305f302-5cc4-48c7-823e-c44ef54e6955	10:24:41.18213	f	Computer Organization
c09af314043a143bdfa3c12b9312bd3f	o2	4305f302-5cc4-48c7-823e-c44ef54e6955	10:24:41.18213	f	Computer Organization
4bb8f19db139f6d7aaf4cd92a9a2d13a	o3	4305f302-5cc4-48c7-823e-c44ef54e6955	10:24:41.18213	f	Computer Organization
f72769c82639c785a3485ce999a1e579	o4	4305f302-5cc4-48c7-823e-c44ef54e6955	10:24:41.18213	f	Computer Organization
2440332ced19cb0e857daace547bd87e	o1	f0eef05d-9f48-41e4-ab76-0880e9f89adb	10:26:52.649682	f	Computer Organization
285e0d39ef3fa1e376f474c5f1b96fa9	o2	f0eef05d-9f48-41e4-ab76-0880e9f89adb	10:26:52.649682	f	Computer Organization
5b8960cc29ed3d0620e3a5918bc44cd7	o3	f0eef05d-9f48-41e4-ab76-0880e9f89adb	10:26:52.649682	f	Computer Organization
25a7c31e1e250e93fc7811a5e2a5afb2	o4	f0eef05d-9f48-41e4-ab76-0880e9f89adb	10:26:52.649682	f	Computer Organization
3a09e59de1c6cea56c3c7a5a18b7514c	o1	08c80772-dbef-4501-8a77-8168de399e0a	10:27:27.495524	f	Computer Organization
ab9c83379d8009b7005d00a751df8af4	o2	08c80772-dbef-4501-8a77-8168de399e0a	10:27:27.495524	f	Computer Organization
eaf3a5db4e9c5253b78876acde0ac868	o3	08c80772-dbef-4501-8a77-8168de399e0a	10:27:27.495524	f	Computer Organization
d95348abdf056642807982a1622a868f	o4	08c80772-dbef-4501-8a77-8168de399e0a	10:27:27.495524	f	Computer Organization
27254db5599286b26c9c1bd49b94a75d	o3	21b5fd6e-216c-4a6f-b339-275ff4026146	10:34:24.541116	f	Computer Organization
8213c0b9d3a901ae207fab78a1bcc4bd	o4	21b5fd6e-216c-4a6f-b339-275ff4026146	10:34:24.541116	f	Computer Organization
6df97b901ef973bed8c206d85bd2e3fe	o2	bd1e931f-3d48-48de-bab2-0cafc10cc797	13:35:18.202963	t	Computer Organization
a255e07d5f8716d0ae2e6845929ea74b	o1	21b5fd6e-216c-4a6f-b339-275ff4026146	10:34:24.541116	t	Computer Organization
c6c0e3cbc00f0eec319b911008d2fa77	o2	21b5fd6e-216c-4a6f-b339-275ff4026146	10:34:24.541116	t	Computer Organization
e891c8fc706700726ac66ed1725e04c2	o1	9ad62a6f-64a4-406c-b06f-6ddd7540c4cb	10:37:02.284826	f	Computer Organization
f60ef27a0b56875f7ced279a28bc88ee	o3	9ad62a6f-64a4-406c-b06f-6ddd7540c4cb	10:37:02.284826	f	Computer Organization
2cf0f7a0d2c53c4a8943f7b91a0fa17c	o4	9ad62a6f-64a4-406c-b06f-6ddd7540c4cb	10:37:02.284826	f	Computer Organization
3a923783adf6b3263ed7614590443223	o2	9ad62a6f-64a4-406c-b06f-6ddd7540c4cb	10:37:02.284826	t	Computer Organization
3fe8fd934770923c45732ae07a882079	o1	5b11a599-5051-4cf8-87d6-54a9d8edec10	11:27:01.971409	f	Computer Organization
d89792b71b2abeea7a6e99c3fe6025ba	o2	5b11a599-5051-4cf8-87d6-54a9d8edec10	11:27:01.971409	f	Computer Organization
c32cbcaee0467c9a483bd46fb6eab260	o3	5b11a599-5051-4cf8-87d6-54a9d8edec10	11:27:01.971409	f	Computer Organization
e7e3c10bf015b470a25165b66e187d50	o4	5b11a599-5051-4cf8-87d6-54a9d8edec10	11:27:01.971409	f	Computer Organization
7e747be318826d18b816980b0f793998	o1	134a86d5-7585-4797-a5fe-3fbe957b7e03	12:08:00.372386	f	Computer Organization
14e04015871d88539e42a416185c80f4	o3	134a86d5-7585-4797-a5fe-3fbe957b7e03	12:08:00.372386	f	Computer Organization
63f5cc16f3730e71da478aecdd2d0003	o4	134a86d5-7585-4797-a5fe-3fbe957b7e03	12:08:00.372386	f	Computer Organization
10a32d4298af69efc3721c665864ae4a	o1	bd1e931f-3d48-48de-bab2-0cafc10cc797	13:35:18.202963	t	Computer Organization
c376f4507cc4e66d096e528cdb51489d	o2	c926578f-c3b3-4d22-8712-61ee787da6e1	12:15:43.041864	t	Computer Organization
2e094fddbe6fef949cb3afd0fc878620	o2	134a86d5-7585-4797-a5fe-3fbe957b7e03	12:08:00.372386	t	Computer Organization
d4c69a7a46ad2337da95018222413c10	o3	c926578f-c3b3-4d22-8712-61ee787da6e1	12:15:43.041864	f	Computer Organization
9129a6df6f84000a26703c7c9d8560c4	o4	c926578f-c3b3-4d22-8712-61ee787da6e1	12:15:43.041864	f	Computer Organization
ab8f3476cc947dcd9e780bc1319db159	o1	92a4a1fc-c94f-4324-bd0a-b9dc766f2e03	14:00:24.079064	f	Operations Research
2fdd93517888ebe14b54c94150242163	o1	c926578f-c3b3-4d22-8712-61ee787da6e1	12:15:43.041864	t	Computer Organization
437d0feab40c4e17ab6192a4b5275f76	o3	bd1e931f-3d48-48de-bab2-0cafc10cc797	13:35:18.202963	f	Computer Organization
8a187dfe9e522503b4e894ac1004a790	o4	bd1e931f-3d48-48de-bab2-0cafc10cc797	13:35:18.202963	f	Computer Organization
4e0f9b9c01588c71ff12077f1cc1c3a5	o2	92a4a1fc-c94f-4324-bd0a-b9dc766f2e03	14:00:24.079064	f	Operations Research
624d8e0b393dea77fe988461c800a24a	o3	92a4a1fc-c94f-4324-bd0a-b9dc766f2e03	14:00:24.079064	f	Operations Research
1da2b3ee7286d140b9d04ff6c2a0b787	o4	92a4a1fc-c94f-4324-bd0a-b9dc766f2e03	14:00:24.079064	f	Operations Research
3e048b0ba3be6cb600eb11d92afbe897	o1	e3f7ebf7-b94d-46d3-949c-9ce688b8ec5d	14:04:02.736465	f	Computer Organization
f964ccd9fcdc5765ad5a5985ceb187aa	o2	e3f7ebf7-b94d-46d3-949c-9ce688b8ec5d	14:04:02.736465	f	Computer Organization
328f7878681a2d5a98d0f2325336c88b	o3	e3f7ebf7-b94d-46d3-949c-9ce688b8ec5d	14:04:02.736465	f	Computer Organization
851b085ef75cf3606b43d3bb4d30aa8c	o4	e3f7ebf7-b94d-46d3-949c-9ce688b8ec5d	14:04:02.736465	f	Computer Organization
6b3873f89c74346c10933253b5d5e2e3	o4	d3c73f75-2aed-411b-9339-023d778dc8b9	14:06:03.900728	f	Computer Organization
4df3ab905f5281b4211eb6193afd79e4	o1	226744fe-4bb6-4329-8228-5fec9fc8e4f0	18:25:46.185364	f	Computer Organization
e2dc96859445604619e4b9f0e444ab98	o2	226744fe-4bb6-4329-8228-5fec9fc8e4f0	18:25:46.185364	f	Computer Organization
f2846520793074301c22f5e399d3a8a8	o1	d3c73f75-2aed-411b-9339-023d778dc8b9	14:06:03.900728	t	Computer Organization
e167983b1ce1d584d7253e73e19d32d9	o3	d3c73f75-2aed-411b-9339-023d778dc8b9	14:06:03.900728	t	Computer Organization
dac52b97f54d3b03335ffaed8fdf9902	o2	d3c73f75-2aed-411b-9339-023d778dc8b9	14:06:03.900728	t	Computer Organization
7e3fcaad07bbbde88694d43b328f62f6	o4	0aa9fd36-8b4f-4427-8db2-2e373bb7a62a	14:11:41.65611	f	Computer Organization
fccdc528de8870ed583e0c80073753e0	o3	226744fe-4bb6-4329-8228-5fec9fc8e4f0	18:25:46.185364	f	Computer Organization
117dd770d064e4ba45e0f0be3c63663d	o2	0aa9fd36-8b4f-4427-8db2-2e373bb7a62a	14:11:41.65611	t	Computer Organization
61aafcf5437ac54b7883eca2494d0aa5	o1	0aa9fd36-8b4f-4427-8db2-2e373bb7a62a	14:11:41.65611	t	Computer Organization
cd653e0a2f90c77d6c39dc06a1dd3d82	o4	226744fe-4bb6-4329-8228-5fec9fc8e4f0	18:25:46.185364	f	Computer Organization
d0c816c1c9b230977bebf7d9fed139fb	o1	81c1a91f-36a6-41f0-a450-3136213d5c84	18:25:53.596945	f	Computer Organization
1b5b0c313760337b190b559a6bfb6b66	o2	81c1a91f-36a6-41f0-a450-3136213d5c84	18:25:53.596945	f	Computer Organization
fec8d20b3dbe9bac740c7cc42c73aa50	o3	0aa9fd36-8b4f-4427-8db2-2e373bb7a62a	14:11:41.65611	t	Computer Organization
3a9ba470980195cc43779af34f6fb221	o1	9a698618-038d-4c57-92d4-3802011046d9	17:24:27.825127	f	Computer Organization
43e15fc68758cfb50ef04234180a6fc4	o2	9a698618-038d-4c57-92d4-3802011046d9	17:24:27.825127	f	Computer Organization
c36f7f09e7d68523c141f6c491ea2098	o3	9a698618-038d-4c57-92d4-3802011046d9	17:24:27.825127	f	Computer Organization
9de8fc724826f8c104f51c2d264cbfe2	o4	9a698618-038d-4c57-92d4-3802011046d9	17:24:27.825127	f	Computer Organization
d2b39a89d511f3f6a17b9f3905e30bd8	o1	23fb153f-e9dc-4d31-8534-91891ef8678d	18:06:49.188958	f	Computer Organization
dec95b62658871222da485d37f85e5bf	o2	23fb153f-e9dc-4d31-8534-91891ef8678d	18:06:49.188958	f	Computer Organization
20ae46252edf1be2f5578816f7afbbed	o3	23fb153f-e9dc-4d31-8534-91891ef8678d	18:06:49.188958	f	Computer Organization
d4b319abf04b061eb6ca439accbd06c9	o4	23fb153f-e9dc-4d31-8534-91891ef8678d	18:06:49.188958	f	Computer Organization
d2af6baced3081ed61fd73ba4c6d0592	o1	50189dc1-9278-4b39-be2e-7b6d23a8882f	18:08:45.965195	f	Computer Organization
60180de85667bbdb6ea00e147112b305	o2	50189dc1-9278-4b39-be2e-7b6d23a8882f	18:08:45.965195	f	Computer Organization
452c3369ceb00188687f6343242e7d97	o3	50189dc1-9278-4b39-be2e-7b6d23a8882f	18:08:45.965195	f	Computer Organization
60f892da9e08db0f4148241824656673	o4	50189dc1-9278-4b39-be2e-7b6d23a8882f	18:08:45.965195	f	Computer Organization
6c8fd98f47acd44693de7d84b462ee9c	o2	03b4041e-d7ae-434d-9493-5d142f02a64b	18:10:28.459662	f	Computer Organization
5d268c0e510b1d2f7bb511ffa8782446	o3	03b4041e-d7ae-434d-9493-5d142f02a64b	18:10:28.459662	f	Computer Organization
e6a4fc88b1867759cead0e5aee071988	o4	03b4041e-d7ae-434d-9493-5d142f02a64b	18:10:28.459662	f	Computer Organization
b17142aa8d26d48aac8ff5edf2c8345f	o1	03b4041e-d7ae-434d-9493-5d142f02a64b	18:10:28.459662	t	Computer Organization
08859f3bd54474affdffa58b23aa2905	o1	6bc50cd9-5384-42b4-94b1-d39e7a7b57c3	18:15:44.859	f	Computer Organization
f6ea3c7bfafa1ce87549c23842fca7ac	o2	6bc50cd9-5384-42b4-94b1-d39e7a7b57c3	18:15:44.859	f	Computer Organization
3179f0d8e31ff3131dd3f24ec1a392f2	o3	6bc50cd9-5384-42b4-94b1-d39e7a7b57c3	18:15:44.859	f	Computer Organization
8e8e27eb7c93f45249a7d4dd25aec07a	o4	6bc50cd9-5384-42b4-94b1-d39e7a7b57c3	18:15:44.859	f	Computer Organization
46e871272b93e5e16b0f97aaf1bcc102	o1	5cf34c34-20cc-4602-9187-1801f099d758	18:18:59.883292	f	Computer Organization
0410a402d0d73c17fadbbe54ccd4fbf2	o2	5cf34c34-20cc-4602-9187-1801f099d758	18:18:59.883292	f	Computer Organization
eef3e27545ab5421a06939ffac303683	o3	5cf34c34-20cc-4602-9187-1801f099d758	18:18:59.883292	f	Computer Organization
ef53782af2d49381fe337fed1c21d617	o4	5cf34c34-20cc-4602-9187-1801f099d758	18:18:59.883292	f	Computer Organization
fda129a75dd7136637dd533bd0b69dff	o1	0c8e4d13-3e0b-4d56-836a-f9a647e4ab0b	18:21:06.413419	f	Computer Organization
f4b3eb1865e7a19ef7b693c4c7bf8a75	o2	0c8e4d13-3e0b-4d56-836a-f9a647e4ab0b	18:21:06.413419	f	Computer Organization
6e2b8f7f4baca1909312f7f0c975f2b1	o3	0c8e4d13-3e0b-4d56-836a-f9a647e4ab0b	18:21:06.413419	f	Computer Organization
2215c851f241ea8263300a6acb03d79d	o4	0c8e4d13-3e0b-4d56-836a-f9a647e4ab0b	18:21:06.413419	f	Computer Organization
c1e83cc640e2945f7a6ab7a82b73bc74	o1	49d48e5c-4f54-4436-81a5-612a9b2ec3fe	18:23:05.019208	f	Computer Organization
e148403d86448926b721f62e31b85ae2	o2	49d48e5c-4f54-4436-81a5-612a9b2ec3fe	18:23:05.019208	f	Computer Organization
6817a6e43fad623cc7c79f07a82fb456	o3	49d48e5c-4f54-4436-81a5-612a9b2ec3fe	18:23:05.019208	f	Computer Organization
604f1c6de87e13ed8b6cea021acf6a39	o4	49d48e5c-4f54-4436-81a5-612a9b2ec3fe	18:23:05.019208	f	Computer Organization
9df79c455b55f9e39cd72f968220a1f8	o1	c7eb13d0-e7e8-4c3f-a1be-fb9b0a7ad184	18:23:15.419052	f	Computer Organization
bb9ecc719f46164ce41d3166a884b387	o2	c7eb13d0-e7e8-4c3f-a1be-fb9b0a7ad184	18:23:15.419052	f	Computer Organization
31202f2c84feb4e5052e28004bd590c7	o3	c7eb13d0-e7e8-4c3f-a1be-fb9b0a7ad184	18:23:15.419052	f	Computer Organization
3f96a6cf9a39b6761ac15dfbc62368f0	o4	c7eb13d0-e7e8-4c3f-a1be-fb9b0a7ad184	18:23:15.419052	f	Computer Organization
fe190f97a5594a9e3cdc6117eff99708	o3	81c1a91f-36a6-41f0-a450-3136213d5c84	18:25:53.596945	f	Computer Organization
e5255b590565da7f91fd1a45d7bd795c	o4	81c1a91f-36a6-41f0-a450-3136213d5c84	18:25:53.596945	f	Computer Organization
b25322f9e49d3276c260716379a7ebba	o1	2295f0f0-fd4e-4671-be0b-1320f76b771b	18:37:19.045059	f	Computer Organization
4074c78ff118a09c59435bcee3d23939	o3	2295f0f0-fd4e-4671-be0b-1320f76b771b	18:37:19.045059	f	Computer Organization
444e26d3edc7e1c9bf5242aeabbbe6c0	o4	2295f0f0-fd4e-4671-be0b-1320f76b771b	18:37:19.045059	f	Computer Organization
e061b70843a26987926f499bb59bf6fd	o2	2295f0f0-fd4e-4671-be0b-1320f76b771b	18:37:19.045059	t	Computer Organization
7c5ff9c8c0fccc9eb4a41194a50ed73e	o1	040ddce8-d43f-4179-b570-5ec7de167505	18:38:15.419147	f	Computer Organization
81d50502372a8c7823eff89ff19d87ff	o3	040ddce8-d43f-4179-b570-5ec7de167505	18:38:15.419147	f	Computer Organization
92490cec2542544d16f4d8f9da6f8f52	o4	040ddce8-d43f-4179-b570-5ec7de167505	18:38:15.419147	f	Computer Organization
dca819c3c984a6107effac40e0720979	o2	040ddce8-d43f-4179-b570-5ec7de167505	18:38:15.419147	t	Computer Organization
1ab6f173179f34310e88086cace0c7e2	o1	821f2f77-72fb-4bb9-aed0-800b43fcf36f	18:40:00.483161	f	Computer Organization
0a82405715a619e5be360de06b583e66	o3	821f2f77-72fb-4bb9-aed0-800b43fcf36f	18:40:00.483161	f	Computer Organization
37c07b68addaec2fcdf0e2dc83d44102	o4	821f2f77-72fb-4bb9-aed0-800b43fcf36f	18:40:00.483161	f	Computer Organization
a754bf178bd96b1e544abd23d7955fe7	o2	821f2f77-72fb-4bb9-aed0-800b43fcf36f	18:40:00.483161	t	Computer Organization
8e3fec707bd3094b4fff93e2a5d7ccb6	o1	0bba569b-7995-4e14-b759-38153570dc60	18:46:01.127041	f	Computer Organization
ff490a0164f432dc0f58faf9cbb20da7	o3	0bba569b-7995-4e14-b759-38153570dc60	18:46:01.127041	f	Computer Organization
9aca936fc2b35e1388c871f05ea6517f	o4	0bba569b-7995-4e14-b759-38153570dc60	18:46:01.127041	f	Computer Organization
e9b5d86777a447aaa8bb224485f98c45	o1	c660a9be-8c66-415d-b5ca-c58c57e4205f	07:37:15.970072	f	Object Oriented Design
6c319ec7017140f2325143bffb070f0e	o2	0bba569b-7995-4e14-b759-38153570dc60	18:46:01.127041	t	Computer Organization
0c5737103bf280dee1512131b3ac7c09	o3	b3bee083-5edf-40c2-bdd5-a975d7810a04	18:56:16.394567	f	Operations Research
e5811ac93de152bf79c9fae6d3e8ed7b	o4	b3bee083-5edf-40c2-bdd5-a975d7810a04	18:56:16.394567	f	Operations Research
1efb768a533780b7452d1cff8e603db8	o150120509	b3bee083-5edf-40c2-bdd5-a975d7810a04	18:56:16.394567	f	Operations Research
64416803ee698c2cabd71407291f636a	o150121075	b3bee083-5edf-40c2-bdd5-a975d7810a04	18:56:16.394567	f	Operations Research
d3bbe272d27aa11a445bf5aed6c98033	o150120001	b3bee083-5edf-40c2-bdd5-a975d7810a04	18:56:16.394567	f	Operations Research
58a91430e7398db2f762eaaa4be7611c	o2	c660a9be-8c66-415d-b5ca-c58c57e4205f	07:37:15.970072	f	Object Oriented Design
2f25ba14d23a84e785b00f06c967fc66	o2	b3bee083-5edf-40c2-bdd5-a975d7810a04	18:56:16.394567	t	Operations Research
db10e21bb06b566fbf45869d0d05e502	o1	b3bee083-5edf-40c2-bdd5-a975d7810a04	18:56:16.394567	t	Operations Research
c7d3a09efebb7cf3cbebeeb7affd8d49	o2	7b9b4150-3ef3-4568-a6f0-01502ca38618	19:06:35.002599	f	Operations Research
8638c131a653dcff042fe3eee8141d5d	o3	7b9b4150-3ef3-4568-a6f0-01502ca38618	19:06:35.002599	f	Operations Research
ce318258fe1e951aebddceaa8811c8ef	o4	7b9b4150-3ef3-4568-a6f0-01502ca38618	19:06:35.002599	f	Operations Research
28d7c5988a5678048ebae483e6a0e01b	o150120509	7b9b4150-3ef3-4568-a6f0-01502ca38618	19:06:35.002599	f	Operations Research
11d37e7a0d99609d8bc1a730f1858960	o150121075	7b9b4150-3ef3-4568-a6f0-01502ca38618	19:06:35.002599	f	Operations Research
e02ca260c910748eeeec1ec606ad9ded	o150120001	7b9b4150-3ef3-4568-a6f0-01502ca38618	19:06:35.002599	f	Operations Research
7a9809c6baef3d3e9fe7e72dbda8e922	o1	7b9b4150-3ef3-4568-a6f0-01502ca38618	19:06:35.002599	t	Operations Research
e1247e96932356dddeec13d9235996b3	o1	915b874c-67d3-4b8f-92ef-3cb972e7e5df	19:09:37.146199	f	Computer Organization
db8b2d7c67d55bbff30c963e73b9fed7	o2	915b874c-67d3-4b8f-92ef-3cb972e7e5df	19:09:37.146199	f	Computer Organization
dd7d51dc0dc6d1625edf57585604512a	o3	915b874c-67d3-4b8f-92ef-3cb972e7e5df	19:09:37.146199	f	Computer Organization
75adad51439cc58dbe5fe8c7fabbcaf5	o4	915b874c-67d3-4b8f-92ef-3cb972e7e5df	19:09:37.146199	f	Computer Organization
026a7dd573212e03977611625e523eb8	o150120509	915b874c-67d3-4b8f-92ef-3cb972e7e5df	19:09:37.146199	f	Computer Organization
8457d816ca524a76ca651737aec34a90	o150121075	915b874c-67d3-4b8f-92ef-3cb972e7e5df	19:09:37.146199	f	Computer Organization
f1cc095ee09b53cc128618a968868f0d	o150120001	915b874c-67d3-4b8f-92ef-3cb972e7e5df	19:09:37.146199	f	Computer Organization
87653d4174aec985859e93eb43f4c8fa	o1	500b5531-740d-4bb3-bc4d-164012c657fc	19:13:49.246045	f	Computer Organization
a8964132a5615e9635f8210ab1545704	o2	500b5531-740d-4bb3-bc4d-164012c657fc	19:13:49.246045	f	Computer Organization
2fd2eda12cdd36b38d190c32dbd2fc2b	o3	500b5531-740d-4bb3-bc4d-164012c657fc	19:13:49.246045	f	Computer Organization
741ab0fe289c8eb8b34bed26da48668a	o4	500b5531-740d-4bb3-bc4d-164012c657fc	19:13:49.246045	f	Computer Organization
f26c7168b7b37f4980ab1f2ebb0f648f	o150120509	500b5531-740d-4bb3-bc4d-164012c657fc	19:13:49.246045	f	Computer Organization
66506851fc25c01a62db09cad13c6e4f	o150121075	500b5531-740d-4bb3-bc4d-164012c657fc	19:13:49.246045	f	Computer Organization
605b3ac117411af65514872349035ffb	o150120001	500b5531-740d-4bb3-bc4d-164012c657fc	19:13:49.246045	f	Computer Organization
c80f017d31d6a34e13df6ee75f03c3f5	o1	a32435ee-fef9-452e-b33c-c0da9413b96d	07:33:01.825684	f	Software Enginnering
2c9f8c30e079e0b0eaaff2a34d88728d	o2	a32435ee-fef9-452e-b33c-c0da9413b96d	07:33:01.825684	f	Software Enginnering
752b03647c368824e14ae98cd17c54d2	o3	a32435ee-fef9-452e-b33c-c0da9413b96d	07:33:01.825684	f	Software Enginnering
a085a5f219811a65c7c25208bf647011	o4	a32435ee-fef9-452e-b33c-c0da9413b96d	07:33:01.825684	f	Software Enginnering
a28cfec222c3768229aca23bb32d8cf8	o150120509	a32435ee-fef9-452e-b33c-c0da9413b96d	07:33:01.825684	f	Software Enginnering
d5803356767f182e1135e1ba10fba7b3	o150121075	a32435ee-fef9-452e-b33c-c0da9413b96d	07:33:01.825684	f	Software Enginnering
ced7d393e14e820395c9f438cd77971e	o150120001	a32435ee-fef9-452e-b33c-c0da9413b96d	07:33:01.825684	f	Software Enginnering
7e7c49c84e93c1bb637adb3d5476bdf6	o3	c660a9be-8c66-415d-b5ca-c58c57e4205f	07:37:15.970072	f	Object Oriented Design
587edab3cdd87052d248318511c67112	o4	c660a9be-8c66-415d-b5ca-c58c57e4205f	07:37:15.970072	f	Object Oriented Design
d2aa4287c49606207b4160853580d485	o150120509	c660a9be-8c66-415d-b5ca-c58c57e4205f	07:37:15.970072	f	Object Oriented Design
8ad7032d8a8b43c9bf7d7c84d59e21ae	o150121075	c660a9be-8c66-415d-b5ca-c58c57e4205f	07:37:15.970072	f	Object Oriented Design
8e362a1fe3e3d16ebd2b68507d12effa	o150120001	c660a9be-8c66-415d-b5ca-c58c57e4205f	07:37:15.970072	f	Object Oriented Design
981e4a40afe8a69b4944940cc3bdbde1	o1	ddca790f-f3e0-481f-9027-8dcf4f9293ca	07:38:29.309739	f	Object Oriented Design
db196ef282e84975666a798b38b9d683	o2	ddca790f-f3e0-481f-9027-8dcf4f9293ca	07:38:29.309739	f	Object Oriented Design
c9a3c45153ee7a61cf7545b354d69523	o3	ddca790f-f3e0-481f-9027-8dcf4f9293ca	07:38:29.309739	f	Object Oriented Design
5bbca4dbd28a1c1c048bc75a3547433f	o4	ddca790f-f3e0-481f-9027-8dcf4f9293ca	07:38:29.309739	f	Object Oriented Design
dd351e6b1fd7a22aa5986f7b5abcb8ae	o150120509	ddca790f-f3e0-481f-9027-8dcf4f9293ca	07:38:29.309739	f	Object Oriented Design
a2c7a5333f0ab6598a9bca75e73fdfb8	o150121075	ddca790f-f3e0-481f-9027-8dcf4f9293ca	07:38:29.309739	f	Object Oriented Design
dd59151cd88640142082b73b93327473	o150120001	ddca790f-f3e0-481f-9027-8dcf4f9293ca	07:38:29.309739	f	Object Oriented Design
450229913723f2de8393e335417a5585	o1	107cad23-10ba-447a-aa70-c541b80e3291	07:39:41.350457	f	Software Enginnering
95ada3081ef9aa2f95753e7907247aae	o2	107cad23-10ba-447a-aa70-c541b80e3291	07:39:41.350457	f	Software Enginnering
d582fd05833752cf186d6dd7cd44f3ef	o3	107cad23-10ba-447a-aa70-c541b80e3291	07:39:41.350457	f	Software Enginnering
34d44fa8ecdf64c2d8c628b14b3f02d1	o4	107cad23-10ba-447a-aa70-c541b80e3291	07:39:41.350457	f	Software Enginnering
19de8565ec91e1a2171405e44a8a5ca4	o150120509	107cad23-10ba-447a-aa70-c541b80e3291	07:39:41.350457	f	Software Enginnering
1f6c597aa7aa58a9648cb277f8d9114e	o150121075	107cad23-10ba-447a-aa70-c541b80e3291	07:39:41.350457	f	Software Enginnering
bcae0287afbc39eaeac460b12ad3b7f9	o150120001	107cad23-10ba-447a-aa70-c541b80e3291	07:39:41.350457	f	Software Enginnering
13af9d07f8045c442973e3d9687bfbd1	o1	0bb7a328-b91b-4452-90d5-8407880e0f5e	07:43:36.462596	f	Software Enginnering
4152a4088997d74d41e7a6a54bf9c8cd	o2	0bb7a328-b91b-4452-90d5-8407880e0f5e	07:43:36.462596	f	Software Enginnering
9eeca4663b4818c0c55bf70399962ef6	o3	0bb7a328-b91b-4452-90d5-8407880e0f5e	07:43:36.462596	f	Software Enginnering
67b743fc4bacf9276be1dc760a3264d6	o4	0bb7a328-b91b-4452-90d5-8407880e0f5e	07:43:36.462596	f	Software Enginnering
abd6ea5b86e2df6c6cee8a7d866742e0	o150120509	0bb7a328-b91b-4452-90d5-8407880e0f5e	07:43:36.462596	f	Software Enginnering
51a21cf2cc285b225b2bdacb6ac3704e	o150121075	0bb7a328-b91b-4452-90d5-8407880e0f5e	07:43:36.462596	f	Software Enginnering
bdd7fb480d334d37616a8334d9d6d681	o150120001	0bb7a328-b91b-4452-90d5-8407880e0f5e	07:43:36.462596	f	Software Enginnering
c553cefdac99315817bdcff012ca505c	o1	e6d0b436-76c4-4087-906e-a3d2b0acd227	07:46:37.454808	f	Software Enginnering
7ddc662e498fd9788ef2fd7f67c0b6d0	o2	e6d0b436-76c4-4087-906e-a3d2b0acd227	07:46:37.454808	f	Software Enginnering
7724eb4d6ad35b525ff29d8ee32df08b	o3	e6d0b436-76c4-4087-906e-a3d2b0acd227	07:46:37.454808	f	Software Enginnering
8c4632299c46379d3e6a6ee32d522701	o4	e6d0b436-76c4-4087-906e-a3d2b0acd227	07:46:37.454808	f	Software Enginnering
2360a86c98414d03c74570a29b9c1306	o150120509	e6d0b436-76c4-4087-906e-a3d2b0acd227	07:46:37.454808	f	Software Enginnering
d5082fe59323f5338036de73ac36ce50	o150121075	e6d0b436-76c4-4087-906e-a3d2b0acd227	07:46:37.454808	f	Software Enginnering
39ac28fb42ab3ed77716a9a4d0699841	o150120001	e6d0b436-76c4-4087-906e-a3d2b0acd227	07:46:37.454808	f	Software Enginnering
9362ab5d82aa97a6dc3b1eefa709f9f8	o1	80600200-9ed0-4141-8cc8-ef4b8d48df96	07:49:38.14641	f	Software Enginnering
1fac2198dc73c0a56ea69a4d0d4fa1c6	o2	80600200-9ed0-4141-8cc8-ef4b8d48df96	07:49:38.14641	f	Software Enginnering
6a4f14bb1a0f9c9e088aa7c6d3f5e09a	o3	80600200-9ed0-4141-8cc8-ef4b8d48df96	07:49:38.14641	f	Software Enginnering
391f78a133aa3f82d465d5b05b93ef77	o4	80600200-9ed0-4141-8cc8-ef4b8d48df96	07:49:38.14641	f	Software Enginnering
e27c9576c991ed4c09a739c4c1876325	o150120509	80600200-9ed0-4141-8cc8-ef4b8d48df96	07:49:38.14641	f	Software Enginnering
ddf68ba3d6e76e7b24d272e2712ca976	o150121075	80600200-9ed0-4141-8cc8-ef4b8d48df96	07:49:38.14641	f	Software Enginnering
d06e1fa5689cfe8a3cb7f4a1f988bbb5	o150120001	80600200-9ed0-4141-8cc8-ef4b8d48df96	07:49:38.14641	f	Software Enginnering
71d942e4671e57fa9f41acb2afaea1fa	o1	8a8c428b-e2a6-4b24-930e-87a0e70aa228	07:50:01.396043	f	Software Enginnering
9a47863328700d43e5b6be312878f293	o2	8a8c428b-e2a6-4b24-930e-87a0e70aa228	07:50:01.396043	f	Software Enginnering
c5b6bf209b91b03821d56e15e49d7fca	o3	8a8c428b-e2a6-4b24-930e-87a0e70aa228	07:50:01.396043	f	Software Enginnering
a83f854caca6b8af3c85267a699d09a9	o4	8a8c428b-e2a6-4b24-930e-87a0e70aa228	07:50:01.396043	f	Software Enginnering
36ca152a795528ab4eacf803738214a0	o150120509	8a8c428b-e2a6-4b24-930e-87a0e70aa228	07:50:01.396043	f	Software Enginnering
bde8f06caba5b8e188a42bb2bae4c0d3	o150121075	8a8c428b-e2a6-4b24-930e-87a0e70aa228	07:50:01.396043	f	Software Enginnering
5f9588891a882cec6dff99d46b17bbfb	o150120001	68827e72-3612-40f2-b59b-ddd3bc169872	07:52:23.030909	t	Software Enginnering
88be68ae1ee570893138cb3f69b3f049	o150120001	8a8c428b-e2a6-4b24-930e-87a0e70aa228	07:50:01.396043	t	Software Enginnering
70ea7a24a8d69c0e137216414f516fe5	o1	f393cef7-fab8-4fc9-95ac-2b21958cccaf	07:51:58.504017	f	Software Enginnering
26d28a5943320425315a197128a61702	o2	f393cef7-fab8-4fc9-95ac-2b21958cccaf	07:51:58.504017	f	Software Enginnering
18e77bc2fc7644ba16fa2eb7a4c6d72f	o3	f393cef7-fab8-4fc9-95ac-2b21958cccaf	07:51:58.504017	f	Software Enginnering
73757bd169de9547b9fc5320f9aab3dd	o4	f393cef7-fab8-4fc9-95ac-2b21958cccaf	07:51:58.504017	f	Software Enginnering
49ceef1f40aa32abe96620d268d10d35	o150120509	f393cef7-fab8-4fc9-95ac-2b21958cccaf	07:51:58.504017	f	Software Enginnering
a941b3297258f1dda10214807e7a6f9d	o150121075	f393cef7-fab8-4fc9-95ac-2b21958cccaf	07:51:58.504017	f	Software Enginnering
1a51c5d2a37ffae20afa9e6601d66acf	o150120001	f393cef7-fab8-4fc9-95ac-2b21958cccaf	07:51:58.504017	f	Software Enginnering
b2ce1d5f8e97bd999b484910f8f16eab	o1	68827e72-3612-40f2-b59b-ddd3bc169872	07:52:23.030909	f	Software Enginnering
d3bef81a629b64e423c1ae18d262e144	o2	68827e72-3612-40f2-b59b-ddd3bc169872	07:52:23.030909	f	Software Enginnering
53d83bb408be0568d56d421747ca41d7	o3	68827e72-3612-40f2-b59b-ddd3bc169872	07:52:23.030909	f	Software Enginnering
2ba65f299b149cb26bdff0d292511ea9	o4	68827e72-3612-40f2-b59b-ddd3bc169872	07:52:23.030909	f	Software Enginnering
2b6a5c61189722c7d3bd2b9defe398a4	o150120509	68827e72-3612-40f2-b59b-ddd3bc169872	07:52:23.030909	f	Software Enginnering
ae40dcef157f3562412eae7c75426020	o150121075	68827e72-3612-40f2-b59b-ddd3bc169872	07:52:23.030909	f	Software Enginnering
91e154973b0dc8056f47f9f45c106778	o1	45d98ea4-82d7-4131-bbd5-0bb2913f458a	07:57:49.468508	f	Software Enginnering
0e754276870da49adf413b67827e7498	o2	45d98ea4-82d7-4131-bbd5-0bb2913f458a	07:57:49.468508	f	Software Enginnering
c316cf1f22bb8781b887bb8e8f0aa6e4	o3	45d98ea4-82d7-4131-bbd5-0bb2913f458a	07:57:49.468508	f	Software Enginnering
c510fc43e8d3e8072e1c299f21545950	o4	45d98ea4-82d7-4131-bbd5-0bb2913f458a	07:57:49.468508	f	Software Enginnering
1ba4463ad147b2fba0407a6b36fa1f98	o150120509	45d98ea4-82d7-4131-bbd5-0bb2913f458a	07:57:49.468508	f	Software Enginnering
f6775f8220492ec3b2634b3f06649ada	o150121075	45d98ea4-82d7-4131-bbd5-0bb2913f458a	07:57:49.468508	f	Software Enginnering
3bac5246473d3857f117130eaadf1fb4	o150120001	45d98ea4-82d7-4131-bbd5-0bb2913f458a	07:57:49.468508	f	Software Enginnering
bf1e6ec0bb45f7beb7499c76efb844ed	o1	30986fb3-a9ae-4ebe-ae4a-a161145212e1	07:59:51.477175	f	Software Enginnering
dbfd5ecf5565d62b63f8cba2c29edd9d	o2	30986fb3-a9ae-4ebe-ae4a-a161145212e1	07:59:51.477175	f	Software Enginnering
5ab0445e4f255e9187625464b0fd64b5	o3	30986fb3-a9ae-4ebe-ae4a-a161145212e1	07:59:51.477175	f	Software Enginnering
891a2bd891ba01780fd47ff7a0cdd011	o4	30986fb3-a9ae-4ebe-ae4a-a161145212e1	07:59:51.477175	f	Software Enginnering
294afda48ad6672b6524e7c2d713dc1e	o150121075	30986fb3-a9ae-4ebe-ae4a-a161145212e1	07:59:51.477175	f	Software Enginnering
7f6b1a6823b1b7345f58e29e4c0c6c84	o150121075	e109380d-e89d-457c-8a13-2ad789b4d0c9	08:20:58.005025	t	Software Enginnering
4c702d6d2c757b3ccc7c88c1046ff199	o150120001	30986fb3-a9ae-4ebe-ae4a-a161145212e1	07:59:51.477175	t	Software Enginnering
2d23ce243c90a499679bc6be3d65bd2b	o150120509	30986fb3-a9ae-4ebe-ae4a-a161145212e1	07:59:51.477175	t	Software Enginnering
b645d13f25d38fa1a60de1e17c3f91bd	o1	61863c40-68b4-49a0-b1d3-615c11e9ea25	08:02:34.876847	f	Software Enginnering
31ed615ff3a657cf7c4e9c0e944ca25d	o2	61863c40-68b4-49a0-b1d3-615c11e9ea25	08:02:34.876847	f	Software Enginnering
3b5f9d1dfdd9241667a555caf6e2263c	o3	61863c40-68b4-49a0-b1d3-615c11e9ea25	08:02:34.876847	f	Software Enginnering
917d070824745719276257d9bfbe156d	o4	61863c40-68b4-49a0-b1d3-615c11e9ea25	08:02:34.876847	f	Software Enginnering
0813eff66730d2f964b3ed15c915fc0d	o150120509	61863c40-68b4-49a0-b1d3-615c11e9ea25	08:02:34.876847	f	Software Enginnering
fe4f85e6234f8becf26e018ee66eda18	o150121075	61863c40-68b4-49a0-b1d3-615c11e9ea25	08:02:34.876847	f	Software Enginnering
1b2d07527986b6919d1f8def5d987821	o1	0530ff17-d591-43ae-ae33-cf4b4d20d4cd	08:26:59.078343	f	Object Oriented Design
d109e7aaee75262a19de26387983c20c	o150120001	61863c40-68b4-49a0-b1d3-615c11e9ea25	08:02:34.876847	t	Software Enginnering
17726335af772fc73596a530387f5256	o1	be99803f-3b7c-47c3-b62c-3f5a178505cc	08:11:11.366968	f	Object Oriented Design
91d3054a1fbfe496c59ef1b46d2de00a	o2	be99803f-3b7c-47c3-b62c-3f5a178505cc	08:11:11.366968	f	Object Oriented Design
6a11ad7ce0ea8c3b2586115615f7d140	o3	be99803f-3b7c-47c3-b62c-3f5a178505cc	08:11:11.366968	f	Object Oriented Design
c79cb36a1b38ed14d83284f9922b8794	o4	be99803f-3b7c-47c3-b62c-3f5a178505cc	08:11:11.366968	f	Object Oriented Design
1840f8a35af29fdc1914692b77acb0a6	o2	0530ff17-d591-43ae-ae33-cf4b4d20d4cd	08:26:59.078343	f	Object Oriented Design
a6a16c97632cf7dda33ce00c39b7cd09	o3	0530ff17-d591-43ae-ae33-cf4b4d20d4cd	08:26:59.078343	f	Object Oriented Design
44079cdc3edda78c4c6fa3619c0415b4	o4	0530ff17-d591-43ae-ae33-cf4b4d20d4cd	08:26:59.078343	f	Object Oriented Design
fbd8345a07b8de51124c9bd8c1601124	o150120001	be99803f-3b7c-47c3-b62c-3f5a178505cc	08:11:11.366968	t	Object Oriented Design
0c0402fefe1d984d931755f92c077ad3	o150120509	be99803f-3b7c-47c3-b62c-3f5a178505cc	08:11:11.366968	t	Object Oriented Design
d44c1417b0c8257f894c4f926c7348bb	o150121075	be99803f-3b7c-47c3-b62c-3f5a178505cc	08:11:11.366968	t	Object Oriented Design
2a8d987d23e0f71b234feae25d2c5a05	o1	e109380d-e89d-457c-8a13-2ad789b4d0c9	08:20:58.005025	f	Software Enginnering
5eb765760d015804c5fb70e5a6b5d10d	o2	e109380d-e89d-457c-8a13-2ad789b4d0c9	08:20:58.005025	f	Software Enginnering
4129fb71e7d7d1a5f0de6a735f8ede1d	o3	e109380d-e89d-457c-8a13-2ad789b4d0c9	08:20:58.005025	f	Software Enginnering
83981e5fba40e5f38102970cbeb5b0b3	o4	e109380d-e89d-457c-8a13-2ad789b4d0c9	08:20:58.005025	f	Software Enginnering
12e722d3f224ad381734bf74bf90a011	o150120509	e109380d-e89d-457c-8a13-2ad789b4d0c9	08:20:58.005025	f	Software Enginnering
c94a4ff7b2c91bf774d356c5c81350aa	o150120001	e109380d-e89d-457c-8a13-2ad789b4d0c9	08:20:58.005025	f	Software Enginnering
d7cd697892b0e64a3084616acd92aa46	o150121075	d6426060-6331-416e-8fe9-915f3a830c70	16:20:26.905968	t	Operations Research
221beb250a897f6717348ba842c0e8dd	o150120509	0530ff17-d591-43ae-ae33-cf4b4d20d4cd	08:26:59.078343	t	Object Oriented Design
77d8e746807ede43e8916f3afb581b82	o150121075	0530ff17-d591-43ae-ae33-cf4b4d20d4cd	08:26:59.078343	t	Object Oriented Design
537bb69262cae5f725179ce5a0ed9e4f	o150120001	0530ff17-d591-43ae-ae33-cf4b4d20d4cd	08:26:59.078343	t	Object Oriented Design
0ecc85251340166ab2a3b493006564cc	o1	d6426060-6331-416e-8fe9-915f3a830c70	16:20:26.905968	f	Operations Research
b7669a36874d492a52abccadd2764c61	o2	d6426060-6331-416e-8fe9-915f3a830c70	16:20:26.905968	f	Operations Research
7f116dc706fabb34e88066d980acac94	o3	d6426060-6331-416e-8fe9-915f3a830c70	16:20:26.905968	f	Operations Research
eaf9c57caac35dc222046daa956f6d97	o4	d6426060-6331-416e-8fe9-915f3a830c70	16:20:26.905968	f	Operations Research
9152c273779d84d58a06ebe4ade30cb3	o150120509	d6426060-6331-416e-8fe9-915f3a830c70	16:20:26.905968	f	Operations Research
7db04a6786b3d84c9872c284d0d56489	o150120001	d6426060-6331-416e-8fe9-915f3a830c70	16:20:26.905968	f	Operations Research
\.


--
-- TOC entry 3979 (class 0 OID 33168)
-- Dependencies: 218
-- Data for Name: lecture; Type: TABLE DATA; Schema: public; Owner: admindb
--

COPY public.lecture (lectureid, date, lecturerid, lecturename) FROM stdin;
lec1	2023-05-20	a1	Computer Organization
lec2	2023-05-21	a2	Software Engineering
lec3	2023-05-22	a3	Formal Languages & Automata
lec4	2023-05-22	a1	Operations Research
lec5	2023-05-24	a2	Software Engineering
Instance of 'Uuid'	dateee	a1	Operations Research
09b8fbc6-8f07-4bf7-a348-255c31e2649f	dateee	a1	Computer Organization
057fd1f4-fb59-46b5-b66e-7633a6d9d227	dateee	a1	Operations Research
093d7ea8-4004-488c-a322-a051a5db2a27	dateee	a1	Operations Research
6ae5e967-4d33-40ba-8573-1c4d48e5417c	dateee	a1	Computer Organization
145efcb6-d6e7-411f-8cc5-e81d959d4817	dateee	a1	Computer Organization
17803a0a-16fa-4332-92e9-9521b4f61e9e	dateee	a1	Computer Organization
0cb9ee18-f5f2-4163-8553-eec96092e69c	dateee	a1	Computer Organization
f2ı3hfujpo	dateee	a1	Computer Organization
f2ı3hfujpoo	dateee	a1	Computer Organization
fsıuheojfe	datee	a1	Computer Organization
fsıuheojfee	datee	a1	Computer Organization
fsıuheojfeee	datee	a1	Computer Organization
fsıuheojfeeee	datee	a1	Computer Organization
wfsıuheojfeeee	datee	a1	Computer Organization
wfsıuheojfeeeed	datee	a1	Computer Organization
wfsıuheojfeeeedd	datee	a1	Computer Organization
1234	123	a1	Computer Organization
bfoıqph432314123415jkd	date	a1	Computer Organization
wfsıuheojfeeeeddea	datee	a1	Computer Organization
0e137a65-2a80-43b5-89fe-48e84b9cd4c5	dateee	a1	Computer Organization
ba6a9909-53c5-4e3a-80b2-02e4a5e3a7cf	dateee	a1	Computer Organization
3898aa66-e0dc-42a8-909c-e98f474f50b9	dateee	a1	Operations Research
04da0c20-60ca-49a6-89d6-1dd352bc99db	dateee	a1	Computer Organization
003103f9-14dd-4957-a267-5cfb91ab6c44	dateee	a1	Computer Organization
b5b539ab-048e-487b-836f-e16393a50a4c	dateee	a1	Computer Organization
fe10a0d8-a10c-4d01-885e-939ab27a63b2	dateee	a1	Operations Research
cd3b3882-5777-4ec5-bfc1-807dbd01420c	dateee	a1	Computer Organization
b66afe21-0baf-44e5-a4f8-6652dc5b8a4d	dateee	a1	Computer Organization
0c7ca06c-32d8-4622-9742-58a5696bcac8	dateee	a1	Computer Organization
d32efd5e-fd9a-40c7-851a-9bb95ffc6555	dateee	a1	Computer Organization
4305f302-5cc4-48c7-823e-c44ef54e6955	dateee	a1	Computer Organization
f0eef05d-9f48-41e4-ab76-0880e9f89adb	dateee	a1	Computer Organization
08c80772-dbef-4501-8a77-8168de399e0a	dateee	a1	Computer Organization
21b5fd6e-216c-4a6f-b339-275ff4026146	dateee	a1	Computer Organization
9ad62a6f-64a4-406c-b06f-6ddd7540c4cb	dateee	a1	Computer Organization
5b11a599-5051-4cf8-87d6-54a9d8edec10	dateee	a1	Computer Organization
134a86d5-7585-4797-a5fe-3fbe957b7e03	dateee	a1	Computer Organization
c926578f-c3b3-4d22-8712-61ee787da6e1	dateee	a1	Computer Organization
bd1e931f-3d48-48de-bab2-0cafc10cc797	dateee	a1	Computer Organization
92a4a1fc-c94f-4324-bd0a-b9dc766f2e03	dateee	a1	Operations Research
e3f7ebf7-b94d-46d3-949c-9ce688b8ec5d	dateee	a1	Computer Organization
d3c73f75-2aed-411b-9339-023d778dc8b9	dateee	a1	Computer Organization
0aa9fd36-8b4f-4427-8db2-2e373bb7a62a	dateee	a1	Computer Organization
9a698618-038d-4c57-92d4-3802011046d9	dateee	a1	Computer Organization
23fb153f-e9dc-4d31-8534-91891ef8678d	dateee	a1	Computer Organization
50189dc1-9278-4b39-be2e-7b6d23a8882f	dateee	a1	Computer Organization
03b4041e-d7ae-434d-9493-5d142f02a64b	dateee	a1	Computer Organization
6bc50cd9-5384-42b4-94b1-d39e7a7b57c3	dateee	a1	Computer Organization
5cf34c34-20cc-4602-9187-1801f099d758	dateee	a1	Computer Organization
0c8e4d13-3e0b-4d56-836a-f9a647e4ab0b	dateee	a1	Computer Organization
49d48e5c-4f54-4436-81a5-612a9b2ec3fe	dateee	a1	Computer Organization
c7eb13d0-e7e8-4c3f-a1be-fb9b0a7ad184	dateee	a1	Computer Organization
226744fe-4bb6-4329-8228-5fec9fc8e4f0	dateee	a1	Computer Organization
81c1a91f-36a6-41f0-a450-3136213d5c84	dateee	a1	Computer Organization
2295f0f0-fd4e-4671-be0b-1320f76b771b	dateee	a1	Computer Organization
040ddce8-d43f-4179-b570-5ec7de167505	dateee	a1	Computer Organization
821f2f77-72fb-4bb9-aed0-800b43fcf36f	2024-05-29 21:39:59.132884	a1	Computer Organization
0bba569b-7995-4e14-b759-38153570dc60	2024-05-29 21:45:59	a1	Computer Organization
b3bee083-5edf-40c2-bdd5-a975d7810a04	2024-05-29 21:56:14	a1	Operations Research
7b9b4150-3ef3-4568-a6f0-01502ca38618	2024-05-29 22:06:33	a1	Operations Research
915b874c-67d3-4b8f-92ef-3cb972e7e5df	2024-05-29 22:09:35	a1	Computer Organization
500b5531-740d-4bb3-bc4d-164012c657fc	2024-05-29 22:13:47	a1	Computer Organization
a32435ee-fef9-452e-b33c-c0da9413b96d	2024-05-30 10:33:00	amehmetkaya	Software Enginnering
c660a9be-8c66-415d-b5ca-c58c57e4205f	2024-05-30 10:37:14	amehmetkaya	Object Oriented Design
ddca790f-f3e0-481f-9027-8dcf4f9293ca	2024-05-30 10:38:27	amehmetkaya	Object Oriented Design
107cad23-10ba-447a-aa70-c541b80e3291	2024-05-30 10:39:39	amehmetkaya	Software Enginnering
0bb7a328-b91b-4452-90d5-8407880e0f5e	2024-05-30 10:43:34	amehmetkaya	Software Enginnering
e6d0b436-76c4-4087-906e-a3d2b0acd227	2024-05-30 10:46:35	amehmetkaya	Software Enginnering
80600200-9ed0-4141-8cc8-ef4b8d48df96	2024-05-30 10:49:36	amehmetkaya	Software Enginnering
8a8c428b-e2a6-4b24-930e-87a0e70aa228	2024-05-30 10:49:59	amehmetkaya	Software Enginnering
f393cef7-fab8-4fc9-95ac-2b21958cccaf	2024-05-30 10:51:56	amehmetkaya	Software Enginnering
68827e72-3612-40f2-b59b-ddd3bc169872	2024-05-30 10:52:21	amehmetkaya	Software Enginnering
45d98ea4-82d7-4131-bbd5-0bb2913f458a	2024-05-30 10:57:47	amehmetkaya	Software Enginnering
30986fb3-a9ae-4ebe-ae4a-a161145212e1	2024-05-30 10:59:50	amehmetkaya	Software Enginnering
61863c40-68b4-49a0-b1d3-615c11e9ea25	2024-05-30 11:02:33	amehmetkaya	Software Enginnering
be99803f-3b7c-47c3-b62c-3f5a178505cc	2024-05-30 11:11:09	amehmetkaya	Object Oriented Design
e109380d-e89d-457c-8a13-2ad789b4d0c9	2024-05-30 11:20:56	amehmetkaya	Software Enginnering
0530ff17-d591-43ae-ae33-cf4b4d20d4cd	2024-05-30 11:26:57	amehmetkaya	Object Oriented Design
d6426060-6331-416e-8fe9-915f3a830c70	2024-05-30 19:20:25	a1	Operations Research
\.


--
-- TOC entry 3984 (class 0 OID 33222)
-- Dependencies: 223
-- Data for Name: lecturelist; Type: TABLE DATA; Schema: public; Owner: admindb
--

COPY public.lecturelist (lecturelistid, lecturerid, lecturename) FROM stdin;
1	a1	Computer Organization
2	a2	Software Engineering
3	a3	Formal Languages & Automata
4	a1	Operations Research
5	amehmetkaya	Software Enginnering
6	amehmetkaya	Object Oriented Design
\.


--
-- TOC entry 3986 (class 0 OID 33252)
-- Dependencies: 225
-- Data for Name: lectureliststudent; Type: TABLE DATA; Schema: public; Owner: admindb
--

COPY public.lectureliststudent (lectureliststudentid, studentid, lecturename) FROM stdin;
1	o1	Computer Organization
3	o3	Formal Languages & Automata
4	o1	Operations Research
5	o150120509	Software Engineering
6	o150120001	Software Engineering
7	o150120509	Object Oriented Desing
8	o150121075	Object Oriented Desing
9	o150120001	Object Oriented Desing
\.


--
-- TOC entry 3980 (class 0 OID 33175)
-- Dependencies: 219
-- Data for Name: lecturer; Type: TABLE DATA; Schema: public; Owner: admindb
--

COPY public.lecturer (lecturerid) FROM stdin;
a1
a2
a3
a4
mehmetkaya
amehmetkaya
\.


--
-- TOC entry 3982 (class 0 OID 33187)
-- Dependencies: 221
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: admindb
--

COPY public.student (studentid) FROM stdin;
o1
o2
o3
o4
o150120509
o150121075
o150120001
\.


--
-- TOC entry 3981 (class 0 OID 33180)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admindb
--

COPY public.users (userid, username, userpassword) FROM stdin;
o1	student1	password4
o2	student2	password5
o3	student3	password6
a1	lecturer1	password7
a2	lecturer2	password8
a3	lecturer3	password9
o4	student4	password9
a4	lecturer4	password0
mehmetkaya	mehmetkaya	password7
o150120001	o150120001	password7
o150120509	o150120509	password7
o150121075	o150121075	password7
amehmetkaya	password7	password7
\.


--
-- TOC entry 4071 (class 0 OID 0)
-- Dependencies: 222
-- Name: lecturelist_lecturelistid_seq; Type: SEQUENCE SET; Schema: public; Owner: admindb
--

SELECT pg_catalog.setval('public.lecturelist_lecturelistid_seq', 6, true);


--
-- TOC entry 4072 (class 0 OID 0)
-- Dependencies: 224
-- Name: lectureliststudent_lectureliststudentid_seq; Type: SEQUENCE SET; Schema: public; Owner: admindb
--

SELECT pg_catalog.setval('public.lectureliststudent_lectureliststudentid_seq', 9, true);


--
-- TOC entry 3813 (class 2606 OID 33167)
-- Name: attendance attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: admindb
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_pkey PRIMARY KEY (attendanceid);


--
-- TOC entry 3815 (class 2606 OID 33174)
-- Name: lecture lecture_pkey; Type: CONSTRAINT; Schema: public; Owner: admindb
--

ALTER TABLE ONLY public.lecture
    ADD CONSTRAINT lecture_pkey PRIMARY KEY (lectureid);


--
-- TOC entry 3823 (class 2606 OID 33229)
-- Name: lecturelist lecturelist_pkey; Type: CONSTRAINT; Schema: public; Owner: admindb
--

ALTER TABLE ONLY public.lecturelist
    ADD CONSTRAINT lecturelist_pkey PRIMARY KEY (lecturelistid);


--
-- TOC entry 3825 (class 2606 OID 33259)
-- Name: lectureliststudent lectureliststudent_pkey; Type: CONSTRAINT; Schema: public; Owner: admindb
--

ALTER TABLE ONLY public.lectureliststudent
    ADD CONSTRAINT lectureliststudent_pkey PRIMARY KEY (lectureliststudentid);


--
-- TOC entry 3817 (class 2606 OID 33179)
-- Name: lecturer lecturer_pkey; Type: CONSTRAINT; Schema: public; Owner: admindb
--

ALTER TABLE ONLY public.lecturer
    ADD CONSTRAINT lecturer_pkey PRIMARY KEY (lecturerid);


--
-- TOC entry 3821 (class 2606 OID 33191)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: admindb
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (studentid);


--
-- TOC entry 3819 (class 2606 OID 33186)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admindb
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- TOC entry 3833 (class 2620 OID 33236)
-- Name: lecture add_attendance; Type: TRIGGER; Schema: public; Owner: admindb
--

CREATE TRIGGER add_attendance AFTER INSERT ON public.lecture FOR EACH ROW EXECUTE FUNCTION public.add_attendance_trigger();


--
-- TOC entry 3834 (class 2620 OID 33218)
-- Name: users user_insert_trigger; Type: TRIGGER; Schema: public; Owner: admindb
--

CREATE TRIGGER user_insert_trigger AFTER INSERT ON public.users FOR EACH ROW EXECUTE FUNCTION public.add_user_to_appropriate_table();


--
-- TOC entry 3826 (class 2606 OID 33192)
-- Name: attendance attendance_lectureid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admindb
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_lectureid_fkey FOREIGN KEY (lectureid) REFERENCES public.lecture(lectureid);


--
-- TOC entry 3827 (class 2606 OID 33197)
-- Name: attendance attendance_studentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admindb
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_studentid_fkey FOREIGN KEY (studentid) REFERENCES public.student(studentid);


--
-- TOC entry 3831 (class 2606 OID 33230)
-- Name: lecturelist fk_lecturer; Type: FK CONSTRAINT; Schema: public; Owner: admindb
--

ALTER TABLE ONLY public.lecturelist
    ADD CONSTRAINT fk_lecturer FOREIGN KEY (lecturerid) REFERENCES public.lecturer(lecturerid);


--
-- TOC entry 3832 (class 2606 OID 33260)
-- Name: lectureliststudent fk_student; Type: FK CONSTRAINT; Schema: public; Owner: admindb
--

ALTER TABLE ONLY public.lectureliststudent
    ADD CONSTRAINT fk_student FOREIGN KEY (studentid) REFERENCES public.student(studentid);


--
-- TOC entry 3828 (class 2606 OID 33202)
-- Name: lecture lecture_lecturerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admindb
--

ALTER TABLE ONLY public.lecture
    ADD CONSTRAINT lecture_lecturerid_fkey FOREIGN KEY (lecturerid) REFERENCES public.lecturer(lecturerid);


--
-- TOC entry 3829 (class 2606 OID 33207)
-- Name: lecturer lecturer_lecturerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admindb
--

ALTER TABLE ONLY public.lecturer
    ADD CONSTRAINT lecturer_lecturerid_fkey FOREIGN KEY (lecturerid) REFERENCES public.users(userid);


--
-- TOC entry 3830 (class 2606 OID 33212)
-- Name: student student_studentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admindb
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_studentid_fkey FOREIGN KEY (studentid) REFERENCES public.users(userid);


--
-- TOC entry 3994 (class 0 OID 0)
-- Dependencies: 226
-- Name: FUNCTION pg_replication_origin_advance(text, pg_lsn); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_advance(text, pg_lsn) TO azure_pg_admin;


--
-- TOC entry 3995 (class 0 OID 0)
-- Dependencies: 241
-- Name: FUNCTION pg_replication_origin_create(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_create(text) TO azure_pg_admin;


--
-- TOC entry 3996 (class 0 OID 0)
-- Dependencies: 232
-- Name: FUNCTION pg_replication_origin_drop(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_drop(text) TO azure_pg_admin;


--
-- TOC entry 3997 (class 0 OID 0)
-- Dependencies: 233
-- Name: FUNCTION pg_replication_origin_oid(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_oid(text) TO azure_pg_admin;


--
-- TOC entry 3998 (class 0 OID 0)
-- Dependencies: 234
-- Name: FUNCTION pg_replication_origin_progress(text, boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_progress(text, boolean) TO azure_pg_admin;


--
-- TOC entry 3999 (class 0 OID 0)
-- Dependencies: 235
-- Name: FUNCTION pg_replication_origin_session_is_setup(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_is_setup() TO azure_pg_admin;


--
-- TOC entry 4000 (class 0 OID 0)
-- Dependencies: 236
-- Name: FUNCTION pg_replication_origin_session_progress(boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_progress(boolean) TO azure_pg_admin;


--
-- TOC entry 4001 (class 0 OID 0)
-- Dependencies: 242
-- Name: FUNCTION pg_replication_origin_session_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_reset() TO azure_pg_admin;


--
-- TOC entry 4002 (class 0 OID 0)
-- Dependencies: 237
-- Name: FUNCTION pg_replication_origin_session_setup(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_setup(text) TO azure_pg_admin;


--
-- TOC entry 4003 (class 0 OID 0)
-- Dependencies: 238
-- Name: FUNCTION pg_replication_origin_xact_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_reset() TO azure_pg_admin;


--
-- TOC entry 4004 (class 0 OID 0)
-- Dependencies: 239
-- Name: FUNCTION pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone) TO azure_pg_admin;


--
-- TOC entry 4005 (class 0 OID 0)
-- Dependencies: 243
-- Name: FUNCTION pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn) TO azure_pg_admin;


--
-- TOC entry 4006 (class 0 OID 0)
-- Dependencies: 227
-- Name: FUNCTION pg_stat_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset() TO azure_pg_admin;


--
-- TOC entry 4007 (class 0 OID 0)
-- Dependencies: 228
-- Name: FUNCTION pg_stat_reset_shared(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_shared(text) TO azure_pg_admin;


--
-- TOC entry 4008 (class 0 OID 0)
-- Dependencies: 230
-- Name: FUNCTION pg_stat_reset_single_function_counters(oid); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_function_counters(oid) TO azure_pg_admin;


--
-- TOC entry 4009 (class 0 OID 0)
-- Dependencies: 229
-- Name: FUNCTION pg_stat_reset_single_table_counters(oid); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_table_counters(oid) TO azure_pg_admin;


--
-- TOC entry 4010 (class 0 OID 0)
-- Dependencies: 100
-- Name: COLUMN pg_config.name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(name) ON TABLE pg_catalog.pg_config TO azure_pg_admin;


--
-- TOC entry 4011 (class 0 OID 0)
-- Dependencies: 100
-- Name: COLUMN pg_config.setting; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(setting) ON TABLE pg_catalog.pg_config TO azure_pg_admin;


--
-- TOC entry 4012 (class 0 OID 0)
-- Dependencies: 96
-- Name: COLUMN pg_hba_file_rules.line_number; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(line_number) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4013 (class 0 OID 0)
-- Dependencies: 96
-- Name: COLUMN pg_hba_file_rules.type; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(type) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4014 (class 0 OID 0)
-- Dependencies: 96
-- Name: COLUMN pg_hba_file_rules.database; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(database) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4015 (class 0 OID 0)
-- Dependencies: 96
-- Name: COLUMN pg_hba_file_rules.user_name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(user_name) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4016 (class 0 OID 0)
-- Dependencies: 96
-- Name: COLUMN pg_hba_file_rules.address; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(address) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4017 (class 0 OID 0)
-- Dependencies: 96
-- Name: COLUMN pg_hba_file_rules.netmask; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(netmask) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4018 (class 0 OID 0)
-- Dependencies: 96
-- Name: COLUMN pg_hba_file_rules.auth_method; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(auth_method) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4019 (class 0 OID 0)
-- Dependencies: 96
-- Name: COLUMN pg_hba_file_rules.options; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(options) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4020 (class 0 OID 0)
-- Dependencies: 96
-- Name: COLUMN pg_hba_file_rules.error; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(error) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- TOC entry 4021 (class 0 OID 0)
-- Dependencies: 146
-- Name: COLUMN pg_replication_origin_status.local_id; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(local_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 4022 (class 0 OID 0)
-- Dependencies: 146
-- Name: COLUMN pg_replication_origin_status.external_id; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(external_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 4023 (class 0 OID 0)
-- Dependencies: 146
-- Name: COLUMN pg_replication_origin_status.remote_lsn; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(remote_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 4024 (class 0 OID 0)
-- Dependencies: 146
-- Name: COLUMN pg_replication_origin_status.local_lsn; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(local_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- TOC entry 4025 (class 0 OID 0)
-- Dependencies: 101
-- Name: COLUMN pg_shmem_allocations.name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(name) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 4026 (class 0 OID 0)
-- Dependencies: 101
-- Name: COLUMN pg_shmem_allocations.off; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(off) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 4027 (class 0 OID 0)
-- Dependencies: 101
-- Name: COLUMN pg_shmem_allocations.size; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 4028 (class 0 OID 0)
-- Dependencies: 101
-- Name: COLUMN pg_shmem_allocations.allocated_size; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(allocated_size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- TOC entry 4029 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.starelid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(starelid) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4030 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.staattnum; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staattnum) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4031 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stainherit; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stainherit) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4032 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stanullfrac; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanullfrac) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4033 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stawidth; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stawidth) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4034 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stadistinct; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stadistinct) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4035 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stakind1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4036 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stakind2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4037 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stakind3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4038 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stakind4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4039 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stakind5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4040 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.staop1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4041 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.staop2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4042 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.staop3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4043 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.staop4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4044 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.staop5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4045 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stacoll1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4046 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stacoll2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4047 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stacoll3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4048 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stacoll4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4049 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stacoll5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4050 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stanumbers1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4051 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stanumbers2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4052 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stanumbers3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4053 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stanumbers4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4054 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stanumbers5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4055 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stavalues1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4056 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stavalues2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4057 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stavalues3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4058 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stavalues4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4059 (class 0 OID 0)
-- Dependencies: 41
-- Name: COLUMN pg_statistic.stavalues5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- TOC entry 4060 (class 0 OID 0)
-- Dependencies: 66
-- Name: COLUMN pg_subscription.oid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(oid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4061 (class 0 OID 0)
-- Dependencies: 66
-- Name: COLUMN pg_subscription.subdbid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subdbid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4062 (class 0 OID 0)
-- Dependencies: 66
-- Name: COLUMN pg_subscription.subname; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4063 (class 0 OID 0)
-- Dependencies: 66
-- Name: COLUMN pg_subscription.subowner; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subowner) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4064 (class 0 OID 0)
-- Dependencies: 66
-- Name: COLUMN pg_subscription.subenabled; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subenabled) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4065 (class 0 OID 0)
-- Dependencies: 66
-- Name: COLUMN pg_subscription.subconninfo; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subconninfo) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4066 (class 0 OID 0)
-- Dependencies: 66
-- Name: COLUMN pg_subscription.subslotname; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subslotname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4067 (class 0 OID 0)
-- Dependencies: 66
-- Name: COLUMN pg_subscription.subsynccommit; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subsynccommit) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- TOC entry 4068 (class 0 OID 0)
-- Dependencies: 66
-- Name: COLUMN pg_subscription.subpublications; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subpublications) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


-- Completed on 2024-05-30 23:09:03 +03

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-05-30 23:09:03 +03

--
-- PostgreSQL database cluster dump complete
--

