require 'Basket'

describe Basket do
  let(:basket) {Basket.new}
  let(:curry) {double(:dish, :name => "curry", :price => 8)}
  let(:rice) {double(:dish, :name => "rice", :price => 3)}
  it "starts off with no dishes" do
    expect(basket.dishes).to be_empty
  end

  describe "#add" do
    it "can add a dish" do
      basket.add(curry)
      expect(basket.dishes[curry]).to eq 1
    end

    it "can add multiple of the same dish at once" do
      basket.add(curry,2)
      expect(basket.dishes[curry]).to eq 2
    end

    it "updates the total price" do
      expect{basket.add(curry,2)}.to change{basket.total_price}.by(16)
    end
  end



  describe "#correct_total?" do
    it "should return true for an empty basket" do
      expect(basket).to be_correct_total
    end

    it "should return true after dishes added" do
      basket.add(curry)
      basket.add(rice)
      expect(basket).to be_correct_total
    end

    it "should raise an error if price changed after dish added" do
      basket.add(curry)
      allow(curry).to receive(:price).and_return(10)
      expect{basket.correct_total?}.to raise_error "Total price is wrong. Please try again."
    end
  end

  describe "#place_order" do
    # it "sends a confirmation the order has been placed" do
      
    # end

    it "clears the basket" do
      basket.add(curry)
      basket.place_order
      expect(basket.dishes).to be_empty
    end

    it "checks the order total" do
      expect(basket).to receive(:correct_total?)
      basket.place_order
    end

    it "prints a summary of the order with a total price" do
      basket.add(curry,2)
      basket.add(rice)
      expected_output = "Curry x2 - £16\nRice x1 - £3\n\nTotal: £19"
      expect {basket.place_order}.to output(expected_output).to_stdout
    end 
  end
end