require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  # let(:dishes) { double(:dishes, name: "Chop Suey", price: 15.99) }
  let(:list) do
    {
      "Chop Suey" => 15.99,
      "Thai Curry" => 11.99,
      "Singapore Noodles" => 9.99
    }
  end

  describe "showing dishes" do
    it 'is instantiated with a menu' do
      expect(takeaway.menu).to be_instance_of Dishes
    end

    it 'prints a menu' do
      expect(takeaway.print_menu).to include(list)
    end
  end

  describe 'selecting dishes' do
    subject(:dish) { "Chop Suey" }
    it 'adds a dish to the current order' do
      takeaway.select(dish)
      expect(takeaway.current_order).to include(dish)
    end
  end

  describe 'showing order total' do
    subject(:dish) { "Chop Suey" }
    subject(:dish1) { "Thai Curry" }
    it 'shows the order total' do
      takeaway.select(dish)
      takeaway.select(dish1)
      total = takeaway.current_order.values.sum
      expect(takeaway.order_total).to eq total
    end
  end

end
