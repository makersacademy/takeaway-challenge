# menu = Menu.new
# NameError: uninitialized constant Menu
# my_order = Order.new
# NameError: uninitialized constant Order
# menu.check
# NoMethodError: undefined method `check' for nil:NilClass
# menu.add_to_order 2, chow-mein
# NameError: undefined local variable or method `chow' for main:Object
# menu.order 1, peking-duck
# NameError: undefined local variable or method `peking' for main:Object
# menu.order 1, singapore-noodles
# NameError: undefined local variable or method `singapore' for main:Object
# my_order.check_total
# NoMethodError: undefined method `check_total' for nil:NilClass
# my_order.pay
# ArgumentError: no method name given
# my_order.place

require 'menu'

describe Menu do

  it { is_expected.to respond_to :check }

  it { is_expected.to respond_to(:add_to_order).with(2).arguments }

  it 'should be initialised with a default menu' do
    expect(subject.menu).to eq Menu::MENU
  end


end
