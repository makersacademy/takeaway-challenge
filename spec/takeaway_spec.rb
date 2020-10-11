require 'takeaway'

describe Takeaway do 
  describe '#print_menu' do
    subject(:takeaway)  { described_class.new(menu) }
    let(:menu)          { double('menu', print: printed_menu) }
    let(:printed_menu)  { { "chicken_curry" => 2.50 } }

    it 'Produces a menu of available dishes on request' do
      expect(takeaway.print_menu).to eq(printed_menu)
    end
  end

  describe '#add_to_cart' do
    subject(:takeaway)  { described_class.new(menu) }
    let(:menu)          { double('menu', available?: true) }
    

    it 'accepts dish and quantity arguments and adds to customers cart' do
      takeaway.add_to_cart("chicken_curry", 1)
 
      expect(takeaway.cart).to eq ({"chicken_curry"=> 1})

    end
  end

  describe '#checkout' do
    let(:menu)          { double('menu') }
    let(:order_class)     { double('order', checkout: message) }
    let(:message)         { ("Your order has been placed. Total cost is £22.50")}
    subject(:full_order)  { described_class.new(menu, order_class)}

    it 'checks out the cart and tells customer the cost of the order' do
     
      
      expect(full_order.checkout).to eq message
    end
  end

end

#  doubel for order - the variable associated with takeaway
# let(:order)