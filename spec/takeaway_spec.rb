require 'takeaway.rb'

describe Takeaway do

  let(:customer){ double:customer }

  it 'responds to create_bill method with an argument' do
    is_expected.to respond_to(:create_bill).with(1).argument
  end

  it 'should add up the total bill correctly' do
    t = Takeaway.new
    allow(customer).to receive(:order) { [5.00, 3.50] }
    expect(t.create_bill customer).to eq(8.5)
  end

  it 'should respond to confirm_order' do
    is_expected.to respond_to(:confirm_order).with(1).argument
  end

end