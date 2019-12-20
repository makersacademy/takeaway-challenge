require 'takeaway'

describe Menu do
  it 'can initialize a constant of menu' do
    menu = Menu.new
  end

  it 'holds a list of available items' do
    menu = Menu.new
    expect(menu.items).to include :chicken => 5.0
  end

  it 'displays a list of all available items' do
    menu = Menu.new
    expect(menu.display_menu).to include "nachos, £3.50"
  end
end

describe Order do
  it 'can initialize a constant of order' do
    order = Order.new
  end

  it 'holds dishes I want to order' do
    order = Order.new
    expect(order.basket).to be_empty
  end

  it 'adds items into the basket' do
    order = Order.new
    expect(order).to respond_to(:select).with(2).arguments
  end

  it 'pushes selected items to basket' do
    order = Order.new
    expect(order.basket).to include(an_instance_of(Hash))
  end
end
