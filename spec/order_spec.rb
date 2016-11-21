require 'order'

describe Order do


let(:order)   {Order.new(menu)}
let(:menu)    {double(:menu)}

  context "When adding to order" do
    it "should raise an error if item does not exist on the menu" do
      allow(menu).to receive(:available_dishes).and_return(false)
      expect{order.add_to_order("Fish and Potatoes")}.to raise_error("Invalid Choice: Please pick a food on the menu")
    end
  end

  


end
