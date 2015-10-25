require 'takeaway'

describe Takeaway do
  it 'lists available dishes and their prices' do
    expect(subject.list_dishes).to eq("Hamburger: £1, Pizza: £2, Hotdog: £2, Tacos: £3, Nachos: £1")
  end
  describe '#add' do
    it 'can choose dishes from the menu and add them to the order' do
      subject.add("Pizza")
      subject.add("Nachos", 1)
      expect(subject.order).to eq ([{name: "Pizza", price: 2, quantity: 1}, {name: "Nachos", price: 1, quantity: 1}])
    end
    it 'can add multiple instances of the same dish to an order' do
        subject.add "Hotdog", 3
        expect(subject.order[0][:quantity]).to eq(3)
    end
  end

end
