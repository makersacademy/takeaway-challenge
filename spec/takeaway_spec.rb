require 'takeaway'

RSpec.describe Takeaway do

  context "#show_menu" do
    it "should print the menu" do
      subject.menu.add("Burger", 6.50)
      expect(subject.show_menu).to eq "Burger at £6.50\n"
    end
  end

  context "#place_order" do
    it "should return a hash of quantity and dish name" do
      subject.menu.add("Burger", 6.50)
      subject.menu.add("Cheeseburger", 5.49)
      expect(subject.place_order(5, "Cheeseburger")).to eq({ 5 => { "Cheeseburger" => 5.49 } })
    end
  end
end
