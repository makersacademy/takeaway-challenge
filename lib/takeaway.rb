class Takeaway
    
  attr_reader :menu
    
  def initialize
    @menu = {
      "noodles" => 5,
      "chow mein" => 6,
      "spring rolls" => 7,
      "sweetsour" => 8,
      "crispybeef" => 9
    }
  end
    
  def print_menu        
    @menu
    # @menu.each do |item, price|
    # puts "#{item} - £#{price}"
    # end
        
  end
    
  def take_order
        
  end
    
end
