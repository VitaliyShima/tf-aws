# module AWS CodeDeploy

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "codedeploy" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/codedeploy.git"
  env_project = var.env_project                                 # Глобальная переменная
  codedeploy_name = "<codedeploy_name>"                         # уникальное имя для идентификации в AWS консоли
  instance_role_arn = module.iam_role_codedeploy.iam_role_arn   # результат работы модуля IAM CodeDeploy (arn)
  elb_info_name = module.elb.elb_name                           # результат работы модуля IAM elb (name)
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/codedeploy.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
