require 'dotenv'
Dotenv.load

def default_menu
  menu = Menu.new
  menu.add_dish('dish1', 10)
  menu.add_dish('dish2', 20)
  menu.add_dish('dish3', 30)
  menu
end

def default_config
  config = {
    account_sid: ENV['ACCOUNT_SID'],
    auth_token: ENV['AUTH_TOKEN'],
    from: ENV['FROM'],
    to: ENV['TO'],
    body: "Thank you! Your order will be delivered before %s"
  }
end

def default
  default = {
    menu: default_menu,
    order_klass: Order,
    text_provider_klass: TextProvider,
    config: default_config
  }
end
