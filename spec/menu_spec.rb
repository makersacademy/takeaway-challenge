# menu = Menu.new
# NameError: uninitialized constant Menu
# my_order = Order.new
# NameError: uninitialized constant Order
# menu.check
# NoMethodError: undefined method `check' for nil:NilClass
# menu.order 2, chow-mein
# NameError: undefined local variable or method `chow' for main:Object
# menu.order 1, peking-duck
# NameError: undefined local variable or method `peking' for main:Object
# menu.order 1, singapore-noodles
# NameError: undefined local variable or method `singapore' for main:Object
# order.check_total
# NoMethodError: undefined method `check_total' for nil:NilClass
# order.send
# ArgumentError: no method name given

require 'menu'

describe Menu do

  it { is_expected.to respond_to :check }


end
