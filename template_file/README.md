# module AWS template_file 
Bash скрипт который используется как user data при дэплое ec2

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "userdata_ec2" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/template_file.git"
  region = var.region                                                              # Глобальная переменная
  env_project = var.env_project                                                    # Глобальная переменная
  type_os = var.type_os                                                            # Переменная не глобальная, но берётся из переменных объявленных в модуле EC2
  path_file_sh = "./bash_scripts/userdate_config.tftpl"                            # Указано расположение bash скрипта который мы используем как userdata
  private_key_for_gitlab = module.gen_key.ssh_private_key                          # Приватный ключ для gitlab репозитория, результат работы модуля Gen_key (ssh_private_key)
  gitlab_project_path = "git@gitlab.cleveroad.com:internal/<project>.git"          # путь к репозиторию в который мы будем предоставлять доступ из EC2 в формате ssh
  deploy_project = "npm i && npm run build"                                        # комманды для деплоя проекта, переданые в user_date
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/template_file.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
