# module AWS EC2

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/ec2.git"
  project_name = var.project_name                                     # Глобальная переменная
  env_project = var.env_project                                       # Глобальная переменная
  region = var.region                                                 # Глобальная переменная
  type_os = var.type_os_bastion                                               # Объявляем в общий файл variable.tf так как переменная пере используется user_data
  # ami_id_ec2 - используется для указания определённого id ami образа, например при востановлении с резервного ami
  ami_id_ec2 = var.type_os_bastion == "amazon" ? module.data.data_aws_ami_amazon_id : module.data.data_aws_ami_ubuntu_id   
  name_ec2_instance = "bastion"                                         # уникальное имя для идентификации в AWS консоли
  instance_type = "t2.micro"                                  # Тип EC2 инстанса (t3.micro)
  volume_size_ec2 = "20"                              # размер жесткого диска EC2 инстанса в Gb
  iam_instance_profile = module.iam_profile_ec2.iam_profile_name      # результат работы модуля IAM profile (name)
  vpc_security_group_ids = [module.security_groups_ec2_bastion.sg_id]
  subnet_id = module.vpc_subnet_privat1.subnet_id
  gitlab_project_path = ""                      # приватный ключ для gitlab репозитория (https://gitlab.cleveroad.com)
  private_key_for_gitlab = ""             # результат работы модуля gen_key (privat_key)
  user_data = module.userdata_ec2.userdata_rendered                   # результат работы модуля user data (userdata_rentered)
  deploy_project = ""                                 # команды для деплоя проекта, переданные в user_date
}
```

---

Переменные которые используют с этим модулем:
```
variable "type_os" {                                             # Указываем какой тип дистрибютива используется Ubuntu/AWS Linux
   default = "ubuntu"                                          # "ubuntu" or "amazon" 
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/ec2.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
