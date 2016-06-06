require 'take_away'

describe TakeAway do
  subject(:take_away) { described_class.new }

  before do
    allow(take_away).to receive(:gets).and_return("2-pizza, 3-Wrap")
    allow(take_away).to receive(:send_message)

  end

  describe "#show_menu" do
    it "shows the menu" do
      expect(take_away).to respond_to :show_menu
    end
  end

  describe "#take_order" do
    it 'lets select a number of dishes for an order' do
      expect(take_away).to respond_to :take_order
    end


  end

  describe "#order_price" do
    it 'returns the total price of my order' do
      take_away.take_order
      expect(subject.price).to eq 54
    end
  end


end
