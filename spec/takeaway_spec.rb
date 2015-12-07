require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new }

  it 'allows the customer to view the menu with prices' do
    expect(takeaway).to respond_to(:view_menu)
  end

  it 'allows the customer to order a number of dishes' do
    expect(takeaway).to respond_to(:add_to_order)
  end

  it 'allows the customer to remove dishes from their order' do
    expect(takeaway).to respond_to(:remove_from_order)
  end

  it 'allows the customer to see a summary of their order' do
    expect(takeaway).to respond_to(:view_order)
  end

  it 'allows the customer to see the total price of their order' do
    expect(takeaway).to respond_to(:total_price)
  end

  it 'only allows checkout if the figure equals the order total' do
    allow(takeaway).to receive(:total_price).and_return(15)
    expect{ (takeaway.checkout(20)) }.to raise_error "Incorrect amount. Your order total is: #{takeaway.total_price}"
  end
end
