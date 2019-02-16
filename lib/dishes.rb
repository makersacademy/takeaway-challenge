class Dishes
  attr_accessor :dish_list

  def initialize
      @dish_list = [{ :name => "CHICKEN WINGS", :price => 6.75},
                { :name => "NACHOS", :price => 7.5},
                {:name => "HOUSE SALAD", :price => 5.5},
                { :name => "FISH AND CHIPS", :price => 7.0},
                { :name => "MAC AND CHEESE", :price => 7.0},
                { :name => "PRIME RIB", :price => 9.75},
                { :name => "BEEF LASAGNE", :price => 8.75},
                { :name => "SHEPHARDS PIE", :price => 8.0},
                { :name => "CHICKEN BURGER", :price => 6.85},
                { :name => "CALAMARI AND CHIPS", :price => 8.5 }]

      see_dishes
  end

  def see_dishes
      dish_list.map do |hash|
        "%s: £%.2f \n" % [hash[:name].to_s, hash[:price].to_i]
      end
  end

end

# dishes = Dishes.new
# dishes.see_dishes
