require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:dish) { double :dish, name: "chow mein", price: 5.00 }
  let(:dish2) { double :dish2, name: "sweet and sour chicken", price: 6.00 }

  it "allows customer to start with an empty basket" do
    expect(order.basket).to be_empty
  end

  describe "#add_dish" do
    it "allows customer to add dishes to basket" do
      order.add_dish(dish)
      expect(order.basket[dish.name]).to eq 1
    end

    it 'allows customer to customise quantity of dishes in order' do
     order.add_dish(dish, 4)
     expect(order.basket[dish.name]).to eq 4
    end
  end

  describe "#remove_dish" do
    before { order.add_dish(dish) }

    it "allows customers to remove a dish from basket" do
      order.remove_dish(dish)
      expect(order.basket[dish.name]).to eq 0
    end

    it "can only remove the dish in the basket" do
      expect { order.remove_dish(dish2) }.to raise_error "This dish is not in the basket."
    end
  end

  describe "#review_order" do
    it 'allows customer to view the basket' do
      order.add_dish(dish)
      expect(order.review_order).to eq({ 'chow mein' => 1 })
    end
  end
  
  describe "#total_price" do
    it 'order total to be sum of dishes added' do
      order.add_dish(dish)
      order.add_dish(dish2)
      expect(order.order_total).to eq 11.00
    end
  end



end
