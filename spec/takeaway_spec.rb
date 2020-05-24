require 'Takeaway'
require 'Menu'

describe Takeaway do   
    subject(:takeaway) { described_class.new(menu: menu) } 

    let(:menu) { double(:menu, print: display_menu) }
    let(:display_menu) { "pizza: £1.00" }

    it "returns the menu of dishes and prices" do
        expect(subject.display_menu).to eq(display_menu)
    end

    it "returns the dishes added to order (order method) as a string"do
    end

    it "created the basket method to display the items ordered + the price"do
    end

end
