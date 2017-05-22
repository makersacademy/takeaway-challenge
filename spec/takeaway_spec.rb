require 'takeaway'

describe Takeaway do

  TOTAL = { price: 25 }

  subject(:takeaway) { described_class.new }

  it 'allows customers to make a new order' do
    expect(takeaway.new_order(:dish, TOTAL[:price])).to eq ([{:dish => TOTAL[:price]}])
  end

  it 'allows customers to select a dish' do
    takeaway.new_order(:dish, TOTAL[:price])
    expect { takeaway.select_dish(:dish, TOTAL[:price]) }.to change { takeaway.check_order.length }.by 1
  end

  it 'allows customers to check order' do
    expect { takeaway.check_order }.to raise_error 'No dishes selected'
  end

end
