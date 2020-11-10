require_relative '../lib/takeaway.rb'

describe TakeAway do
  subject(:takeaway) { described_class.new }

  context "The Takeaway" do
    it "creates a new takeaway" do
      expect(takeaway).to be_a_kind_of TakeAway
    end
  end

  context "The Menu" do
    it "creates a new menu when #new_order is called" do
      expect(takeaway.new_order).to be_an_instance_of Order
    end

  end

  context "The Order" do

  end

end
