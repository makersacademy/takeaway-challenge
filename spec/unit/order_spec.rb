require 'order'
describe Order do
  order_items = { pie: 1, mash: 3 }
  menu_items = { pie: 1, sausage: 2, mash: 3 }
  let(:texter) { double :texter }
  subject(:order) { described_class.new(texter) }

  before do
    subject.add_order_items(order_items)
    subject.add_menu_items(menu_items)
  end

  it 'should receive selected order_items on instantiation' do
    expect(subject.order_items).to eq order_items
  end

  it 'should receive selected menu_items on instantiation' do
    expect(subject.menu_items).to eq menu_items
  end

  it 'should be able to total up order_items' do
    expect(subject.total).to eq 4
  end

  it 'should be able to check the total is right' do
    expect(subject.check(4)).to eq true
  end

  it 'should be able to check the total is wrong' do
    expect { subject.check(6) }.to raise_error("Invalid total")
  end

  it 'should text the customer if the order is placed' do
    texter = double("texter")
    order = described_class.new(texter)
    order.add_order_items(order_items)
    order.add_menu_items(menu_items)
    expect(texter).to receive(:send)
    order.place_order(4)
  end
end
