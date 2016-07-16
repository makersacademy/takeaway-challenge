class Takeaway
attr_reader :order_made
  def initialize
    @order_made = []
    @menu = {:dish => "price"}
  end

  def show_menu
    @menu.each { |k, v| puts "#{k}.....#{v}" }
  end

  def order dish, number
    @order_made << [number, dish]
  end

end
