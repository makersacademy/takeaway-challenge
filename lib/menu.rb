

class Menu
attr_reader :items
  def initialize
    @items = [{:pizza => "Margherita", :price =>  9.99}, 
              {:pizza => "Neapolitan", :price => 12.99},
              {:pizza => "Greek", :price => 13.99},
              {:pizza => "Padana", :price => 11.99}]
  end

  def view
    items.each do |item|
     puts "#{item[:pizza]}, £#{item[:price]}"
    end
  end
  
end

