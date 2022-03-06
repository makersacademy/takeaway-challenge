require_relative '../lib/order'
  
describe Order do

  # 2. As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  describe "#select_dish" do
    it "selects a dish from menu" do
      expect(subject).to respond_to(:select_dish).with(1).argument
    end

    it "initializes with an empty order list" do
      expect(subject.order_list).to be_empty 
    end

    it "adds dish to order list" do
      subject.select_dish("chicken")
      expect(subject.order_list).to include "chicken"
    end

    # it "raises error if dish not in menu" do
    #   menu = double(:menu)
    #   allow(menu).to receive(:menu_list).and_return({
    #     'rice' => 2,
    #     'chicken' => 3,
    #     'soup' => 2
    #   })
    #   expect { subject.select_dish("fries") }.to raise_error("Not available")
    # end

  end
  # 3. As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  
  describe "#check_order" do
    it "raises error if dish not in menu" do
      subject.select_dish("chicken")
      subject.select_dish("fries")
      expect { subject.check_order }.to raise_error "An item(s) in your order is not available"
    end
  end
  
  describe "#total" do
    it "calculates total sum of order" do
      subject.select_dish("chicken")
      subject.select_dish("rice")
      expect(subject.total).to eq "Your order total is £5"
    end
  end
end
