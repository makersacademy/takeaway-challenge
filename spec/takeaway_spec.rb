require 'takeaway'

describe Takeaway do

  let(:dish) { double :dish, details: {:name => "Pie", :price => 5} }
  let(:menu) { double :menu, check_total: true, dishes: [dish] }
  let(:menu_class) { double :menu_class, new: menu }
  let(:twilio) { double :twilio, twilio_message: true }
  let(:twilio_sender_class) { double :twilio_sender_class, new: twilio }
  subject {described_class.new(menu_class, twilio_sender_class)}
  
  describe "#place_order" do
    it "checks the total with the menu" do
      expect(menu).to receive(:check_total)
      subject.add_to_order(dish)
      subject.place_order(5)
    end
    
    it "sends a message to twilio if the total is correct" do
      subject.add_to_order(dish)
      expect(twilio).to receive(:twilio_message)
      subject.place_order(5)
    end

    it "raises an error if the total is incorrect" do
      allow(menu).to receive(:check_total) { false }
      subject.add_to_order(dish)
      expect{ subject.place_order(5) }.to raise_error "Total incorrect!"
    end
  end

  describe "#add_to_order" do
    it "adds a dish to the current order" do
      subject.add_to_order("Pie")
      expect(subject.current_order).to include(dish)
    end
  end

  describe "add_dish" do
    it "sends a message to menu" do
      expect(menu).to receive(:add_dish)
      subject.add_dish("Pie", 5)
    end
  end

  describe "print_menu" do
    it "sends a message to menu" do
      expect(menu).to receive(:print_menu)
      subject.print_menu
    end
  end
end