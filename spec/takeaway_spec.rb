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
    expect(takeaway).to respond_to(:select_dish).with(2).argument
  end

  it 'selects from the menu' do
    takeaway.select_dish("curry", 1)
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
    takeaway.select_dish("curry", 1)
    takeaway.select_dish("xcurry", 1)
    expect(takeaway.total).to eq total
  end

  describe "placing order test" do
    it 'places and order' do
      takeaway.select_dish("curry", 1)
      takeaway.select_dish("xcurry", 1)
      # expect(takeaway.total).to eq total
      total = takeaway.basket.values.sum
      expect(takeaway.place_order(total)).to eq "Thank you! Your order with a total of #{total} has been confirmed"
    end

    # let(:order_total) { 3 }

    it 'reaises and error if incorrect confirmed total' do
      takeaway.select_dish("curry", 1)
      takeaway.select_dish("xcurry", 1)
      expect{takeaway.place_order(3)}.to raise_error "total is not correct, unable to secure order"
    end




  end
  # it


end
