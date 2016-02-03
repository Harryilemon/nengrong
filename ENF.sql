/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2015/12/2 23:31:34                           */
/*==============================================================*/
create database nengrongweb;
use nengrongweb;

drop table if exists enf_area;

drop table if exists enf_doc;

drop table if exists enf_evaluation;

drop table if exists enf_ground;

drop table if exists enf_housetop;

drop table if exists enf_project;

drop table if exists enf_pushproject;

drop table if exists enf_user;

drop table if exists enf_admin;

drop table if exists enf_component;

drop table if exists enf_inverter;

/*==============================================================*/
/* Table: enf_Area                                              */
/*==============================================================*/
create table enf_area
(
   id                   varchar(10) not null comment 'id',
   area                 varchar(50) not null comment '��������',
   parent_id            varchar(10) not null comment '����id',
   primary key (id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table enf_area comment '������';

/*==============================================================*/
/* Table: enf_Doc                                               */
/*==============================================================*/
create table enf_doc
(
   id                   bigint not null auto_increment,
   file_name            varchar(100) not null comment '�ļ�����',
   file_rename          varchar(100) not null comment '�ļ��ض�������url',
   file_size            double not null comment '�ļ���Сbit',
   update_date          datetime not null comment '�ϴ�ʱ��',
   primary key (id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table enf_doc comment '������';

/*==============================================================*/
/* Table: enf_Evaluation                                        */
/*==============================================================*/
create table enf_evaluation
(
   id                   bigint not null auto_increment,
   project_id           bigint comment '������Ŀid',
   IRR                  double comment '�ڲ�������',
   evaluation_result    varchar(10) comment '���۽��',
   static_payback_time  double comment '��̬Ͷ�ʻ�����',
   dynamic_payback_time double comment '��̬Ͷ�ʻ�����',
   LCOE                 double comment 'LCOE',
   npv                  double comment '����ֵ',
   power_asset_current_value double comment '��վ�ʲ��ۼ���ֵ',
   evaluation_content   varchar(600) comment '��������',
   document_review      varchar(600) comment '�ļ����',
   project_quality_situation varchar(600) comment '���̽���������ϵͳ�������',
   project_invest_situation varchar(600) comment '��Ŀ����Ͷ�����',
   project_earnings_situation varchar(600) comment '��Ŀ�����������',
   doc_mul              varchar(100) comment '��������',
   create_date          datetime comment '����ʱ��',
   change_date          datetime comment '�޸�ʱ��',
   status               int not null default 0 comment '״̬���ͣ�0������11��Ŀδ�ύ��12��Ŀ���ύ�����ύ����13���ύ�����飨���ύ����21��ǩ�����ͬ��δ��ְ���飩��22���ύ��ְ���飨δǩ�����ͬ����23��ǩ�����ͬ���Ѿ�ְ���飩��31��ǩ���ʺ�ͬ��41�����͡�42δ���͡�51��ְ���鱣��״̬����ְ���鱣�����Ŀ״̬����52��ְ�����ύ״̬��61�����鱣��״̬',
   delete_flag int not null default 0 comment 'ɾ����ǣ�0������9999ɾ��',
   primary key (id),
   INDEX `evaluation_project_id` (`project_id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table enf_evaluation comment '��ְ�����';

/*==============================================================*/
/* Table: enf_Ground                                            */
/*==============================================================*/
create table enf_ground
(
   id                   bigint not null auto_increment,
   project_id           bigint not null comment '������Ŀid',
   project_intent       text comment '��Ŀ������',
   project_area         varchar(10) comment '��Ŀ����',
   project_address      varchar(60) comment '��Ŀ��ϸ��ַ',
   picture_full         varchar(100) comment '����ȫ��',
   picture_field        varchar(100) comment '��ƽͼƬ',
   picture_transformer  varchar(100) comment '���վͼƬ',
   picture_mul          varchar(100) comment '��̬ͼƬ����', 
   contract             varchar(20) comment '��ͬ��docID',
   project_name   varchar(50) comment '��Ŀ����',
   project_finish_date datetime comment '��Ŀ�깤ʱ��',
   project_electricity_price double comment '��Ŀ���',
   project_investment double comment '��Ŀ��Ͷ��',
   ground_property      int comment '�������ʣ�0������1һ��ũ�2�ֵء�3�ĵء�4������5����ũ�',
   ground_property_other varchar(20) comment '������������Ϣ',
   ground_area          double comment '�����������',
   rent_time            double comment '��������',
   rent_pay             double comment '�������',
   control_room_area    double comment '�п��ҽ������',
   sell_sum    double comment '���ý��',
   ground_condition     int comment '����ƽ�������1ƽ�ء�2ɽ�¡�3ˮ�棩',
   has_shelter          varchar(8) comment '���������ڵ���1�С�2�ޣ�',
   has_pollute          varchar(8) comment '������ȾԴ��1�С�2�ޣ�',
   transformer_capacity double comment '�ϼ���ѹ������',
   voltage_level     varchar(50) comment '������ѹ�ȼ�',
   electricity_distance double comment '������������',
   measure_point        int comment '�����㣨1վ�ڡ�2���վ��',
   plan_build_volume    double comment '�⽨������',
   electricity_data     double comment '��ʷ������',
   project_holder_type  int comment '��Ŀ֧�����ͣ�1����̶�ʽ��2���ᡢ3˫�ᣩ',
   ground_project_type  int comment '��Ŀ���ͣ�1���桢2ũ�⻥����3��⻥����',
   project_industry     varchar(10) comment '��ҵ��X��ҵ��C��ҵ��Aũҵ��R����F��⻥����X������',
   cooperation_type     varchar(30) comment '��������������ʽ��1EPC��2�������ʡ�3�ƽ���Ŀ��4ת�ã�',
   plan_financing       double comment '�����ʽ��',
   financing_type       int comment '���ʷ�ʽ��1�������ޣ�ֱ�⣩��2�������ޣ����⣩��3��Ȩ���ʣ�',
   company_invest       double comment '��λͶ��',
   company_EPC          varchar(100) comment 'EPC����',
   capacity_level       varchar(50) comment '���ʵȼ�',
   synchronize_date     date comment '����ʱ�䣨date��',
   project_backup       varchar(20) comment '��Ŀ����������ID��',
   electricity_backup   varchar(20) comment '�������뱸��������ID��',
   ground_rent_agreement varchar(20) comment '��������Э�飨����ID��',
   rent_time2           double comment '��������',
   rent_pay2            double comment '�������',
   ground_opinion       varchar(20) comment '����Ԥ�����������ID��',
   project_proposal     varchar(20) comment '��Ŀ�����飨����ID��',
   project_report       varchar(20) comment '��Ŀ���б��棨����ID��',
   environment_assessment varchar(20) comment '����������ID��',
   land_certificate     varchar(20) comment '����֤������ID��',
   electricity_price_reply varchar(20) comment '��۾ֵ������������ID��',
   is_old_project       varchar(20) comment '�Ƿ���뵱��ʡ�����ĿĿ¼������ID��',
   completion_report    varchar(20) comment '�������ձ��棨����ID��',
   completion_paper     varchar(20) comment '����ͼֽ������ID��',
   history_data         varchar(20) comment '��ʷ���������ݣ�����ID��',
   electricity_bill     varchar(20) comment '��ѽ���Ʊ�ݣ�����ID��',
   comment              varchar(500) comment '��ע',
   create_date          datetime comment '����ʱ��',
   change_date          datetime comment '�޸�ʱ��',
   status               int not null default 0 comment '״̬���ͣ�0������11��Ŀδ�ύ��12��Ŀ���ύ�����ύ����13���ύ�����飨���ύ����21��ǩ�����ͬ��δ��ְ���飩��22���ύ��ְ���飨δǩ�����ͬ����23��ǩ�����ͬ���Ѿ�ְ���飩��31��ǩ���ʺ�ͬ��41�����͡�42δ���͡�51��ְ���鱣��״̬����ְ���鱣�����Ŀ״̬����52��ְ�����ύ״̬��61�����鱣��״̬',
   delete_flag int not null default 0 comment 'ɾ����ǣ�0������9999ɾ��',
   primary key (id),
   INDEX `ground_project_id` (`project_id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table enf_ground comment '���͵����վ/����ֲ�ʽ';

/*==============================================================*/
/* Table: enf_Housetop                                          */
/*==============================================================*/
create table enf_housetop
(
   id                   bigint not null auto_increment,
   project_id           bigint not null comment '������Ŀid',
   project_intent       text comment '��Ŀ������',
   project_area         varchar(10) comment '��Ŀ����',
   project_address      varchar(60) comment '��Ŀ��ϸ��ַ',
   picture_full         varchar(100) comment '�ݶ�ȫ��',
   picture_south        varchar(100) comment '�ݶ�����ͼƬ',
   picture_mul          varchar(100) comment '��̬ͼƬ����', 
   contract             varchar(20) comment '��ͬ��docID',
   housetop_owner       varchar(50) comment '�ݶ�ҵ������',
   company_type         int comment '��ҵ���ͣ�1�������й�˾����2�������й�˾����3˽�����й�˾����4���󣨷����й�˾����5���󣨷����й�˾����6˽�󣨷����й�˾����',
   company_capital      double comment 'ע���ʱ���',
   housetop_property_prove varchar(20) comment '�ݶ���Ȩ֤��������ID��',
   electricity_total    double comment '���õ���',
   electricity_pay      double comment '���',
   electricity_pay_list varchar(20) comment '���һ������ϸ������ID��',
   housetop_type        int comment '�ݶ����ͣ�0������1��������2�ʸ��ߣ�',
   housetop_type_other  varchar(20) comment '��������������Ϣ',
   housetop_area        double comment '�ݶ����',
   electricity_data     double comment '��ʷ������',
   housetop_age         int comment '�ݶ�ʹ������',
   housetop_direction   int comment '�ݶ�����0������1���ϣ�2������',
   housetop_direction_other varchar(20) comment '�����ݶ�������Ϣ',
   housetop_waterproof_time double comment '�ݶ���ˮ����',
   housetop_load        double comment '�ݶ����غ�',
   has_shelter          varchar(8) comment '���������ڵ���1�С�2�ޣ�',
   has_pollution        varchar(8) comment '������ȾԴ��1�С�2�ޣ�', 
   transformer_capacity double comment '�ϼ���ѹ������',
   voltage_level        double comment '������ѹ�ȼ�',
   synchronize_type     int comment '������ʽ��1ȫ���Է����á�2ȫ��������3�Է����ã����������',
   project_industry     varchar(10) comment '��ҵ��X��ҵ��C��ҵ��Aũҵ��R����F��⻥����X������',
   electricity_distance double comment '������������',
   plan_build_volume    double comment '�⽨������',
   cooperation_type     varchar(30) comment '��������������ʽ:1EPC��2�������ʡ�3�ƽ���Ŀ��4ת��',
   plan_financing       double comment '�����ʽ��',
   financing_type       int comment '���ʷ�ʽ��1�������ޣ�ֱ�⣩��2�������ޣ����⣩��3��Ȩ���ʣ�',
   company_invest       double comment '��λͶ��',
   company_EPC          varchar(100) comment 'EPC����',
   capacity_level       varchar(50) comment '���ʵȼ�',
   synchronize_date     date comment '����ʱ��',
   project_backup       varchar(20) comment '��Ŀ����������ID��',
   electricity_backup   varchar(20) comment '�������뱸��������ID��',
   house_rent_agreement varchar(20) comment '�ݶ�����Э�飨����ID��',
   rent_time            double comment '��������',
   rent_pay             double comment '�������',
   power_manage_agreement varchar(20) comment '��ͬ��Դ����Э�飨����ID��',
   electricity_clear_type int comment '��۽��㷽ʽ��1���ƽ��۴��ۡ�2ƽ����۴��ۡ�3�̶���ۣ�',
   electricity_clear    varchar(20) comment '������',
   project_proposal     varchar(20) comment '��Ŀ�����飨����ID��',
   project_report       varchar(20) comment '��Ŀ���б��棨����ID��',
   housetop_load_prove  varchar(20) comment '�ݶ��غ�֤��������ID��',
   completion_report    varchar(20) comment '�������ձ��棨����ID��',
   completion_paper     varchar(20) comment '����ͼֽ������ID��',
   history_data         varchar(20) comment '��ʷ��������/�������ݣ�����ID��',
   electricity_bill     varchar(20) comment '��ѽ���Ʊ�ݣ�����ID��',
   comment              varchar(500) comment '��ע',
   create_date          datetime comment '����ʱ��',
   change_date          datetime comment '�޸�ʱ��',
   status               int not null default 0 comment '״̬���ͣ�0������11��Ŀδ�ύ��12��Ŀ���ύ�����ύ����13���ύ�����飨���ύ����21��ǩ�����ͬ��δ��ְ���飩��22���ύ��ְ���飨δǩ�����ͬ����23��ǩ�����ͬ���Ѿ�ְ���飩��31��ǩ���ʺ�ͬ��41�����͡�42δ���͡�51��ְ���鱣��״̬����ְ���鱣�����Ŀ״̬����52��ְ�����ύ״̬��61�����鱣��״̬',
   delete_flag int not null default 0 comment 'ɾ����ǣ�0������9999ɾ��',
   primary key (id),
   INDEX `housetop_project_id` (`project_id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table enf_housetop comment '�ݶ��ֲ���Ŀ��';

/*==============================================================*/
/* Table: enf_Project                                           */
/*==============================================================*/
create table enf_project
(
   id                   bigint not null auto_increment,
   project_code         varchar(30) not null comment '��Ŀ���',
   project_type         int comment '��Ŀ���ͣ�1�ݶ��ֲ�ʽ��2����ֲ�ʽ��3���͵���',
   build_state          int comment '����״̬��1δ����2�ѽ�',
   provider_id   bigint comment '��Ŀ�ṩ��id',
   highlight_flag       int default 0 comment '������ǣ�0��������1����',
   status               int not null default 0 comment '״̬���ͣ�0������11��Ŀδ�ύ��12��Ŀ���ύ�����ύ����13���ύ�����飨���ύ����21��ǩ�����ͬ��δ��ְ���飩��22���ύ��ְ���飨δǩ�����ͬ����23��ǩ�����ͬ���Ѿ�ְ���飩��31��ǩ���ʺ�ͬ��41�����͡�42δ���͡�51��ְ���鱣��״̬����ְ���鱣�����Ŀ״̬����52��ְ�����ύ״̬��61�����鱣��״̬',
   delete_flag int not null default 0 comment 'ɾ����ǣ�0������9999ɾ��',
   create_date          datetime comment '����ʱ��',
   change_date          datetime comment '�޸�ʱ��',
   primary key (id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

/*==============================================================*/
/* Table: enf_PushProject                                       */
/*==============================================================*/
create table enf_pushproject
(
   id                   bigint not null auto_increment,
   investor_id          bigint comment 'Ͷ����id',
   project_code         varchar(100) comment '��Ŀ���',
   push_time            datetime comment '����ʱ��',
   highlight_flag       int default 0 comment '������ǣ�0��������1����',
   status               int not null default 0 comment '״̬���ͣ�0������11��Ŀδ�ύ��12��Ŀ���ύ�����ύ����13���ύ�����飨���ύ����21��ǩ�����ͬ��δ��ְ���飩��22���ύ��ְ���飨δǩ�����ͬ����23��ǩ�����ͬ���Ѿ�ְ���飩��31��ǩ���ʺ�ͬ��41�����͡�42δ���͡�51��ְ���鱣��״̬����ְ���鱣�����Ŀ״̬����52��ְ�����ύ״̬��61�����鱣��״̬',
   delete_flag int not null default 0 comment 'ɾ����ǣ�0������9999ɾ��',
   primary key (id),
   INDEX `pushproject_investor` (`investor_id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table enf_pushproject comment '���͵�Ͷ�ʷ�����Ŀ��';

/*==============================================================*/
/* Table: enf_User                                              */
/*==============================================================*/
create table enf_user
(
   id                   bigint not null auto_increment,
   email                varchar(100) not null comment 'ע������',
   password             varchar(100) not null comment '����',
   user_type            int not null comment '�û����ͣ�1����Ա��2ҵ��Ա��3��Ŀ�ṩ����4Ͷ����',
   code     varchar(100) comment 'ҵ��Ա����',
   name     varchar(20) comment 'ҵ��Ա����',
   company_name         varchar(100) comment '��ҵ����',
   company_type         int comment '��ҵע���ʱ�/���ͣ�1�������2������ʡ�3���̶��ʡ�4������Ӫ��5С����Ӫ',
   company_person       varchar(100) comment '��ҵ����',
   company_capital      float comment '��ҵע���ʱ�',
   company_fax          varchar(20) comment '��˾����',
   company_phone        varchar(20) comment '����',
   company_telephone    varchar(11) comment '�����ֻ�',
   company_area         varchar(10) comment '���ڵ���',
   company_address      varchar(100) comment '��ϸ��ַ',
   company_contacts     varchar(100) comment '��ϵ��',
   company_contacts_phone varchar(11) comment '��ϵ���ֻ�',
   company_contacts_position varchar(100) comment '��ϵ��ְ��',
   business_license     varchar(100) comment '��˾Ӫҵִ��-����ID',
   organization_code    varchar(100) comment '��֯��������֤-����ID',
   national_tax_certificate varchar(100) comment '��˰�Ǽ�֤-����ID',
   local_tax_certificate varchar(100) comment '��˰�Ǽ�֤-����ID',
   identity_card_front  varchar(100) comment '�������֤����-����ID',
   identity_card_back   varchar(100) comment '�������֤����-����ID',
   financial_audit      varchar(20) comment '������Ʊ����docID',
   create_date          datetime comment '����ʱ��',
   change_date          datetime comment '�޸�ʱ��',
   status               int not null default 2 comment '״̬���ͣ�1�Ѽ��2δ����',
   delete_flag int not null default 0 comment 'ɾ����ǣ�0������9999ɾ��',
   primary key (id),
   INDEX `user_email` (`email`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table enf_user comment '�û���';

/*==============================================================*/
/* Table: enf_Admin                                           */
/*==============================================================*/
create table enf_admin
(
   id                   bigint not null auto_increment,
   user_name            varchar(100) not null unique comment '�û���',
   password             varchar(100) not null comment '����',
   primary key (id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table enf_admin comment '����Ա��';
insert into enf_admin value(1,'admin','21232f297a57a5a743894a0e4a801fc3');/*����admin*/

/*==============================================================*/
/* Table: enf_Component                                           */
/*==============================================================*/
create table enf_component
(
   id                   bigint not null auto_increment,
   project_id           bigint not null comment '��Ŀid',
   component_company    varchar(100) comment '�������',
   component_type       varchar(100) comment '�������ͺ�',
   component_count     int comment '�������',
   create_date          datetime comment '����ʱ��',
   change_date          datetime comment '�޸�ʱ��',
   delete_flag int not null default 0 comment 'ɾ����ǣ�0������9999ɾ��',
   primary key (id),
   INDEX `component_project` (`project_id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table enf_component comment '�����';

/*==============================================================*/
/* Table: enf_Inverter                                           */
/*==============================================================*/
create table enf_inverter
(
   id                   bigint not null auto_increment,
   project_id           bigint not null comment '��Ŀid',
   inverter_company     varchar(100) comment '���������',
   inverter_type        varchar(100) comment '���������ͺ�',
   inverter_count     int comment '���������',
   create_date          datetime comment '����ʱ��',
   change_date          datetime comment '�޸�ʱ��',
   delete_flag int not null default 0 comment 'ɾ����ǣ�0������9999ɾ��',
   primary key (id),
   INDEX `inverter_project` (`project_id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

alter table enf_inverter comment '�������';

