# module AWS RDS Aurora

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "rds-aurora" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/rds-aurora.git"
  project_name = var.project_name                                   # Глобальная переменная
  env_project = var.env_project                                     # Глобальная переменная
  region = var.region                                               # Глобальная переменная
  name_rds_cluster_instance = "rds-db"                                       # Имя RDS инстанса в AWS
  class_db_instance = "db.t3.large"                         # тип инстанса RDS
  vpc_security_group_ids = [module.security_groups_rds.sg_id]             # результат работы модуля Security Group (id)
  db_subnet_group_name = module.rds_subnet_group.subnet_db_id
    # Ниже описаны переменные которые принимают значение "", если БД разворачиваем из snapshot
  name_db_rds = "optimallymedb"     # Имя БД, если тип БД sqlserver-ex, тогда значение будет пустым ""
  type_engine = "aurora-mysql"                                     # тип БД mysql/sqlserver-ex  type_engine = var.type_engine
  engine_version = "5.7.mysql_aurora.2.11.1"                              # версия БД которую будем использовать "5.7.mysql_aurora.2.11.1"
  db_username = module.ssm_user_rds.ssm_value                           # результат работы модуля SSM (value)
  db_userpass = module.ssm_pass_rds.ssm_value                           # результат работы модуля SSM (value)
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/rds-aurora.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
