require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:my_choices) { { 'Fried Rice' => 3 } }

  before do
    order.add_dish_to_order('Fried Rice', 3)
  end

  it ' allows customer to select several numbers of a dish' do
    expect(order.my_choices).to eq my_choices
  end

  it ' allows customer to add new dishes to the order in the cart' do
    order.add_dish_to_order('Fried Rice', 3)
    order.my_choices
    order.add_to_cart
    expect(order.cart).to eq([{ 'Fried Rice' => 3 }]) 
  end 

end

#   it 'should select dishes' do
#     menu = Menu.new
#     menu.list_dishes
#     expect(menu.select_dishes).to eq(Fried Rice => 15)
# end
