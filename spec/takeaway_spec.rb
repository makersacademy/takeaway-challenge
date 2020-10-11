require './lib/takeaway'
describe Takeaway do
  let(:menu) { double :menu }
  let(:order) { double :order }
  describe '#view_menu' do
    it 'can view a menu of dishes' do
      allow(menu).to receive(:view_dishes) { menu }
      subject.view_menu
    end
  end

  describe '#add_to_order' do
    it 'can order dishes from the menu' do
      allow(order).to receive(:add).and_return("Pizza", 18, 1)
      subject.add_to_order("Pizza", 18, 1)
    end

    it 'will raise an error if a dish is not on the menu' do
      expect { subject.add_to_order("Lobser Linguni", 30, 1) }.to raise_error "Dish unavailable"

    end
  end

  describe '#view_order' do
    it 'can veiw an order' do 
      allow(order).to receive(:view) { order }
      subject.view_order
    end
  end

  describe '#order_total' do
    it 'confirms the value of an order and quantity' do
      subject.add_to_order("Seafood linguine", 30, 1)
      subject.add_to_order("Seafood linguine", 30, 1)
      subject.add_to_order("Pizza", 18, 1)
      subject.add_to_order("Carbonara", 26, 1)
      expect { subject.order_total }.to output("You basket contains 4 dishes with the total value of £104.\n").to_stdout
    end
  end

  describe '#confirmed_order' do
    it 'will raise an error if payment is incorrect' do
      subject.add_to_order("Seafood linguine", 30, 1)
      subject.add_to_order("Pizza", 18, 1)
      expect{ subject.confirm_order(40) }.to raise_error "Incorrect payment"
    end
  end
end
