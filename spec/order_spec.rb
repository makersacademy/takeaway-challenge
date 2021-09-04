require 'order'

describe Order do
  
  subject(:order) {described_class.new }

  context 'selected items' do 
    it 'initializes with an empty array' do 
      expect(order.selected_items).to eq []
    end 

    it 'adds items to the selected_items empty array' do
      pizza = double(:name => "pizza", :price => 9)
      order.add_selected_item(pizza)
      expect(order.selected_items).to include pizza
    end 
  end
     

    context 'check total price matches sum of items ordered' do
      it 'should return total price of items selected' do
        pizza = double(:name => "pizza", :price => 9)
        order.add_selected_item(pizza)
      end
    end 
end 
