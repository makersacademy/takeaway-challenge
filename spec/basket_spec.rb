require 'basket'
describe Basket do

  it 'gets created with and empty list of basket items' do
    expect(subject.basket_items).to eq []
  end

  it 'removes a basket item from the list of basket items' do
    dish_double = double :dish
    dish_quantity = 1
    basket_item_double = double :basket_item
    basket_item_class_double = double :basket_item_class, new: basket_item_double
    basket = Basket.new(basket_item_class_double)
    basket.add_item(dish_double, dish_quantity)
    subject.remove_item(basket_item_double)
    expect(subject.basket_items).not_to include(basket_item_double)
  end

  it 'creates and adds a basket item when instructed to add a dish and quantity' do
    dish_double = double :dish
    dish_quantity = 1
    basket_item_double = double :basket_item
    basket_item_class_double = double :basket_item_class, new: basket_item_double
    basket = Basket.new(basket_item_class_double)
    basket.add_item(dish_double, dish_quantity)
    expect(basket.basket_items).to include(basket_item_double)
  end
end
