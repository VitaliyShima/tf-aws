# module AWS EIP

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "eip" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/eip.git"
  name_eip = "eip"                           # Уникальное имя для идентификации в AWS консоли
  ec2_id = module.ec2.ec2_id                 # результат работы модуля EC2 (id)
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/eip.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
