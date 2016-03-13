
class Order

attr_reader :myorder, :menu

  def initialize
    @menu = {"Chicken" => 5, "Lamb" => 8, "Chips" => 2}
        @myorder = {}
  end

  def show_menu
    @menu.each do |key, value|
    puts '£' + value.to_s + '------------' + key
  end
  end

  def place_order(dish, quantity)
     raise "Sorry, that is not a dish on the menu" if !@menu.has_key?("#{dish}")
     myorder.store("#{dish}",quantity)
     puts "#{quantity} x #{dish} has been added to your order"
  end

    def total_bill
      total = []
      myorder.each{|item, quantity| total <<(@menu[item]*quantity)}
      (total.inject(:+))
    end

    def confirm_order(total)
      raise "Sorry that does not match the total" if total_bill != total
    end

end
