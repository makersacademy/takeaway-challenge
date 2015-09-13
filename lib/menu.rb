class Menu

attr_reader :menu, :starters, :mains, :desserts, :drinks

  def initialize
    @starters = {
    "Soup" => ["Soup",3.99],
    "Salad" => ["Salad",4.99]}
    @mains = {
    "Steak & Chips" => ["Steak & Chips",14.95],
    "Burger & Chips" => ["Burger & Chips",11.95]}
    @desserts = {
    "Tiramisu" => ["Tiramisu",6.50],
    "Ice Cream" => ["Ice Cream",4.50]}
    @drinks = {
    "Sparkling Water" => ["Sparkling Water",2.80],
    "Still Water" => ["Still Water",2.80]}
    @menu = [starters,mains,desserts,drinks]
  end

  def show
    menu.each {|x| x.each{|x,y| puts "#{y.each {|x| x}}"}}
  end

end