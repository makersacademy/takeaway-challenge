require 'order'

RSpec.describe Order do
  let (:test_order) { [{"Salad"=>1.00}, {"Pasta"=>5.00}] } 

  describe '#select_items' do
    it 'allows customers to select the dishes they want' do
      subject.select_items
      expect(subject.customer_order).to eq(test_order)
    end
  end

end