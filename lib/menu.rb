
class Menu

  attr_accessor :price_list

  def initialize(price_list = {"Hamburger" => 2, "Hot-dog" => 3, "Fries" => 5})
    @price_list = price_list
  end

  def display
    list
  end

  private
  def list
    @price_list.each{|k, v| puts "#{k} : #{v}"}
  end
end
