require 'takeaway'

describe Takeaway do
  let(:takeaway){described_class.new}
  it 'lists available dishes and their prices' do
    expect(takeaway.list_dishes).to eq("Hamburger: £1, Pizza: £2, Hotdog: £2, Tacos: £3, Nachos: £1")
  end
  it 'checks that the cost of the order is correct' do
    takeaway.add "Tacos", 6; takeaway.add "Hotdog", 3
    expect(takeaway.total).to eq(24)
  end
  describe '#list_order' do
    it 'lists the items in an order' do
      takeaway.add "Tacos", 3
      takeaway.add "Nachos", 2
      expect(takeaway.list_order).to eq("Tacos, Nachos")
    end
  end
  it {is_expected.to respond_to(:send_message)}
  describe '#add' do
    it 'can choose dishes from the menu and add them to the order' do
      takeaway.add("Pizza")
      takeaway.add("Nachos", 1)
      expect(takeaway.order).to eq ([{name: "Pizza", price: 2, quantity: 1}, {name: "Nachos", price: 1, quantity: 1}])
    end
    it 'can add multiple instances of the same dish to an order' do
        takeaway.add "Hotdog", 3
        expect(takeaway.order[0][:quantity]).to eq(3)
    end
    it 'raises and error when the item requested is not on the menu' do
      expect{takeaway.add("Pepperoni")}.to raise_error("That item is not available")
    end
  end
end
