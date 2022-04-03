require 'takeaway'

describe Takeaway do
  let(:order_class) { double "order_class" }
  let(:text_client) { double "text_client" }
  let(:takeaway) { described_class.new(order_class, text_client) }

  before do
    allow(STDIN).to receive(:gets).and_return("1111111111","1", "1", "", "yes")
    allow(order_class).to receive(:show_menu)
    allow(order_class).to receive(:dish_name).and_return("Fried Rice")
    allow(order_class).to receive(:add_to_order).and_return({ "Fried Rice" => 1 })
    allow(order_class).to receive(:item_list).and_return("1x Fried Rice £6.00\n")
  end

  it { is_expected.to respond_to :show_menu }
  
  it { is_expected.to respond_to :cost }

  describe "#take_order" do
    it 'should be able to take a order and return the price' do
      allow(order_class).to receive(:total_cost).and_return(6)
      takeaway.take_order
      expect(takeaway.cost).to eq(6)
    end

    it 'if you take order again before confirming or cancelling, will show cost of order' do
      allow(order_class).to receive(:total_cost).and_return(6)
      takeaway.take_order
      expect(takeaway.take_order).to eq(6)
    end
  end

  describe "#place_order" do
    it 'should be able to complete a order from start to finish and then let people create a new order' do
      allow(order_class).to receive(:total_cost).and_return(0)
      allow(order_class).to receive(:finish_order)
      allow(text_client).to receive(:send_text)
      takeaway.take_order
      takeaway.place_order
      expect(takeaway.cost).to eq(0)
    end

    it 'cannot place a order without putting a order in yet' do
      expect { takeaway.place_order }.to raise_error("You have not created a order yet")
    end
  end

  describe "#cancel_order" do
    it 'should be able to take a order and then cancel order' do
      allow(order_class).to receive(:total_cost).and_return(0)
      takeaway.take_order
      takeaway.cancel_order
      expect(takeaway.cost).to eq(0)
    end
  end
end
