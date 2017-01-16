description
---
week two project for makers academy- original challenge text can be found in "challenge.md"

usage
---
create a file called ".env" in your root

populate it with

```
ACCOUNT_SID=yourSID
AUTH_TOKEN=yourauth
PHONE_NUMBER=yourNumber
TWILIO_NUMBER=yourTwilioNumber
```

`require "./lib/customer"`

make a menu with `menu = Menu.new`
make a customer with `customer = Customer.new`

to view the menu do `puts menu.to_s`
to view the basket do `puts customer.view_basket`
to add things to the basket do `customer.add item` you can use ID or name
to finish your order do `customer.finish_order cost_in_pence`

problems
---
coveralls has a cloned version of "menu_loader.rb", it sticks around no matter what and has 40% coverage- currently also fails the upload tests because rspec doesn't seem to run there
