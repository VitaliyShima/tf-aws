# module AWS IAM role policy attachment

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "aws_iam_role_policy_attachment_to_back" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/iam_role_policy_attachment.git"
  role_id       = module.iam_role_codebuild_back.iam_role_id                                     # id role к которой мы присоединяем policy
  attachment_policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole" # arn policy которую мы присоеденим к role.
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/iam_role_policy_attachment.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
