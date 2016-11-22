require 'basket_item'

describe BasketItem do
    let(:amok) {instance_double("Dish", :name => "Amok", :price => 4)}
    let(:basket_item) {described_class.new(amok,2)}

    it "calculates sub total price" do
      expect(basket_item.sub_total).to eq 8
    end

    it "should give the name as the dish name" do
      expect(basket_item.name).to eq "Amok"
    end

    it "should give the price" do
      expect(basket_item.price).to eq 4
    end

    it "should give the quantity" do
      expect(basket_item.quantity).to eq 2
    end

end
