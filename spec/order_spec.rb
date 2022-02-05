require_relative '../lib/order.rb'

describe Order do
  let(:dish) {double :dish}

  it 'should start with an empty order' do
    expect(subject.order).to be_empty
  end

  it 'should calculate the total price of an order' do
    expect(subject.total).to eq([])
  end

  it 'lets the user select desired number of available dishes' do
    subject.order << dish
  end

    #subject.total << 3.99
    #expect{subject.view_order}.to output("Your order: #[Double :dish]\nSubtotal: £3.99\n").to_stdout
end
