# module AWS IAM profile

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "iam_profile_ec2" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/iam_profile.git"
  env_project = var.env_project                     # Глобальная переменная
  name_profile = var.name_profile_ec2               # Уникальное имя для идентификации в AWS консоли
  role = module.iam_role_ec2.iam_role_id            # результат работы модуля IAM role
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/iam_profile.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
