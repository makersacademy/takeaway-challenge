require './lib/order.rb'

describe Order do
  before do
    menu_filename = './resources/menu_list.csv'
    @menu = CSV.read(menu_filename)
  end
  let(:number) { @menu [0][0] }
  let(:dish) { @menu [0][1] }
  let(:price) { @menu [0][2].to_f }

  let(:order_items) { double :order_items }
  subject(:order) { described_class.new(order_items) }
  subject(:order_number) { described_class.new(number) }

  describe '#initialize' do
    it 'sets order_items to order items' do
      expect(order.order_items).to eq order_items
    end
  end

  describe '#total' do
    before do
      order_number.total
    end
    it 'pushes total sum to an array' do
      expect(order_number.sum).to eq price
    end
    it 'pushes total order to an array' do
      expect(order_number.your_order).to eq [(dish + ' ' + price.to_s)]
    end
  end

  describe '#check_total' do
    before do
      order_number.total
    end
    it 'should raise an error' do
      order_number.instance_variable_set(:@yo_total, 87)
      expect{ order_number.check_total }.to raise_error 'You have been wrongly charged!'
    end
    it 'should say you have been charged correctly' do
      expect(order_number.check_total).to eq 'You have been charged correctly'
    end
  end

end
