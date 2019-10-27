
# menu - it lists a menu of items available
class Menu
  attr_reader :menu
  def initialize
    @menu = []
    @menu << { :ref => "001", :name => "Beef Pho",\
       :description => "Broiled beef with noodles.", :price => 15.50 }
    @menu << { :ref => "002", :name => "Soft Shell Crab",\
       :description => "Fresh, meaty crab with spices.",  :price => 10.50 }
    @menu << { :ref => "003", :name => "Bia Hoi Ha Noi",\
       :description => "Fresh brewed beer, Ha Noi style", :price => 4.50 }
    @menu << { :ref => "004", :name => "Prawn w/Tamarin",\
       :description => "Seafood with tamarind sauce", :price => 12.45 }
  end

  def list
    output = "Uncle Ho's Ha Noi Cafe\n\nMenu\n\n"
    output += "Ref\t\t\tName\t\t\t\tDescription\t\t\t\tPrice £\n"
    @menu.each do |item|
      output += "#{item[:ref]}\t\t\t#{item[:name]}\t\t\t"
      output += "#{item[:description]}\t\t#{item[:price]}\n"
    end
    return output
  end

  def menu_array
    return @menu
  end

end
