# module AWS Route53

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "route53" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/route53.git"
  zone_name = var.zone_name
  acm_certificate_arn = module.acm.acm_certificate_arn
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/route53.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
