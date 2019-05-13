require_relative 'menu'

class Site

attr_reader :item, :quantity, :prices

def initialize(menu = Menu.new)
    @prices = []
    @menu = menu
end

def print_menu
@menu.list
end

def select(item, quantity)
  @item = item.to_s
  @quantity = quantity.to_i
  add_totals
  "#{quantity} #{item} added"
end

def amount(number)
  @number = number
end

def confirm
    raise "There was a problem placing your order, please try again." unless order_confirmed?
  end

private

def add_totals
  @menu.list.each do |a, b|
    if a == @item
      @prices << (b * @quantity)
    end
  end
end

def actual_amount
  @prices.inject(:+)
end

def order_confirmed?
  @number == actual_amount
end
end
