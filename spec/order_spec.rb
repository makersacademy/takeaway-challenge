require 'order'
require 'dishes'


describe Order do
  let(:hash) {"hash"}
  let(:name) {"name"}
  let(:price) {"price"}
  let(:food_item) {"NACHOS"}
  let(:no_food_item) {"PIZZA"}
  let(:list) {list = [{ :name => "CHICKEN WINGS", :price => 6.75},
            { :name => "NACHOS", :price => 7.5},
            {:name => "HOUSE SALAD", :price => 5.5},
            { :name => "FISH AND CHIPS", :price => 7.0},
            { :name => "MAC AND CHEESE", :price => 7.0},
            { :name => "PRIME RIB", :price => 9.75},
            { :name => "BEEF LASAGNE", :price => 8.75},
            { :name => "SHEPHARDS PIE", :price => 8.0},
            { :name => "CHICKEN BURGER", :price => 6.85},
            { :name => "CALAMARI AND CHIPS", :price => 8.5}]}

describe "#has_dish(food_item)" do

it "checks whether selected item is in the list" do

  dishes_double = double :dishes
  dishes_class_double = double :dishes_class, new: dishes_double
  hash_double = double :hash

  allow(dishes_class_double).to receive(:new).and_return(dishes_double)
  allow(dishes_double).to receive(:dish_list).and_return(list)

  order = Order.new(dishes_class_double)
  expect(order.has_dish(food_item)).to eq true
end

it 'tell if dish is not on the menu' do

    dishes_double = double :dishes
    dishes_class_double = double :dishes_class, new: dishes_double
    hash_double = double :hash

    allow(dishes_class_double).to receive(:new).and_return(dishes_double)
    allow(dishes_double).to receive(:dish_list).and_return(list)

    order = Order.new(dishes_class_double)
    expect(order.has_dish(no_food_item)).to eq false
end

end

it 'collects the selected items and their multiples' do

  dishes_double = double :dishes
  dishes_class_double = double :dishes_class, new: dishes_double
  hash_double = double :hash

  allow(dishes_class_double).to receive(:new).and_return(dishes_double)
  allow(dishes_double).to receive(:dish_list).and_return(list)

  order = Order.new(dishes_class_double)
  item = order.select_dish(food_item, 1)

  expect(item[0]).to include food_item

end

it 'raises an error if the item is not on the list' do

  dishes_double = double :dishes
  dishes_class_double = double :dishes_class, new: dishes_double
  hash_double = double :hash

  allow(dishes_class_double).to receive(:new).and_return(dishes_double)
  allow(dishes_double).to receive(:dish_list).and_return(list)

  order = Order.new(dishes_class_double)

  expect{ order.select_dish no_food_item,1 }.to raise_error "This item is not on the list"
end


it 'returns the total of the selected items' do

  dishes_double = double :dishes
  dishes_class_double = double :dishes_class, new: dishes_double
  hash_double = double :hash

  allow(dishes_class_double).to receive(:new).and_return(dishes_double)
  allow(dishes_double).to receive(:dish_list).and_return(list)

  order = Order.new(dishes_class_double)
  order.select_dish(food_item, 2)
  expect(order.ordered_total).to eq 15
end

it 'checks that the total is correct' do

  dishes_double = double :dishes
  dishes_class_double = double :dishes_class, new: dishes_double
  hash_double = double :hash

  allow(dishes_class_double).to receive(:new).and_return(dishes_double)
  allow(dishes_double).to receive(:dish_list).and_return(list)

  order = Order.new(dishes_class_double)
  order.select_dish(food_item, 2)
  order.ordered_total
  expect(order.check_sum). to eq true
end

end
