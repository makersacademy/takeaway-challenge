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

  it 'can start a new order' do
    my_take_away.start_new_order

    expect(my_take_away.current_order).to eq(order_double)
  end

  it 'can show me my order total' do
    expect(order_double).to receive(:show_total).once
    my_take_away.start_new_order
    my_take_away.show_total
  end

  it 'can return a message if we dont have an order ongoing' do
    expect(my_take_away.show_total).to eq("There isn't an order in process.")
  end

  it 'can add an new item to the order that is in the menu' do
    my_take_away.start_new_order
    item_double = double('item double')

    allow(menu_double).to receive(:get_item).with('cheese').and_return(item_double)

    expect(order_double).to receive(:add_item).with(item_double)

    my_take_away.order_item('cheese')
  end

  it 'cant add an item to the order that is not in the menu' do
    my_take_away.start_new_order

    allow(menu_double).to receive(:get_item).with('cheese').and_return(nil)

    expect(order_double).to_not receive(:add_item)

    my_take_away.order_item('cheese')
  end
end
