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

end
