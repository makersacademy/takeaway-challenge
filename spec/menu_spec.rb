require 'menu.rb'

describe Menu do

  subject(:menu) { described_class.new(food) }
  let(:food) do
    { 
      tofu_ramen: 3.99, 
      veggie_curry: 2.99 
    }
  end
  
  it 'has a list of food with a price' do
    expect(menu.food).to eq(food)
  end

  it 'can display the food with the price' do
    menu_list = "Tofu_ramen £3.99, Veggie_curry £2.99"
    expect(menu.list). to eq(menu_list)
  end

end