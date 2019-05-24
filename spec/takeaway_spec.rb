require 'takeaway'

describe Takeaway do
  let(:my_take_away){Takeaway.new(menu_double, order_class)}
  let(:menu_double){double('menu_double', view_items: "a menu")}
  let(:order_double){double('order_double', add_item: false)}
  let(:order_class){double('order_class', :new => order_double)}

  it 'can show a customer a menu' do
    expect(my_take_away.view_menu).to eq("a menu")
  end

  it 'has an order object that is nil on initialize' do
    expect(my_take_away.current_order).to eq(nil)
  end

  it 'can can initalize an order when an item is ordered' do
    my_take_away.order('an item')
    expect(my_take_away.current_order).to eq(order_double)
  end

  it 'can wont initalize an order when an item is alredy in progress' do
    expect(order_class).to receive(:new).once
    my_take_away.order('an item')
    my_take_away.order('another item')
  end

  it 'can tell order to add an item' do
    allow(order_double).to receive(:add_item).with(1)
    expect(order_double).to receive(:add_item).with('an item')

    my_take_away.order('an item')
  end

  it 'can show me my order total' do
    my_take_away.order('an item')

    expect(order_double).to receive(:show_total).once

    my_take_away.show_total
  end

  it 'can return a message if we dont have an order ongoing' do
    expect(my_take_away.show_total).to eq("There isn't an order in process.")
  end
end
