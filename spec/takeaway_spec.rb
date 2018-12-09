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
    takeaway.select_item("plaice", 1)
    takeaway.add_item_to_list
    takeaway.select_item("COD", 2)
    takeaway.add_item_to_list
    takeaway.select_item("CHIcken", 3)
    takeaway.add_item_to_list
    takeaway.select_item("chips", 6)
    takeaway.add_item_to_list
    takeaway.select_item("PERONI", 18)
    takeaway.add_item_to_list
    takeaway.get_total_cost
    expect(takeaway.get_total_cost).to eq 97.5
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

  it 'will send sms if print_order was successful' do
    takeaway.menu
    takeaway.select_item("PIZZA", 3)
    takeaway.add_item_to_list
    takeaway.get_total_cost
    allow(takeaway).to receive(:sum_correct?).and_return(true)
    allow(takeaway).to receive(:print_order).and_return("Thank-you for your order.")
    expect(takeaway).to respond_to(:send_sms)
  end

  it 'will not send sms if total price is incorrect' do
    takeaway.menu
    takeaway.select_item("PIZZA", 3)
    takeaway.add_item_to_list
    allow(takeaway).to receive(:sum_correct?).and_return(false)
    allow(takeaway).to receive(:print_order).and_return("Incorrect total")
    expect { takeaway.send_sms }.to raise_error 'Cannot send sms until total price is correct'
  end

end
