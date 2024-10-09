# module AWS s3-bucket-website-configuration

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "s3_frontend_static_webhosting" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/s3-bucket-website-configuration.git"
  name_s3_backet = module.s3_frontend.s3_bucket_id
  index_document_suffix = var.index_document_suffix
  error_document_key = var.error_document_key
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/s3-bucket-website-configuration.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
