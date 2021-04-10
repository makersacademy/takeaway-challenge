class Takeaway

  def initialize 
    @menu_items = {
      Lasagne: 12,
      Margherita: 10,
      Risotto: 8,
      Arancini: 7,
      Carbonara: 10
    }
  end 

  def read_menu
    @menu_items.each do |item, price|
      puts "#{item}  --£#{price}"
    end 
  end 
end 
