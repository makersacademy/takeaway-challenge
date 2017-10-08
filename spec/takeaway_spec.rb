require 'takeaway.rb'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:dish) do
    { "curry" => 1.00,
    "xcurry" => 1.00 }
  end

  subject(:total) { takeaway.basket.values.sum }


  it 'has a list of dishes' do
    expect(takeaway.menu).to be_an_instance_of(Dishes)
  end

  it 'prints a list of dishes' do
    expect(takeaway.print_menu).to include(dish)
  end

  it 'selects from the menu' do
    expect(takeaway).to respond_to(:select_dish).with(1).argument
  end

  it 'selects from the menu' do
    takeaway.select_dish("curry")
    expect(takeaway.basket).to include "curry"
  end

  it 'starts with an empty basket' do
    # expect(takeaway.basket).to be_empty
    expect(takeaway.basket).to be_an_instance_of Hash
  end

  # it "adds up the total of one dish " do
  #   takeaway.select_dish("curry")
  #   expect(takeaway.total).to eq 1
  # end

  it "adds up the total of all dishes" do
    takeaway.select_dish("curry")
    takeaway.select_dish("xcurry")
    expect(takeaway.total).to eq total
  end


  it 'places and order' do
    takeaway.select_dish("curry")
    takeaway.select_dish("xcurry")
    expect(takeaway.total).to eq total
    # total = takeaway.basket.values.sum
    expect(takeaway.place_order).to eq "Thank you! Your order with a total of #{total} has been confirmed"
  end

  # it 'raises an error if customer total is not correct' do
  # takeaway.select_dish("curry")
  # takeaway.select_dish("xcurry")
  # total = takeaway.basket.values.sum
  # expect {takeaway.place_order}.to raise_error
  # end

  # it


end
