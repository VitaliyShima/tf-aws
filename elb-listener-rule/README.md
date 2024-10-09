# module AWS Load Balancer Listener Rule resource for (ELB)

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "lb_listener_rule" {
  lb_listener_arn = $lb_listener_arn #default "example_arn"
  rule_priority = $rule_priority #default 10
  type_action = $type_action #default "forvard"
  target_group_arn = $target_group_arn #default "example_target_group_arn"
  path_pattern = $path_pattern #default "/socket.io"
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/elb-listener-rule.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 