# module AWS Security Group all ingress rules

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "security_groups_redis" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/security_group_all_rules.git"
  name_sg = "for_redis"                         # Уникальное имя для идентификации в AWS консоли
  project_name = var.project_name               # Глобальная переменная
  env_project = var.env_project                 # Глобальная переменная
  custom_vpc_id = module.custom_vpc.vpc_id      # VPC в котором мы будем использовать для эту Security Group
  ingress_allow = {                             # В этом блоке описаны ingress правила для этой Security Group
        "ingress_all_tcp" = {                       
            from_port = 0                       # Указываем порты для входящих соединений.
            to_port = 65535                     # Указываем порты для входящих соединений.
            protocol = "tcp"                    # Тип протокола для этого правила (-1 = все протоколы)
            cidr_blocks = ["0.0.0.0/0"]         # Адрес с которого можно получить доступ при входящем соединении
            security_groups = []                # Security Group с которой можно получить доступ при входящем соединении
        }
        "ingress_default_sg" = {
            from_port = 6379                   # Указываем порты для входящих соединений.
            to_port = 6379                     # Указываем порты для входящих соединений.
            protocol = "tcp"                   # Тип протокола для этого правила (-1 = все протоколы)
            cidr_blocks = []                   # Адрес с которого можно получить доступ при входящем соединении
            security_groups = [module.custom_vpc.vpc_default_security_group_id] # Security Group с которой можно получить доступ при входящем соединении
        }
    }
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/security_group_all_rules.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
