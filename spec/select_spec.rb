require 'select'

describe Select do
  let(:item) { double :item }
  let(:quantity) { double :quantity }
  let(:menu) { double :menu }

  context "#selection" do
    it "should respond to the method order with 2 arg" do
      expect(subject).to respond_to(:order).with(2).argument
    end

    it "should push meal items into the basket" do
      subject.order(item, quantity)
      expect(subject.basket).to eq({ item => quantity })
    end

    it 'should check total bill' do
      allow(menu).to receive(:price).with(:financier).and_return(3.50)
      subject.order(:financier, 7)
      total = 24.5
      expect(subject.order_overview).to eq total
    end
  end
end
