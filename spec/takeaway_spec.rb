require 'takeaway'
require 'order'

describe Takeaway do
  let(:takeaway) { Takeaway.new }

  context "view menu" do
    it 'shows a list of dishes with prices when you view the menu' do
      expect(takeaway.view_menu).to eq({ "margarita" => 7.5, "hawaian" => 8.5, "garlic bread" => 5 })
    end
  end

  context "choose dish" do
    it 'customer can choose a number of an available dish' do
      takeaway.select("margarita", 2)
      expect(takeaway.order.basket).to eq([{ :dish => "margarita", :price => 7.5 }, { :dish => "margarita", :price => 7.5 }])
    end
  end

  context "confirm total" do

    it 'customer receives an error if the total of their order is not correct' do
      takeaway.select("garlic bread", 1)
      expect { takeaway.confirm_total(30) }.to raise_error("The correct total is: £5.00.")
    end

  end
end
