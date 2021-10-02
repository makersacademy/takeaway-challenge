require "takeaway"
require "menu"

RSpec.describe Takeaway do
  let(:takeaway) { Takeaway.new }

  describe "#user_options" do
    it "stores user input following a list of options" do
      option = double("option", :user_option => 1)
      allow(takeaway).to receive(:option).and_return(1)
    end
  end

  describe "#user_order" do
    it "displays a menu when user enters 1" do
      allow(takeaway.user_order).to receive(:option).with(1).and_return(takeaway.menu.see_menu)
    end

    it "enables user to add to a basket when user enters 2" do
      allow(takeaway.user_order).to receive(:option).with(2).and_return(takeaway.add_items)
    end

    it "displays the list of dishes ordered when user enters 3" do
      allow(takeaway.user_order).to receive(:option).with(3).and_return(takeaway.view_basket)
    end

    it "send confirmation text when user enters 4" do
      allow(takeaway.user_order).to receive(:option).with(4).and_return(takeaway.send_text)
    end

    it "exits the program when user enters 5" do
      allow(takeaway.user_order).to receive(:option).with(5).and_return(exit)
    end
  end
end
