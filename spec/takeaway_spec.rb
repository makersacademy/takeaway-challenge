require 'takeaway'

RSpec.describe Takeaway do

  let (:takeaway) { described_class.new }

  it 'will return a list of dishes and prices' do
    expect(takeaway.menu).to be_instance_of(Hash)
  end

  it 'will take the name of dish and the quanity required when selecting an item' do
    takeaway.menu
    expect(takeaway).to respond_to(:select_item).with(2).arguments
  end

  it 'will add your selected dish to a list' do
    takeaway.menu
    takeaway.select_item("CHIPS", 3)
    takeaway.add_item_to_list
    expect(takeaway.dishes).to eq ["chips", "chips", "chips"]
  end

  it 'will sum the total price of all items ordered' do
    takeaway.menu
    takeaway.select_item("PERONI", 4)
    takeaway.add_item_to_list
    takeaway.select_item("chips", 4)
    takeaway.add_item_to_list
    expect(takeaway.get_total_cost).to eq 22
  end

  it 'will return true or false when asked if sum is correct' do
    takeaway.menu
    takeaway.select_item("chicken", 2)
    takeaway.add_item_to_list
    takeaway.get_total_cost
    expect(takeaway.sum_correct?).to be(true).or be(false)
  end

  it 'will raise an error if total cost is incorrect' do
    takeaway.menu
    takeaway.select_item("SAVELOY", 5)
    takeaway.get_total_cost
    allow(takeaway).to receive(:sum_correct?).and_return(false)
    expect { takeaway.print_order }.to raise_error 'Incorrect total'
  end

  it 'will print order if total price is correct' do
    takeaway.menu
    takeaway.select_item("PIZZA", 20)
    takeaway.add_item_to_list
    takeaway.get_total_cost
    allow(takeaway).to receive(:sum_correct?).and_return(true)
    expect(takeaway.print_order).to be_instance_of(String)
  end
end
