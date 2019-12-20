require 'takeaway'

describe Takeaway do

  let (:item){ double :item }

  it 'should have a function to view the menu' do
    takeaway = Takeaway.new
    expect(takeaway).to respond_to(:menu)
  end

  it 'should show you the menu when you call the function' do
    takeaway = Takeaway.new
    expect(takeaway.menu).to be_an_instance_of(Hash)
  end

  it 'should list a number of items and prices' do
    takeaway = Takeaway.new
    expect(takeaway.menu).not_to be_empty
  end

  it 'should show a number of items' do
    takeaway = Takeaway.new
    expect(takeaway.menu.length).to be > 5
  end

  it 'should have a function to order an item' do
    takeaway = Takeaway.new
    expect(takeaway).to respond_to(:order).with(1).argument
  end

  it 'should add items to your order when you order' do
    takeaway = Takeaway.new
    takeaway.order(item)
    expect(takeaway.your_order).to include(item)
  end

  it 'should keep track of the total when things are added to your order' do
    takeaway = Takeaway.new
    takeaway.order("pizza")
    takeaway.order("chips")
    expect(takeaway.total).to eq 12
  end


end
