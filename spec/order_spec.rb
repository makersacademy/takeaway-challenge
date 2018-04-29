require './lib/order.rb'


describe Order do
  before do
    menu_filename = './resources/menu_list.csv'
    @menu = CSV.read(menu_filename)
  end
  let(:number) { @menu [0][0].to_i }
  let(:dish) { @menu [0][1] }
  let(:price) { @menu [0][2].to_f }

let(:order_items) { double :order_items }
let(:number2)  {double :number2}
subject(:order) { described_class.new(order_items) }
subject(:order2) { described_class.new(number) }

  describe '#initialize' do
    it 'sets order_items to order items' do
      expect(order.order_items).to eq order_items
    end
  end

  describe '#total' do
    before do
      order2.total
    end
    it 'pushes total sum to an array' do
    expect(order2.sum).to eq [price]
    end
    end

end
