  require 'dishes'

  describe Dishes do

  describe "#display_menu" do
    it 'displays the menu and prices' do
      expect(subject.display_menu).to eq ( { "chow mein" => 2.99, "egg fried rice" => 1.99, "spring rolls" => 2.99 } )
    end
  end

  describe "#choose_dish" do
    it "allows customers to select an item from the menu" do
      expect(subject).to respond_to(:choose_dish).with(1).argument
    end

    it "allows customers to order only from the menu" do
      expect(subject.choose_dish "chow mein").to eq ["chow mein"]
    end

    it "raises an error if an item not on the menu is ordered" do
      expect{ subject.choose_dish "coke" }.to raise_error "This item is not available on the menu"
    end
  end

  describe "#total_order" do
    it "checks the amount ordered is correct" do
      expect(subject.total_order).to be 0
    end
  end

  describe "#place_order" do
    it "raise error if no items have been ordered" do
      expect{ subject.place_order }.to raise_error "No items have been ordered, please order items"
    end
  end

  describe "#send_sms_message" do
    it "sends a message to confirm delivery time" do
      expect(subject).to respond_to(:send_sms_message)
    end
  end

  end