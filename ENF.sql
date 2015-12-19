/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2015/12/2 23:31:34                           */
/*==============================================================*/
create database nengrongweb;
use nengrongweb;

drop table if exists ENF_Area;

drop table if exists ENF_Doc;

drop table if exists ENF_Ground;

drop table if exists ENF_Housetop;

drop table if exists ENF_Project;

drop table if exists ENF_PushProject;

drop table if exists ENF_User;

drop table if exists ENF_Admin;

/*==============================================================*/
/* Table: ENF_Area                                              */
/*==============================================================*/
create table ENF_Area
(
   id                   varchar(10) not null comment 'id',
   area                 varchar(50) not null comment '��������',
   parent_id            varchar(10) not null comment '����id',
   primary key (id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table ENF_Area comment '������';

/*==============================================================*/
/* Table: ENF_Doc                                               */
/*==============================================================*/
create table ENF_Doc
(
   id                   bigint not null auto_increment,
   file_name            varchar(100) not null comment '�ļ�����',
   file_rename          varchar(100) not null comment '�ļ��ض�������url',
   update_date          datetime not null comment '�ϴ�ʱ��',
   primary key (id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table ENF_Doc comment '������';

/*==============================================================*/
/* Table: ENF_Ground                                            */
/*==============================================================*/
create table ENF_Ground
(
   id                   bigint not null auto_increment,
   project_id           bigint not null comment '������Ŀid',
   ground_property      int comment '�������ʣ�1һ��ũ�2�ֵء�3�ĵء�4������5����ũ�',
   ground_area          double comment '�����������',
   rent_time            double comment '��������',
   rent_pay             double comment '�������',
   ground_condition     int comment '����ƽ�������1ƽ�ء�2ɽ�¡�3ˮ�棩',
   has_shelter          varchar(8) comment '���������ڵ�',
   has_pollute          varchar(8) comment '������ȾԴ',
   transformer_volume   double comment '�ϼ���ѹ������',
   synchronize_level    varchar(50) comment '������ѹ�ȼ�',
   electricity_distance double comment '������������',
   measure_point        int comment '�����㣨1վ�ڡ�2���վ��',
   plan_build_volume    double comment '�⽨������',
   project_holder_type  int comment '��Ŀ֧�����ͣ�1����̶�ʽ��2���ᡢ3˫�ᣩ',
   project_type         int comment '��Ŀ���ͣ�1���桢2ũ�⻥����3��⻥����',
   cooperation_type     varchar(30) comment '��������������ʽ',
   plan_financing       double comment '�����ʽ��',
   financing_type       int comment '���ʷ�ʽ��1�������ޣ�ֱ�⣩��2�������ޣ����⣩��3��Ȩ���ʣ�',
   company_invest       double comment '��λͶ��',
   company_EPC          varchar(100) comment 'EPC����',
   capacity_level       varchar(50) comment '���ʵȼ�',
   company_component    varchar(100) comment '�������',
   component_type       varchar(100) comment '�������ͺż�����',
   company_inverter     varchar(100) comment '���������',
   inverter_type        varchar(100) comment '���������ͺż�����',
   synchronize_date     date comment '����ʱ�䣨date��',
   electricity_data     varchar(100) comment '��ʷ���������ݣ����һ�꣩������URL��',
   project_backup       varchar(100) comment '��Ŀ����������URL��',
   electricity_backup   varchar(100) comment '�������뱸��������URL��',
   ground_rent_agreement varchar(100) comment '��������Э�飨����URL��',
   rent_time2           double comment '��������',
   rent_pay2            double comment '�������',
   ground_opinion       varchar(100) comment '����Ԥ�����������URL��',
   project_proposal     varchar(100) comment '��Ŀ�����飨����URL��',
   project_report       varchar(100) comment '��Ŀ���б��棨����URL��',
   environment_assessment varchar(100) comment '����������URL��',
   land_certificate     varchar(100) comment '����֤������URL��',
   electricity_price_reply varchar(100) comment '��۾ֵ������������URL��',
   is_old_project       varchar(100) comment '�Ƿ���뵱��ʡ�����ĿĿ¼������URL��',
   completion_report    varchar(100) comment '�������ձ��棨����URL��',
   completion_paper     varchar(100) comment '����ͼֽ������URL��',
   history_data         varchar(100) comment '��ʷ���������ݣ�����URL��',
   electricity_bill     varchar(100) comment '��ѽ���Ʊ�ݣ�����URL��',
   comment              varchar(500) comment '��ע',
   create_date          datetime comment '����ʱ��',
   change_date          datetime comment '�޸�ʱ��',
   status               int not null comment '״̬���ͣ�0������1�Ѽ��2δ���11δ�ύ��12���ύδ�鿴��ҵ��Ա�������������13���ύ�Ѳ鿴��21ǩ�����ͬ���������ͣ���22ǩ�����ͬ��31ǩ���ʺ�ͬ��41�����͡�42δ���͡�9999ɾ��',
   primary key (id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table ENF_Ground comment '���͵����վ/����ֲ�ʽ';

/*==============================================================*/
/* Table: ENF_Housetop                                          */
/*==============================================================*/
create table ENF_Housetop
(
   id                   bigint not null auto_increment,
   project_id           bigint not null comment '������Ŀid',
   housetop_owner       varchar(50) comment '�ݶ�ҵ������',
   company_type         int comment '��ҵ���ͣ�1����2����3˽��',
   company_capital      double comment 'ҵ����ҵע���ʱ�',
   housetop_property_prove varchar(8) comment '�ݶ���Ȩ֤������/�ޣ�',
   electricity_total    double comment '���õ���',
   electricity_pay      double comment '���',
   electricity_pay_list varchar(100) comment '���һ������ϸ������URL��',
   housetop_type        varchar(50) comment '�ݶ�����',
   housetop_area        double comment '�ݶ����',
   housetop_age         int comment '�ݶ�ʹ������',
   housetop_direction   varchar(30) comment '�ݶ�����',
   housetop_waterproof_time double comment '�ݶ���ˮ����',
   housetop_load        double comment '�ݶ����غ�',
   has_shelter          varchar(8) comment '���������ڵ�',
   has_pollution        varchar(8) comment '������ȾԴ',
   transformer_capacity double comment '�ϼ���ѹ������',
   voltage_level        double comment '������ѹ�ȼ�',
   synchronize_type     int comment '������ʽ��1�Է����á�2ȫ��������3�Է�����ȫ��������',
   electricity_distance double comment '������������',
   plan_build_volume    double comment '�⽨������',
   cooperation_type     varchar(30) comment '��������������ʽ',
   plan_financing       double comment '�����ʽ��',
   financing_type       int comment '���ʷ�ʽ��1�������ޣ�ֱ�⣩��2�������ޣ����⣩��3��Ȩ���ʣ�',
   company_invest       double comment '��λͶ��',
   company_EPC          varchar(100) comment 'EPC����',
   capacity_level       varchar(50) comment '���ʵȼ�',
   company_component    varchar(100) comment '�������',
   component_type       varchar(100) comment '�������ͺż�����',
   company_inverter     varchar(100) comment '���������',
   inverter_type        varchar(100) comment '���������ͺż�����',
   synchronize_date     date comment '����ʱ��',
   electricity_data     varchar(100) comment '��ʷ���������ݣ����һ�꣩',
   project_backup       varchar(100) comment '��Ŀ����������URL��',
   electricity_backup   varchar(100) comment '�������뱸��������URL��',
   house_rent_agreement varchar(100) comment '�ݶ�����Э�飨����URL��',
   rent_time            double comment '��������',
   rent_pay             double comment '�������',
   power_manage_agreement varchar(100) comment '��ͬ��Դ����Э�飨����URL��',
   electricity_clear_type int comment '��۽��㷽ʽ��1���ƽ��۴��ۡ�2ƽ����۴��ۡ�3�̶���ۣ�',
   electricity_clear    varchar(100) comment '�����ۣ�����URL��',
   project_proposal     varchar(100) comment '��Ŀ�����飨����URL��',
   project_report       varchar(100) comment '��Ŀ���б��棨����URL��',
   housetop_load_prove  varchar(100) comment '�ݶ��غ�֤��������URL��',
   completion_report    varchar(100) comment '�������ձ��棨����URL��',
   completion_paper     varchar(100) comment '����ͼֽ������URL��',
   history_data         varchar(100) comment '��ʷ��������/�������ݣ�����URL��',
   electricity_bill     varchar(100) comment '��ѽ���Ʊ�ݣ�����URL��',
   comment              varchar(500) comment '��ע',
   create_date          datetime comment '����ʱ��',
   change_date          datetime comment '�޸�ʱ��',
   status               int not null comment '״̬���ͣ�0������1�Ѽ��2δ���11δ�ύ��12���ύδ�鿴��ҵ��Ա�������������13���ύ�Ѳ鿴��21ǩ�����ͬ���������ͣ���22ǩ�����ͬ��31ǩ���ʺ�ͬ��41�����͡�42δ���͡�9999ɾ��',
   primary key (id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table ENF_Housetop comment '�ݶ��ֲ���Ŀ��';

/*==============================================================*/
/* Table: ENF_Project                                           */
/*==============================================================*/
create table ENF_Project
(
   id                   bigint not null auto_increment,
   project_code         varchar(30) not null unique comment '��Ŀ���',
   project_type         int comment '��Ŀ���ͣ�1�ݶ��ֲ�ʽ��2����ֲ�ʽ��3���͵���',
   build_state          int comment '����״̬��1δ����2�ѽ�',
   project_area         varchar(50) comment '��Ŀλ��',
   picture1             varchar(100) comment 'ͼƬ1URL',
   picture2             varchar(100) comment 'ͼƬ2URL',
   picture3             varchar(100) comment 'ͼƬ3URL',
   picture4             varchar(100) comment 'ͼƬ4URL',
   picture5             varchar(100) comment 'ͼƬ5URL',
   picture6             varchar(100) comment 'ͼƬ6URL',
   picture7             varchar(100) comment 'ͼƬ7URL',
   picture8             varchar(100) comment 'ͼƬ8URL',
   picture9             varchar(100) comment 'ͼƬ9URL',
   picture10            varchar(100) comment 'ͼƬ10URL',
   picture11            varchar(100) comment 'ͼƬ11URL',
   picture12            varchar(100) comment 'ͼƬ12URL',
   contract             varchar(100) comment '��ͬ��docID',
   create_date          datetime comment '����ʱ��',
   change_date          datetime comment '�޸�ʱ��',
   status               int not null comment '״̬���ͣ�0������1�Ѽ��2δ���11δ�ύ��12���ύδ�鿴��ҵ��Ա�������������13���ύ�Ѳ鿴��21ǩ�����ͬ���������ͣ���22ǩ�����ͬ��31ǩ���ʺ�ͬ��41�����͡�42δ���͡�9999ɾ��',
   primary key (id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

/*==============================================================*/
/* Table: ENF_PushProject                                       */
/*==============================================================*/
create table ENF_PushProject
(
   id                   bigint not null auto_increment,
   email                varchar(100) comment 'Ͷ��������',
   project_code         varchar(100) comment '��Ŀ���',
   push_time            datetime comment '����ʱ��',
   status               int not null comment '״̬���ͣ�0������1�Ѽ��2δ���11δ�ύ��12���ύδ�鿴��ҵ��Ա�������������13���ύ�Ѳ鿴��21ǩ�����ͬ���������ͣ���22ǩ�����ͬ��31ǩ���ʺ�ͬ��41�����͡�42δ���͡�9999ɾ��',
   primary key (id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table ENF_PushProject comment '���͵�Ͷ�ʷ�����Ŀ��';

/*==============================================================*/
/* Table: ENF_User                                              */
/*==============================================================*/
create table ENF_User
(
   id                   bigint not null auto_increment,
   email                varchar(100) not null unique comment 'ע������',
   password             varchar(100) not null comment '����',
   user_type            int not null comment '�û����ͣ�1����Ա��2ҵ��Ա��3��Ŀ�ṩ����4Ͷ����',
   code					varchar(100) unique comment 'ҵ��Ա����',
   name					varchar(20) comment 'ҵ��Ա����',
   company_name         varchar(100) comment '��ҵ����',
   company_type         int comment '��ҵע���ʱ�/���ͣ�1�������2������ʡ�3���̶��ʡ�4������Ӫ��5С����Ӫ',
   company_person       varchar(100) comment '��ҵ����',
   company_capital      float comment '��ҵע���ʱ�',
   company_fax          varchar(20) comment '��˾����',
   company_phone        varchar(20) comment '����',
   company_telephone    varchar(11) comment '�����ֻ�',
   company_area         varchar(50) comment '���ڵ���',
   company_address      varchar(100) comment '��ϸ��ַ',
   company_contacts     varchar(100) comment '��ϵ��',
   company_contacts_phone varchar(11) comment '��ϵ���ֻ�',
   company_contacts_position varchar(100) comment '��ϵ��ְ��',
   business_license     varchar(100) comment '��˾Ӫҵִ��URL',
   organization_code    varchar(100) comment '��֯��������֤URL',
   national_tax_certificate varchar(100) comment '��˰�Ǽ�֤URL',
   local_tax_certificate varchar(100) comment '��˰�Ǽ�֤URL',
   identity_card_front  varchar(100) comment '�������֤����URL',
   identity_card_back   varchar(100) comment '�������֤����URL',
   financial_audit      varchar(20) comment '������Ʊ����docID',
   create_date          datetime comment '����ʱ��',
   change_date          datetime comment '�޸�ʱ��',
   status               int not null default 0 comment '״̬���ͣ�0������1�Ѽ��2δ���11δ�ύ��12���ύδ�鿴��ҵ��Ա�������������13���ύ�Ѳ鿴��21ǩ�����ͬ���������ͣ���22ǩ�����ͬ��31ǩ���ʺ�ͬ��41�����͡�42δ���͡�9999ɾ��',
   primary key (id),
   INDEX `mail` (`email`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table ENF_User comment '�û���';

/*==============================================================*/
/* Table: ENF_Admin                                           */
/*==============================================================*/
create table ENF_Admin
(
   id                   bigint not null auto_increment,
   user_name            varchar(100) not null unique comment '�û���',
   password             varchar(100) not null comment '����',
   primary key (id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table ENF_Admin comment '����Ա��';

