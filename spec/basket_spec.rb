require 'basket'

describe Basket do
  subject(:basket) { described_class.new }

  describe "#new_item" do
    it "has a new item method" do
      expect(basket).to respond_to(:new_item)
    end

    it "adds item to basket_contents" do
      expect(basket.basket_contents).to receive(:<<).with({ item: "Murgh Masala", quantity: 1, cost: 6.9 })
      basket.new_item({ item: "Murgh Masala", quantity: 1, cost: 6.9 })
    end

    it "adds to subtotal" do
      expect{ basket.new_item({ item: "Murgh Masala", quantity: 1, cost: 6.9 }) }.to change{ basket.subtotal }.by(6.9)
    end
  end

  describe "#subtotal"
    it "keeps a subtotal for order" do
      expect(basket).to respond_to(:subtotal)
    end

  describe "#check_total" do
    it "returns true if subtotal is correct" do
      basket.new_item({ item: "Murgh Masala", quantity: 1, cost: 6.9 })
      expect(basket.check_total).to eq(true)
    end
    it "returns false if subtotal is incorrect" do
      basket.new_item({ item: "Murgh Masala", quantity: 1, cost: 6.9 })
      allow(basket).to receive(:subtotal).and_return(0)
      expect(basket.check_total).to eq(false)
    end
  end
end
