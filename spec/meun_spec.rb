require 'menu.rb'

RSpec.describe Menu do 
  let(:menu){ Menu.new }
  let(:dishes){[
    { name: "pizza", price: 10.50 }, 
    { name: "pasta", price: 9.45 },
    { name: "calzone", price: 8.65 },
    { name: "calamari", price: 5.65 },
    { name: "lasagna", price: 10.65 },
    { name: "garlic bread", price: 4.65 }
  ]}

  describe '#initialize' do 
    it ' has a list of #dishes at first' do 
      expect(menu.dishes).not_to be_empty 
    end 
  end 
  describe '#list_of_dishes' do 
    let(:name) { double :name }
    let(:price) { double :price}
    
   
      it 'stores a dishes with prices' do
        expect(menu.dishes).to eq dishes 
    end 
  end
  describe '#add_dishes' do 
    it 'responds to the method to add dishes' do
      expect(menu).to respond_to(:add_dishes).with(1)
    end
    it 'adds a new dish' do 
      dish = { name: 'lasagna', price: 8.95 }
      expect{ menu.add_dishes(dish) }.to change(menu.dishes, :count).by(1)
      expect(menu.dishes).to include(dish)
    end 
  end 
end

