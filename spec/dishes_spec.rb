require 'dishes'

describe Dishes do
  
  it 'displays the list of dishes with the price' do
    list = [{ :name => "CHICKEN WINGS", :price => 6.75},
              { :name => "NACHOS", :price => 7.5},
              {:name => "HOUSE SALAD", :price => 5.5},
              { :name => "FISH AND CHIPS", :price => 7.0},
              { :name => "MAC AND CHEESE", :price => 7.0},
              { :name => "PRIME RIB", :price => 9.75},
              { :name => "BEEF LASAGNE", :price => 8.75},
              { :name => "SHEPHARDS PIE", :price => 8.0},
              { :name => "CHICKEN BURGER", :price => 6.85},
              { :name => "CALAMARI AND CHIPS", :price => 8.5 }]
    dishes = Dishes.new


    list.map do |hash|
      hash.each do |key,value|
        "%s: £%.2f \n" % [key.to_s, value.to_i]
      end
    end

    expect(dishes.dish_list).to eq list
  end
end
