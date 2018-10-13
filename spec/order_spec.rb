require 'order'

describe Order do

  it 'starts with an empty basket' do
    expect(subject.basket).to be_empty
  end

  it 'starts with a total of 0' do
    expect(subject.total).to eq(0)
  end

  it 'adds items to basket' do
    subject.add_to_basket("pizza", 2)
    expect(subject.basket).to include({ item: "pizza", quantity: 2 })
  end

  it 'adds to the total' do
    subject.add_to_total(10.00, 2)
    expect(subject.total).to eq(20.00)
  end

  it 'prints list of dishes, quantities and total' do
    subject.add_to_basket("pizza", 2)
    subject.add_to_total(7.00, 2)
    expect(subject.order_summary).to eq("Item: pizza, Quantity: 2\nORDER TOTAL: £14.0")
  end

end
