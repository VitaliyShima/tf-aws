# module AWS S3

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "s3" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/s3.git"
  project_name = var.project_name           # Глобальная переменная
  env_project = var.env_project             # Глобальная переменная
  bucket_name = "<backet_name>"             # Уникальное имя для идентификации в AWS консоли
# Настройка CORS для S3
  cors_rule_s3_allowed_headers = ["Authorization"]
  cors_rule_s3_allowed_methods = ["GET", "POST"]
  cors_rule_s3_allowed_origins = ["*"]
  cors_rule_s3_expose_headers = []
  cors_rule_s3_max_age_seconds = "3000"
# Настройка acl для S3
  acl_s3 = "private"
# Настройка Public Access для S3
  bucket_access_block_public_acls = "true"
  bucket_access_block_public_policy = "true"
  bucket_access_ignore_public_acls = "true"
  bucket_access_restrict_public_buckets = "true"
  object_ownership = "BucketOwnerPreferred" #BucketOwnerPreferred, ObjectWriter or BucketOwnerEnforced
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/s3.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
