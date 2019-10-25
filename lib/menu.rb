class Menu
  def initialize
    @menu = {
      burger:8,
      fries:4,
      milkshake:4,
      doughnut:2,
      cake:4,
      chickenbreast:9,
      olive:2,
      cheese:1,
      salad:6
    }
    @order_list = {}
    @order_total = 0
  end

  def show
    @menu.map{|key,value|
      "#{key.to_s}, £#{value}\n"
    }.join(" ")
  end


end


end
