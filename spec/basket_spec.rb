require 'basket'
describe Basket do
  it "contains the current order array" do
    expect(subject.instance_variable_get(:@current_order)).to be_an_instance_of(Array)
  end
  
  describe "#price" do

    it "calculates the total price for basket" do 
      order = [
        { food: "vinegar yogurt", price: 3 },
        { food: "pickled crumpets", price: 6 },
        { food: "tomato ice-cream", price: 2 }
              ]
      y =  Basket.new(order)
      y.price_total
      expect(y.instance_variable_get(:@price)).to eq 11
    end
  end



end