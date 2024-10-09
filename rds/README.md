# module AWS RDS

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "rds" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/rds.git"
  project_name = var.project_name                                 # Глобальная переменная
  env_project = var.env_project                                   # Глобальная переменная
  region = var.region                                             # Глобальная переменная
  name_instans_rds = "rds-db"                                     # Имя RDS инстанса в AWS
  class_db_instance = "db.t3.small"                       # тип инстанса RDS
  vpc_security_group_ids = module.security_groups_rds.sg_id           # результат работы модуля Security Group (id)
  snapshot_identifier    = "snap-dev-test-gp2"                                     # Используется в случае поднятия БД из snapshot (Например aws_db_snapshot.test.db_snapshot_arn, или просто указываем идентификатор snapshot)
# Ниже описаны переменные которые принимают значение "", если БД разворачиваем из snapshot
  name_db_rds = ""   # Имя БД, если тип БД sqlserver-ex, тогда значение будет пустым ""
  type_engine = "" #"sqlserver-ex"                                   # тип БД mysql/sqlserver-ex  type_engine = var.type_engine
  engine_version = "" #"14.00.3381.3.v1"                             # версия БД которую будем использовать
  db_username = "" # module.ssm_user_rds.ssm_value                         # результат работы модуля SSM (value)
  db_userpass = "" # module.ssm_pass_rds.ssm_value                         # результат работы модуля SSM (value)
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/rds.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
