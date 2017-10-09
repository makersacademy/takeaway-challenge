require 'takeaway'

describe Takeaway do

  subject(:takeaway) { Takeaway.new(menu) }
  let(:menu){ double :menu, dishes: {item_name => item_price} }
  let(:item_name){ "Cockroach Clusters" }
  let(:item_price){ 4.99 }

  # let(:dish) { double :dish }
  # let(:price) { double :price }
  #
  # let(:order_subtotal) { { dish: dish, price: price } }

  describe '#initialize' do
    it "shows a list of dishes" do
      expect(takeaway.read_menu[item_name]).to eq(item_price)
      #what is right test
      #it block should return key/value hash
    end
  end

  describe '#order' do
    it "can select several dishes" do
      expect(takeaway).to respond_to(:order).with(1).argument
    end
  end

  describe '#order_summary' do
    it "prints out an order summary" do
      expect(takeaway.order_summary).to eq takeaway.order_summary
    end
  end

end
