require_relative "../lib/basket.rb"

describe Basket do
  describe "#add" do
    it "should add an item from the menu to the basket" do
      basket = Basket.new
      basket.add({ name: "Burger", price: 3 })
      expect(basket.basket[0][:name]).to(eq("Burger"))
      expect(basket.basket[0][:price]).to(eq(3))
    end
  end
  describe "#viewBasket" do
    it "should print a reciept with a breakdown of cost and subtotal at the bottom" do
      basket = Basket.new(basket: [{ name: "Burger", price: 3 }])
      expect(basket.reciept).to(eq("Burger : £3\n\n\nTotal: 3"))
    end
    it "should print a reciept with multiple added entries" do
      basket = Basket.new(basket: [
        { name: "Burger", price: 3 },
        { name: "Burger", price: 3 },
        { name: "Burger", price: 3 },
        { name: "Kebab", price: 5 },
        { name: "Chips", price: 1 },
        ])
      expect(basket.reciept).to(eq("Burger : £3\nBurger : £3\nBurger : £3\nKebab : £5\nChips : £1\n\n\nTotal: 15"))
    end
  end
end
