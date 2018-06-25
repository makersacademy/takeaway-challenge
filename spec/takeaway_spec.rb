require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new(mock_menu_class, mock_sms_class) }
  let(:mock_menu_class) { double :menu_class, new: mock_menu }
  let(:mock_menu) { double :menu, menu: {salad: 5, chips: 5, chicken: 8, steak: 10}}
  let(:mock_sms_class) { double :sms, new: mock_sms, send: mock_message}
  let(:mock_sms) {double :sms}
  let(:mock_message) {double :message}
  let(:time) { Time.new }

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
      allow(mock_sms).to receive(:send).and_return("Thank you, your order was placed and should arrive at #{:time}")
      expect(takeaway.place_order).to eq "Thank you, your order was placed and should arrive at #{:time}"
    end
  end

end
