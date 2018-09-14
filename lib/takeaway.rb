class Takeaway

  def initialize
    @menu = {
      :"1.fish_and_chips" => '£3.20', 
      :"2.burger_and_chips" => '£4.20', 
      :"3.chips" => '£1'
    }
  end
  
  def menu
    @menu.each {|k, v| puts "#{k} - #{v}"}
  end

  def add_meal
  end
end 
