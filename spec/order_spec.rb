require 'order'
require 'menu'
describe Order do
  let(:menu_instance)  { double(:menu) }
  let(:fake_order) { subject.order(1,1) }
  subject { described_class.new }

  describe '#initialize' do
    it 'has an empty order_list array on the instance of order' do
      expect(subject.basket).to eq({})
    end
  end

  describe '#order' do
    it 'client makes their order from the menu' do
      fake_order
      expect(subject.basket).to eq( { 1 => 1 } )
    end
  end

  describe '#order_total' do
    it 'calculates order total' do
      subject.order(:padthai,1)
      allow(menu_instance).to receive(:price).with(:padthai).and_return(6.00)
      expect(subject.order_total).to eq(6)
    end
  end
end
