# module AWS parameter store (ssm)

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "ssm" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/ssm.git"
  name_ssm    = "/${var.prefix_ssm_back}/${var.env_project}/DB_USER" # Уникальное имя для идентификации в AWS консоли
  value = "secrets"                                                  # Переменная содержит значение которое мы хотим хранить в SSM для дальнейшего использования в сервисах AWS
  record_type = "SecureString"                                       # Тип SSM переменной. (String/SecureString)
}
```
---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/ssm.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
