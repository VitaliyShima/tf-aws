# module Export_SSH

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "key_pairs" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/export_ssh.git" 
  project_name = var.project_name                       # Глобальная переменная
  env_project = var.env_project                         # Глобальная переменная
  path_local_ssh_key_public = "~/.ssh"                  # Путь к расположению публичной части ssh ключа, для экспорта его в key_pairs
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/export_ssh.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
