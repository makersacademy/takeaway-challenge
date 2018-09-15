require 'menu'
require 'takeaway'

describe Menu do
   subject(:menu) { described_class.new(dish_hash) }
   #let(:dish_class) { double :dish_class }
   #let(:instance_of_dish_class_mock) { double :instance_of_dish_class_mock }
   let(:dish_hash) do
     {
     pasta: 4.50,
     pizza: 5.00,
     veggy_wrap: 3.85,
     noodles: 4.50
     }
   end

   it 'has a list of dishes and prices' do
     #allow(dish_class).to receive(:new).and_return(instance_of_dish_class_mock)
     expect(menu.dishes).to eq(dish_hash)
   end

  # describe '#printing_menu' do
    # it 'prints the menu' do
    # end
  # end

end
