require 'takeaway'
require 'order'

describe Takeaway do

subject(:takeaway) {described_class.new}

  it 'has a menu on inititialisation' do
  expect(takeaway.menu).to be_instance_of(Hash)
  end

    describe '#view_menu'do
    it "has a method which prints the contents of menu" do
    expect(takeaway.view_menu).to include "Spring Rolls"
    end
  end

    describe '#New Order' do
    it 'creates an order object with the customer name as a reference' do
    expect(takeaway.new_order("Zara")).to be_instance_of(Order)
    end
  end

  describe '#select_dish' do
    it 'selects a number of dishes from the menu hash' do
    order = takeaway.new_order('Tim')
    takeaway.select_dish("Tom Yum", 2)
    expect(order.dish_list).to eq [{"Tom Yum" => 7}, {"Tom Yum" => 7}]
    end
end

  # describe '#update_order' do
  #   it 'updates the order with the selected dishes' do
  #     takeaway.select_dish("Tom Yum")
  #     expect(takeaway.update_order).to include "Tom Yum"
  #   end
  # end
end
