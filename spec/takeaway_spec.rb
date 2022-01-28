require 'takeaway'
require 'dish'

describe Takeaway do

  it 'has a menu of dishes' do
    expect(subject.dishes[0].class).to eq (Dish)
  end 

  it 'lists menu items' do
    expect(subject.list).to eq([["curry", 7.5], ["fish", 5], ["chicken", 6], ["peas", 35]])
  end

  it 'has select method' do
    expect(subject).to respond_to(:select)
  end

  it 'can add item to order' do
    test_dish = Dish.new('pizza', 10)

    subject.order << test_dish

    expect(subject.order.include?(test_dish)).to eq (true)
  end
end