# it interacts with the customer

require_relative 'menu'
require_relative 'order'
require_relative 'messenger'

class Restaurant

	def initialize(menu = Menu.new, order = nil)
		@menu = menu
		@order = order
	end

	def show_menu
		@menu.show_menu
	end

	def order_item(item, qty = 1)
		fail "This item is not on the menu" unless menu_include?(item)
		open_order if @order == nil
		@order.add_to_order(item.downcase.to_sym, qty)
	end

	def complete_order
		@order.confirm_order
		@order = nil
	end

	def total_correct?
		order.total_correct?
	end

	def see_basket
		order.ordered_items
	end

	private

	attr_reader :order

	def open_order
		@order = Order.new(@menu.food_list)
	end

	def menu_include?(item)
		@menu.food_list.include?(item.downcase.to_sym)
	end

end