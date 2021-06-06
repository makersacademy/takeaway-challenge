require 'order'

RSpec.describe Order do
  let(:menu) { double(:menu, select: ['Pizza ai quattro formaggi', 9])} 
  
  it 'has 0 items in @meals' do 
    expect(subject.meals.length).to be_zero
  end

  it 'can add an item to @meals' do 
    expect{ subject.add(menu.select) }.to change {subject.meals.length}.by(1)
  end

  it 'verifies an order' do 
    expect(subject.verify).to eq(subject.meals)
  end

  it 'places an order' do 
    subject.place_order
    expect(subject.order_ok?).to be_truthy
  end

  it 'returns a message' do 
    allow(subject).to receive(:order_ok?) { true }

    expect(subject.message).to eq("Thank you! Your order was placed and will be delivered before #{Time.now + 3600}")
  end

end