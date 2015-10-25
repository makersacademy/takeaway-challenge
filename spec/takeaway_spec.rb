require 'takeaway'

describe Takeaway do
  it 'lists available dishes and their prices' do
    expect(subject.list_dishes).to eq("Hamburger: £1, Pizza: £2, Hotdog: £2, Tacos: £3, Nachos: £1")
  end
  it 'can choose dishes for my order' do
    subject.add "Pizza"
    subject.add "Nachos"
    expect(subject.order).to eq ([{name: "Pizza", price: 2}, {name: "Nachos", price: 1}])
  end

end
