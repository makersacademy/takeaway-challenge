require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double :menu }
  let(:dish) { double :dish }
  let(:quantity) { double :quantity }

  it { expect(order.order).to be_empty }

  describe '#add_dish' do
    it "adds dishes to the order" do
      order.add_dish(dish, quantity)
      expect(order.order).to have_key(dish)
      expect(order.order).to have_value(quantity)
    end
  end

  # describe "#available?" do
  #   it "checks if a dish is available" do
  #     allow(menu).to receive(:available?).with("Ruby's Salad").and_return(true)
  #     expect(menu.available?("Ruby's Salad")).to be true
  #     allow(menu).to receive(:available?).with("Python's Steak").and_return(true)
  #     expect(menu.available?("Python's Steak")).to eq true
  #     allow(menu).to receive(:available?).with("Rock's Soup").and_return(false)
  #     expect(menu.available?("Rock's Soup")).to eq false
  #     allow(menu).to receive(:available?).with("Makers' Tagliolini").and_return(false)
  #     expect(menu.available?("Makers' Tagliolini")).to eq false
  #   end
  # end

end
