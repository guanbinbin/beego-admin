package models

import (
	"github.com/astaxie/beego/orm"
)

type AdminLog struct {
	Id             int       `orm:"column(id);auto;size(11)" description:"表ID"`
	AdminUserId    int       `orm:"column(admin_user_id);size(10);default(0)" description:"用户id"`
	Name           string    `orm:"column(name);size(30)" description:"操作"`
	Url            string    `orm:"column(url);size(100)" description:"url"`
	LogMethod      string    `orm:"column(log_method);size(8);default(不记录)" description:"记录日志方法"`
	LogIp          string    `orm:"column(log_ip);size(20)" description:"操作IP"`
	CreateTime     int       `orm:"column(create_time);size(10);default(0)" description:"操作时间"`
	UpdateTime     int       `orm:"column(update_time);size(10);default(0)" description:"更新时间"`
}

//自定义table 名称
func (adminLog *AdminLog) TableName() string {
	return "admin_log"
}

//在init中注册定义的model
func init()  {
	orm.RegisterModel(new(AdminLog))
}


