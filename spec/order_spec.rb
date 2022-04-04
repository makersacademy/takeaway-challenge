require_relative '../lib/order'

describe Order do
let(:dish) { double :dish, :name => "Cod", :price => 11.0 }
  it 'has a default total of 0' do
  expect(subject.total).to eq 0
  end

  it 'should create an order of dishes from menu' do
  expect(subject.order).to eq []
  end

  it 'can add items to the order' do
    subject.add(dish)
    expect(subject.items).to include("Cod = £11")
  end 

  it 'updates the total with each added item' do
    subject.add(dish)
    expect(subject.total).to eq (5)
  end
end