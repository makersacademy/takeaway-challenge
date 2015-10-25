require 'order'

describe Order do
  let(:item) { double:item }
  let(:quantity) { double:quantity }

  it 'creates an empty basket when order is initialized' do
    expect(subject.order[0]).to eq 0
  end

  it 'adds items and their quantity to the basket when selected' do
    subject.add_order(:item, :quantity)
    expect(subject.order[:item]).to be (:quantity)
  end

  it' raises an error if try to total bill and basket empty' do
    expect{subject.order_sum}.to raise_error("The basket is empty")
  end
end
