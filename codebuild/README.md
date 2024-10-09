# module AWS CodeBuild

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "codebuild" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/codebuild.git"
  env_project = var.env_project                              # Глобальная переменная
  project_name = var.project_name                            # Глобальная переменная
  codebuild_name = "APP_PART"                                # Название части приложения которое собирается - back[end], front[end], admin[panel], landing, ...
  service_role = module.iam_role_codebuild.iam_role_arn      # результат работы модуля IAM role (arn)
  s3_id = module.s3_codebuild.s3_bucket_id                   # результат работы модуля S3 (id)
  source_codecommit = module.codecommit.codecommit_id        # результат работы модуля CodeCommit (id) HTTPS CodeCommit
  environment_variable = var.environment_variable_v1         # переменная используется в динамическом блоке модуля, для добавления множества значений переменных в один сервис
  path_ssm             = var.prefix_ssm_       # Подставляет соответстующий блок переменных в codebuild, важно указать только к чему относится - back(end), front(end), etc...
# Если создаётся билд бекенда который использует кастомную VPC(например, при деплое бека состоящего из лямбд через SAM)
# ничего не менять в следующих параметрах. В эти переменные будут подставлены результаты работы соответствующих модулей.
  vpc_id               = module.custom_vpc.vpc_id  
  subnet = [
    module.vpc_subnet_privat1.subnet_id,
    module.vpc_subnet_privat2.subnet_id
  ]
  security_group_ids = [
    module.custom_vpc.vpc_default_security_group_id
  ]
# Если деплоится фронт и ему подобные части то в следующие три параметра можно поставить пустые значения.
# vpc_id               = ""
# subnet               = []
# security_group_ids   = []
}
```
---

Переменные имеют следующий вид

---

```
variable "environment_variable_v1" {          # переменная используется в динамическом блоке модуля, для добавления множества значений переменных в один сервис
    type = map(object({
        name = string
        value = string
        type = string   
    }))
    default = {      
        "<variable_name_one>" = {             # имя первой переменной
            name  = "CONFIG_FILE"             # имя первой переменной
            value = "./config/default.json"   # значение первой переменной
            type  = "PARAMETER_STORE"         # тип первой переменной
        }
        "<variable_name_two>" = {             # имя второй переменной
            name  = "STRIPE_WEBHOOK_SECRET"   # имя второй переменной
            value = "web_hook"                # значение второй переменной
            type  = "PARAMETER_STORE"         # тип второй переменной
        }
    }
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/codebuild.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
