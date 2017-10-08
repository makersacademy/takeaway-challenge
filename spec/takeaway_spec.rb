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

  describe "verify_order" do
    it 'prints the full list of items and alongside the total' do
    order = takeaway.new_order('Tim')
    takeaway.select_dish("Tom Yum", 2)
    expect(takeaway.verify_order).to eq "[{\"Tom Yum\"=>7}, {\"Tom Yum\"=>7}] 14"
    end
  end

  describe "#place_order" do
    it 'raises error if number passed does not equal number from verify order' do
    order = takeaway.new_order('Tim')
    takeaway.select_dish("Tom Yum", 2)
    time = Time.new + (60 * 60)
    expect{takeaway.place_order(12)}.to raise_error "The total amount is not correct. Verify the order"
    end
  end

  describe "#place_order" do
    # let(:takeaway) { double :takeaway }
    # context 'to prevent a text being sent' do
    #
    #   before do
    #     allow(:takeaway).to receive(:incorrect?).and_return true
    #   end

    it 'sends a text saying that the order will be ready in one hour if total is correct' do
      order = takeaway.new_order('Tim')
      takeaway.select_dish("Tom Yum", 2)
      time = Time.new + (60 * 60)
      total = 14
      takeaway.place_order(total)
      expect(takeaway.incorrect?).to eq false
      end
    end
  end
