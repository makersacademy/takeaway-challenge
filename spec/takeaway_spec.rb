require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new(mock_menu_class, mock_sms_class, mock_time_class) }
  let(:mock_menu_class) { double :menu_class, new: mock_menu }
  let(:mock_menu) { double :menu, menu: {salad: 5, chips: 5, chicken: 8, steak: 10}}
  let(:mock_sms_class) { double :sms, new: mock_sms}
  let(:mock_sms) {double :sms}
  let(:mock_message) {double :message}
  let(:mock_time_class) { double :time, new: time }
  let(:time) { 10000 }


  it "Whole class" do
    expect(takeaway).to respond_to(:menu, :add_item, :place_order, :calculate_sum)
  end

  describe "#show_menu" do
    it "returns a menu" do
      expect(takeaway.show_menu).to eq(takeaway.menu)
    end
  end

  describe "#add_item" do
    it "adds an item to the order" do
      item = :chips
      takeaway.add_item(item)
      expect(takeaway.order).to eq [item]
    end

    it "will no accept item not on the menu" do
      item = :beef
      expect(takeaway.add_item(item)).to eq "Item not available."
    end
  end

  describe "#calculate_sum" do
    it "returns the cost of one item (chips)" do
      item = :chips
      takeaway.add_item(item)
      expect(takeaway.calculate_sum).to eq 5
    end

    it "returns the cost of multiple items (chips + steak + salad)" do
      item = :chips
      item2 = :steak
      item3 = :salad
      takeaway.add_item(item)
      takeaway.add_item(item2)
      takeaway.add_item(item3)
      expect(takeaway.calculate_sum).to eq 20
    end
  end

  describe "#place_order" do
    it "placing an order sends a message" do
      # allow makes a stub whereas expect makes a mock
      # using expect with "and_return" will fail if method :send is not called
      # takeaway.place_order uses the actual time variable in the code, but allow uses the mock created above
      allow(mock_sms).to receive(:send).with(time + 3600).and_return("Thank you, your order was placed and should arrive at #{time}")
      expect(takeaway.place_order).to eq "Thank you, your order was placed and should arrive at #{time}"
    end

    # above #allow method lets RSpec believe the code is as follows:
    # #takeaway.place_order
    #   mock_sms.send-stub(time-double)
    # end
    # why isn't time variable stubbed by my stub? And how does it pass the test if two different instances of time are called?

    it "#place_order method calls #send with time as an argument" do
      expect(mock_sms).to receive(:send).with(time + 3600).and_return("Thank you, your order was placed and should arrive at #{time}")
      takeaway.place_order
    end
  end

end
