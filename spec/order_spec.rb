require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:dish_name) {double('a name of dish')}
  let(:price) {double('a price of dish')}
  let(:amount) {double('number od dishes')}

  context "when created" do
    it "has an empty menu" do
      expect(order.list_of_items).to eq []
    end
  end

  describe '#add_items' do
    it 'adds items to list of items' do
      order.add_items(dish_name, price, amount)
      expect(order.list_of_items).to eq [{name: dish_name, price: price, amount: amount}]
    end 
  end

end
