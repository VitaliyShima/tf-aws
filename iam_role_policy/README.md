# module AWS IAM role policy

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "iam_role_policy_ec2" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/iam_role_policy.git"
  env_project = var.env_project                       # Глобальная переменная
  role_policy_name = var.role_policy_name             # Уникальное имя для идентификации в AWS консоли
  role_id = module.iam_role_ec2.iam_role_id           # результат работы модуля IAM role (id)
  action_policy = "<action_policy>"                   # переменная которая описывает действие этой policy
  effect_policy = "<effect_policy>"                   # переменная которая описывает эффект от действия action_policy , возможно Allow/Deny
  resource_policy = "<resource_policy>"               # переменная которая показывает к какому ресурсу применяются действия из переменной action_policy
  condition_policy = {}                               # переменная которая используется один раз в policy extended_deployment, значение её индивидуально.
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/iam_role_policy.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
