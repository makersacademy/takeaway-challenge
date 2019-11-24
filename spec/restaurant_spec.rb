require "restaurant"

describe Restaurant do
  let(:text_provider) { double :text_provider, send_message: "text_message" }
  let(:restaurant) { Restaurant.new(takeaway, text_provider) }

  describe "#checkout" do
    context "when the given amount does match the total of the takeaway order" do
      let(:takeaway) { double :takeaway, is_correct_amount?: true }
  
      it "should place the takeaway order" do
        expect(restaurant.checkout(20)).to eq "text_message"
      end
    end

    context "when the given amount does not match the total of the takeaway order" do
      let(:takeaway) { double :takeaway, is_correct_amount?: false }

      it "should raise an error" do
        message = "The given amount does not match the total of the takeaway order"
        expect { restaurant.checkout(50) }.to raise_error message
      end
    end
  end
end
