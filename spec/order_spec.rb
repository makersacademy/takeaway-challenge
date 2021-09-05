require 'order'

describe Order do
  
  subject(:order) {described_class.new }
  let(:pizza) { { name: :pizza, price: 9 }}

  context 'selected items' do 
    it 'initializes with an empty array' do 
      expect(order.selected_items).to eq []
    end 

    it 'adds items to the selected_items empty array' do
      # pizza = double(:name => "pizza", :price => 9)
      order.add_selected_item(pizza)
      expect(order.selected_items).to include pizza
    end 
  end
     
  context 'check total price matches sum of items ordered' do
    it 'return total price of items selected' do
      # pizza = double(:name => "pizza", :price => 9)
      order.add_selected_item(pizza)
      expect(order.total_price).to eq 9
    end

  context 'confirm order has been successfull' do
    it 'return true' do
      subject.confirm_order
      expect(subject.confirm_order?).to be true
    end 
    
it 'shows list of items ordered' do
      subject.add_selected_item(pizza)
      expect(subject.display_items).to include pizza
    end 
    end
   end 
  end
