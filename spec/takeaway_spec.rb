require 'takeaway'
require 'menu'

describe Takeaway do

  let(:takeaway) { Takeaway.new(mockMenu, mockOrder, mockText) }
  let(:mockMenu) { double :menu, dishes: [mockDish] }
  let(:mockOrder) { double :order, add: [mockDish], basket: [mockDish], total: 2 }
  let(:mockText) { double :message, send: "Your order will be ready in an hour" }
  let(:mockDish) { double :dish, name: "Green Eggs and Ham", price: 2 }

  describe "#add_to_order" do
    it "adds a dish to the .order" do
      expect(takeaway.add_to_order(mockDish)).to eq([mockDish])
    end
  end

# describe "#remove_from_order" do
#   it "removes a dish from the order" do
#     
#   end
# end

  describe "#show menu" do
    it "lists the dishes and price on a menu" do
      expect(takeaway.show_menu).to eq "#{mockDish.name}, £#{mockDish.price}\n"
    end
  end

  describe "#checkout" do
    it "confirms the order and sends a text" do
      expect(takeaway.checkout).to eq "Your order will be ready in an hour"
    end
  end

end
