require 'byebug'

class Menu


  def initialize
    @items = {}
  end

  def show
    @items.dup
  end

  def add(name, price)
    @items[format_name(name)] = price
  end

  def on_menu?(dish)
    @items.include? format_name(dish)
  end

  private

    def format_name(name)
      name = name.downcase.to_sym
    end
end
