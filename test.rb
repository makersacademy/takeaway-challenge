require_relative 'menu'
require_relative 'order'
require_relative 'messager'

Takeaway.new(Menu, Order, Messenger)
