# module AWS Certificate Manager

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "acm" {                        # acm - это произвольное название.
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/acm.git"            # путь к месту расположения модуля
# дальше идут переменные
  env_project = var.env_project         # Глобальная переменная
  zone_name = "<domain_name>"           # Имя домена который будет валидировать нашу txt запись
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/acm.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
