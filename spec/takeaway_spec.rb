require 'takeaway'
require 'dish'

describe Takeaway do

  it 'has a menu of dishes' do
    expect(subject.dishes[0].class).to eq (Dish)
  end 

  it 'lists menu items' do
    expect(subject.list).to eq([["Chicken Chow Origin Mein", 7], ["Bool of soup", 7], ["RSPECial Fried Rice", 5], ["DEViled Eggs", 6], ["Rubycon", 2]])
  end

  it 'has select method' do
    expect(subject).to respond_to(:select)
  end

  it 'can add item to order' do
    test_dish = Dish.new('pizza', 10)

    subject.order << test_dish

    expect(subject.order.include?(test_dish)).to eq (true)
  end

  it 'gets total cost of order' do
    testdish1 = Dish.new('chips', 2)
    testdish2 = Dish.new('kebab', 5)
    time = Time.new
    subject.order << testdish1
    subject.order << testdish2

    expect(subject.total).to eq("Your total is £7. Your order will be delivered by #{time.hour + 1}:#{time.min}")
  end
end