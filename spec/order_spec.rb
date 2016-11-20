require 'order'

describe Order do

let(:menu) {double(:menu)}
let(:order)   {Order.new(menu)}

  context "When adding to order" do
    xit "should add the item to order when item is an available dish" do
      expect(order.add_to_order("Pizza")).to eq([{"Pizza" => 5}])
    end

    it "should raise an error if item does not exist on the menu" do
      allow(menu).to receive(:available_dishes).and_return(false)
      expect{order.add_to_order("Fish and Potatoes")}.to raise_error("Invalid Choice: Please pick a food on the menu")
    end
  end


end
