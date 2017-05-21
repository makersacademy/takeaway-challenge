require 'menu'

describe Menu do
  
 subject(:menu) { described_class.new }

 it { is_expected.to respond_to(:list) }
 it { is_expected.to respond_to(:create_dish).with(3).argument }
 it { is_expected.to respond_to(:list_dishes) }
 
 describe "#create_dish" do
   it 'creates a new dish and adds to the menu' do
     menu.create_dish("Cheesy Pizza", "Tomato, Cheese and Garlic", 9)
     expect(menu.list).to eq [{:name=>"Cheesy Pizza", :description=>"Tomato, Cheese and Garlic", :price=>9}]
   end
 end


end
