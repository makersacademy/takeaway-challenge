
class Menu

    attr_reader :menu

  def initialize
    @menu = {"1. meal1" => 10, "2. meal2" => 20, "3. meal3" => 30, "4. meal4" => 40, "5. meal5" => 50}
  end 

  
  def display_menu   
    @menu.each_pair{ |k, v| puts " #{k}, Price: #{v}" }
  end



end