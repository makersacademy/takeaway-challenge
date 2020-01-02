require "restaurant"

describe Restaurant do
  let(:takeaway) { double :takeaway, empty?: false, complete: "Thank you for your order" }
  let(:text_provider) { double :text_provider }
  let(:restaurant) { Restaurant.new(takeaway, text_provider) }

  describe "#checkout" do
    it "should place the takeaway order if the given amount matches the total of the takeaway order" do
      allow(takeaway).to receive(:correct_amount?).and_return(true)
      allow(text_provider).to receive(:send_text)
      expect(restaurant.checkout(20)).to eq "Thank you for your order"
    end

    it "should raise an error if the given amount does not match the total of the takeaway order" do
      allow(takeaway).to receive(:correct_amount?).and_return(false)
      expect { restaurant.checkout(50) }.to raise_error "Payment amount not correct"
    end

    it "should raise an error if the takeaway basket is empty" do
      allow(takeaway).to receive(:empty?).and_return(true)
      expect { restaurant.checkout(50) }.to raise_error "The takeaway basket is empty"
    end
  end
end
