require 'order'
require 'menu'

describe Order do
  let(:order) { Order.new }
  let(:dish) { double :dish }
  it 'initializes with a menu from the Menu class' do
    expect(order.menu).to eq(Menu::MENU)
  end
  it 'responds to add a dish' do
    expect(subject).to respond_to(:add).with(2).argument
  end

  it 'adds the name of the dish to @order' do
    expect { order.add('Duck Gyoza') }.to change { order.order }.from([]).to(['Duck Gyoza'])
  end

  it 'add the cost of the dish to @bill' do
    gyoza_cost = 4
    expect { order.add('Duck Gyoza') }.to change { order.total }.from(0).to(gyoza_cost)
  end

  it 'adds multiple dishes to full_order' do
    expect { order.add('Duck Gyoza', 3) }.to change { order.order }.from([]).to(['Duck Gyoza', 'Duck Gyoza', 'Duck Gyoza'])
  end
end
