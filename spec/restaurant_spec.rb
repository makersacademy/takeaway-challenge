require "restaurant"

describe Restaurant do
  let(:takeaway) { double :takeaway }
  let(:text_provider) { double :text_provider, send_message: "text_message" }
  let(:restaurant) { Restaurant.new(takeaway, text_provider) }

  describe "#checkout" do
  
    it "should place the takeaway order if the given amount does match the total of the takeaway order" do
      allow(takeaway).to receive(:correct_amount?).and_return(true)
      expect(restaurant.checkout(20)).to eq "text_message"
    end

    it "should raise an error if the given amount does not match the total of the takeaway order" do
      allow(takeaway).to receive(:correct_amount?).and_return(false)
      message = "The given amount does not match the total of the takeaway order"
      expect { restaurant.checkout(50) }.to raise_error message
    end
  end
end
