require 'order'
require 'menu'

describe Order do

  it 'should create a new order' do
    expect(subject).to be_a Order
  end

  it 'should have an empty order list' do
    expect(subject.order_list).to be_empty
  end

  it 'should have a total of zero to start' do
    expect(subject.bill).to eq(0)
  end

  it 'should give a menu list' do
   expect(subject.menu).to eq({ "pizza" => 5, "spaghetti" => 6, "sushi" => 10, "nachos" => 8, "burger" => 7 })
  end

  it 'should add a dish to the order_list' do
    dish = "pizza"
    expect{subject.add(dish)}.to change{subject.order_list.length}.by(1)
  end

  it 'should check the total matches the dishes ordered' do
     subject.add("pizza")
     subject.add("sushi")
    expect(subject.check_order).to eq(subject.bill)
  end
#private method
#   it 'should increase the total by the amount of the item selected' do
#     dish = "sushi"
#     subject.add("sushi")
#     expect{subject.total(10)}.to change{subject.bill}.by(10)
# end
end
