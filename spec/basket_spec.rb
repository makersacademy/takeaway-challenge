require 'basket'

describe Basket do

  let(:basket)      { Basket.new(menu_class) }
  let(:menu_class)  { double(:menu_class, new: menu) }
  let(:menu)        { double(:menu, get_dish: dish) }
  let(:dish)        { double(:dish, price: 10)}

  it 'can store an item in the basket' do
    expect(menu).to receive(:get_dish)
    basket.add_item('Margherita', 1)
  end

  it 'can ask menu for the menu' do
    expect(menu).to receive(:items)
    basket.show_menu
  end

  it 'can calculate the basket cost' do
    basket.add_item('Margherita', 1)
    expect(basket.total_cost).to eq(10)
  end

  it 'can add multiple of the same item to the basket' do
    basket.add_item('Margherita', 5)
    expect(basket.total_cost).to eq(50)
  end

  it 'can display the basket' do
    basket.add_item('Margherita', 5)
    expect(basket.basket.length).to eq(5)
  end

end
