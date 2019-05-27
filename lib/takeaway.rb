class Takeaway
  attr_reader :menu
  
  def initialize
    @menu = [{:pizza => "Margherita", :price =>  9.99}, {:pizza => "Neapolitan", :price => 12.99}]
  end
end

takeaway = Takeaway.new
puts takeaway.menu