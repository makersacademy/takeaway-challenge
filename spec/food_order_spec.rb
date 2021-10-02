require "food_order"
require "menu"
require "text_client"

describe FoodOrder do

  let(:dish_list) { { "test dish1" => 6.00, "test dish2" => 4.00, "test dish3" => 4.00 } } 
  let(:menu_double) { instance_double(Menu, menu: dish_list) }

  let(:formatted_time) { (Time.now + 3600).strftime("%k:%M") }
  let(:formatted_confirmation) { "Thank you! Your order was placed and will be delivered before #{formatted_time}" }

  let(:text_client_double) { instance_double(TextClient) }

  subject { described_class.new(menu_double, text_client_double) }

  context "placing an order" do
    before(:example) do
      subject.add_dish("test dish1")
      subject.add_dish("test dish3")
    end

    describe "#add_dish" do
      it "adds dishes to the customer's basket" do
        expect(subject.basket).to eq [{ "test dish1" => 6.00 }, { "test dish3" => 4.00 }]
      end
    end

    describe "#total" do
      it "returns the total sum of all orders in the basket" do
        expect(subject.total).to eq 10
      end
    end

    describe "#check_total" do
      it "returns true if #total matches the sum of the dishes in the basket" do
        price = 10
        expect(subject.correct_total?(price)).to be_truthy
      end
    end

    describe "#place_order (normal basket)" do
      it "returns a message when an order has been placed" do
        allow(text_client_double).to receive(:send_text).and_return(formatted_confirmation)
        expect(subject.place_order).to eq formatted_confirmation
      end
    end
  end

  describe "#place_order (empty basket)" do
    it "raises an error when the basket is empty" do
      expect { subject.place_order }.to raise_error "You cannot place an order with an empty basket"
    end
  end
end
