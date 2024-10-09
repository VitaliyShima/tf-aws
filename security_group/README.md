# module AWS Security Group

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "security_groups_ec2" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/security_group.git"
  project_name = var.project_name               # Глобальная переменная
  env_project = var.env_project                 # Глобальная переменная
  name_sg = "for_ec2"                           # Уникальное имя для идентификации в AWS консоли
  allowed_ports = ["80", "443", "22"]             # Указываем порты для входящих соединений. 
  cidr_blocks_ingress = ["0.0.0.0/0"]           # Адрес с которого можно получить доступ при входящем соединении
  security_groups = []                          # id SG которая может получить доступ к ресурсу, для которого настроена эта SG  [module.security_groups_ec2.sg_id]
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/security_group.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
