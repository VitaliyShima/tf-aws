# module AWS IAM user policy

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "iam_user_policy" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/iam_user_policy.git"
  iam_policy_name = "Custom_user_policy"                                   # Уникальное имя сервиса в AWS 
  use_user = module.iam_user.iam_user_name                                 # Имя сервиса создающего пользователя
  statement = [
        {
            "Sid": "MinimumGitLabPushMirroringPermissions",
            "Effect": "Allow",
            "Action": [
                "codecommit:GitPull",
                "codecommit:GitPush"
            ],
            "Resource": [
                module.codecommit_back.codecommit_arn                
            ]
        }
    ]             
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/iam_user_policy.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
