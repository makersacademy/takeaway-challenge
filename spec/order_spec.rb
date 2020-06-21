require 'order'

describe Order do
  let(:order) { Order.new }
  describe '#menu_hash to' do
    it 'allows customers to access to the menu' do
      expect(order).to respond_to :menu_hash
    end

    it 'allows customers to read the contents of the menu' do
      expect(order.menu_hash).to eq({ "Noodles" => 7.50, "Pizza" => 11.89, "Chicken Curry" => 6.75, "Boiled Rice" => 2.00 })
    end
  end

  describe '#select meal' do
    it 'allows customers to select meal(s)' do
      order.select("Noodles", 2)
      expect(order.select("Noodles", 2)).to eq "You've added 2X Noodles(s) in your basket"
    end
  end

  describe '#basket' do
    it 'gives an array of the 2X Noodles ordered' do
      order.select("Noodles", 2)
      expect(order.basket).to eq ["Noodles", "Noodles"]
    end

    it 'gives an array of all dishes ordered' do
      order.select("Noodles", 2)
      order.select("Pizza", 1)
      expect(order.basket).to eq ["Noodles", "Noodles", "Pizza"]
    end
  end

  describe '#total_price' do
    it 'calculate the total price of the orders' do
      order.select("Noodles", 2)
      order.select("Pizza", 1)
      order.basket
      expect(order.total_price).to eq 'Total price: £26.89'
    end
  end
end