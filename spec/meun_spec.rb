require 'menu.rb'

RSpec.describe Menu do 
  let(:menu){ Menu.new }
  let(:dishes){[
    { name: "pizza", price: 10.50, number: 1 }, 
    { name: "pasta", price: 9.45, number: 2 },
    { name: "calzone", price: 8.65, number: 3 },
    { name: "calamari", price: 5.65, number: 4 },
    { name: "calamari", price: 5.65, number: 5 },
    { name: "garlic bread", price: 4.65, number: 6 }
  ]}

  describe '#initialize' do 
    it ' has a list of #dishes at first' do 
      expect(menu.dishes).not_to be_empty 
    end 
  end 
  describe '#list_of_dishes' do 
    let(:name) { double :name }
    let(:price) { double :price}
    let(:number) { double :number}
   
      it 'stores a dishes with prices' do
        expect(menu.dishes).to eq dishes 
    end 
  end
  describe '#add_dishes' do 
    it 'responds to the method to add dishes' do
      expect(menu).to respond_to(:add_dishes).with(1)
    end
    it 'adds a new dish' do 
      dish = { name: 'lasagna', price: 8.95, number: 7 }
      expect{ menu.add_dishes(dish) }.to change(menu.dishes, :count).by(1)
      # expect(menu.dishes).to include(dish)
    end 
  end 
end

