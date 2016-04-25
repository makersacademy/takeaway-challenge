require 'restaurant'

describe Restaurant do
  let(:dish) { double(:dish, name: (0...8).map { (65 + rand(26)).chr }.join) }
  let(:quant) { rand(2...10) }
  let(:price) { rand(1...10) }
  let(:dish2) { double(:dish, name: (0...8).map { (65 + rand(26)).chr }.join) }
  let(:quant2) { rand(2...10) }
  let(:price2) { rand(1...10) }
  let(:menu) { double(:menu, view: {dish => price, dish2 => price}) }
  let(:order_class) { double(:order_class, new: order) }
  let(:order) { double(:order, summary: {total: 0}) }
  let(:mssg_class) { double(:messenger_class, new: messenger) }
  let(:messenger) {double(:messenger, send: Restaurant::CONFIRMATION) }
  subject(:restaurant) {described_class.new(menu, order_class, mssg_class)}

  describe '#initialize' do
    subject(:rest_class) { described_class }
    it "is initialized with 3 arguments" do
      expect(rest_class.new(menu, order_class, mssg_class)).to be_a rest_class
    end
    # it 'has optional arguments' do
    #   expect(rest_class.new(menu)).to be_a rest_class
    # end
    it "raises an argument error if no argument is given" do
      expect{ rest_class.new }.to raise_error(ArgumentError)
    end
  end

  describe '#view_menu' do
    it 'returns the passed menu' do
      expect(restaurant.view_menu).to eq menu.view
    end
  end

  describe '#order_summary' do
    let(:summary) { {dish => quant, :total => (quant * price)} }
    it 'returns the order_summary' do
      allow(order).to receive(:summary).and_return(summary)
      expect(restaurant.order_summary).to eq summary
    end
  end

  describe '#order' do
    it 'adds to the current order' do
      expect(order).to receive(:add).with(dish, quant)
      restaurant.order(dish, quant)
    end
  end

  describe '#confirm_order' do
    context 'valid order' do
      let(:summary) { {dish.name => quant, :total => (quant * price)} }
      before { allow(order).to receive(:summary).and_return(summary) }
      it 'sends a confirmation sms' do
        expect(messenger).to receive(:send)
        restaurant.confirm_order
      end
      it 'starts a new order' do
        expect(order_class).to receive(:new)
        restaurant.confirm_order
      end
    end
    context 'empty order' do
      let(:summary) { {total: 0} }
      it 'raises an error' do
        expect{restaurant.confirm_order}.to raise_error(Restaurant::EMPTY_ERR)
      end
    end
  end
end
