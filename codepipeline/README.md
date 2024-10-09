# module AWS CodePipeline

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "codepipeline" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/codepipeline.git"
  env_project = var.env_project                                     # Глобальная переменная
  s3_codebuild_bucket = module.s3_codebuild.s3_bucket_id            # результат работы модуля S3 (id)
  codepipeline_name = "<codepipeline_name>"                         # Уникальное имя для идентификации в AWS консоли
  role_codepipeline_arn = module.iam_role_pipeline.iam_role_arn     # результат работы модуля IAM role (arn)
  codecommit_id = module.codecommit.codecommit_id                   # результат работы модуля CodeCommit (id)
  codebuild_name = module.codebuild.codebuild_name                  # результат работы модуля CodeBuild (name)
  codedeploy_app_name = module.codedeploy.codedeploy_app_name       # результат работы модуля CodeDeploy (name)
  codedeploy_group_name = module.codedeploy.codedeploy_group_name   # результат работы модуля CodeDeploy (name)
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/codepipeline.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
