require 'takeaway'

describe Takeaway do

  let(:menu) { double :menu, check_total: true }
  let(:menu_class) { double :menu_class, new: menu }
  let(:dish) { double :dish }
  subject {described_class.new(menu_class)}
  
  describe "#place_order" do
    it "checks the total with the menu" do
      expect(menu).to receive(:check_total)
      subject.place_order(dish, 5)
    end
    
    it "sends a confirmation if the total is correct" do
      expect(subject.place_order(dish, 5)).to eq "Thank you! Your order was placed and will be delivered before 18:52"
    end

    it "raises an error if the total is incorrect" do
      allow(menu).to receive(:check_total) { false }
      expect{ subject.place_order(dish, 5) }.to raise_error "Total incorrect!"
    end
  end

  describe "#add_to_order" do
    it "adds a dish to the current order" do
      subject.add_to_order(dish)
      expect(subject.current_order).to include(dish)
    end
  end

end