require_relative 'menu'

class Takeaway

	attr_reader :menu


	def initialize
		@menu = Menu.new
	end

  def start_order

  end


  def finish_order

  end

  def print_menu
    @menu.dishes.each do |dish, price|
    	puts "#{dish.to_s}: #{price}"
    end
  end

end