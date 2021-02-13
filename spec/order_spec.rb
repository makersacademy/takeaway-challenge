require 'order'
require 'menu'

describe Order do

  it 'should create a new order' do
    expect(subject).to be_a Order
  end

  it 'should have an empty order list' do
    expect(subject.order_list).to be_empty
  end

  it 'should have a total of zero' do
    expect(subject.total).to eq(0)
  end

  it 'should give an option to view a menu' do
    expect(subject).to respond_to(:view_menu)
  end



  it 'should show a menu' do
    expect(subject.view_menu).to eq({ "pizza" => 5, "spaghetti" => 6, "sushi" => 10, "nachos" => 8, "burger" => 7 })
  end
end
