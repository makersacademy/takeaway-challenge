require 'menu'
require 'takeaway'

describe Menu do
  subject(:menu) { described_class.new(dish_hash, dishes_quantity, order_class) }
  let(:dishes_quantity) { { Pasta: 2, Chicken: 2 } }
  let(:order_class) { double :order_class, total: 19.00 }

  let(:dish_hash) do
    {
     pasta: 4.50,
     chicken: 5.00,
     veggy_wrap: 3.85,
     noodles: 4.50
     }
  end

  it 'has a list of dishes and prices' do
    expect(menu.dishes).to eq(dish_hash)
  end

  describe '#printing_menu' do
    it 'prints the menu' do
      formatted_menu = "Pasta 4.50, Chicken 5.00, Veggy_wrap 3.85, Noodles 4.50"
      expect(menu.printing_menu).to eq(formatted_menu)
    end
  end

 context 'when the order has been placed' do
   describe '#place_order' do
     it 'can order a number of several dishes from the menu' do
       allow(order_class).to receive(:add)
       expect(menu.place_order(dishes_quantity))
     end
   end

   it 'knows the total' do
     allow(order_class).to receive(:add)
     total = menu.place_order(dishes_quantity)
     expect(total).to eq 19.00
   end

   it 'it calculates the price' do
     expect(menu.price(:pasta)).to eq dishes_quantity[:pasta]
   end
 end
end
