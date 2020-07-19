require 'order'

describe Order do
  let(:menu_instance)  { double(:menu) }
  let(:fake_order) { subject.order(:padthai,1) }
  subject { described_class.new }

  describe '#initialize' do
    it 'has an empty order_list array on the instance of order' do
      expect(subject.basket).to eq({})
    end
  end

  describe '#order' do
    it 'client makes their order from the menu' do
      fake_order
      expect(subject.basket).to eq( { :padthai => 1 } )
    end
  end

  describe '#order_total' do
    it 'calculates order total' do
      allow(menu_instance).to receive(:price).with(:padthai).and_return(6.00)
      fake_order
      expect(subject.order_total).to eq(6)
    end
  end
end
