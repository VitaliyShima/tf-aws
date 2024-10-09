# module AWS IAM role

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "iam_role_ec2" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/iam_role.git"
  env_project = var.env_project         # Глобальная переменная
  role_name = var.role_name_ec2         # Уникальное имя для идентификации в AWS консоли
  service_role = "<service_role>"       # какой ресурс будет использовать действие action_role  (codebuild.amazonaws.com , ec2.amazonaws.com , codedeploy.amazonaws.com ...)
  action_role = "<action_role>"         # переменная которая описывает действие этой role
  effect_role = "<effect_role>"         # эффект который накладывается на action_role, возможно Allow/Deny
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/iam_role.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
