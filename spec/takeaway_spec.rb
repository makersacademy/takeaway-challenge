require_relative './../lib/takeaway'

describe Takeaway do
  it 'can list dishes with their prices' do
    expect(subject.menu).to be_an(Object)
  end

  it 'responds to ordering with many arguments' do
    expect(subject).to respond_to(:order).with_unlimited_arguments
  end

  it 'raises error when customer orders item not in the menu' do
    expect { subject.order("house") }.to raise_error("That is not a menu item, you can not order it")
  end

  it 'responds to check_total with the total cost' do
    takeaway = Takeaway.new
    takeaway.order(:soup, :fish)
    expect(takeaway.check_total).to be(5)
  end

  it 'confirms my order with a message' do
    expect(subject.order(:soup)).to eq("Thank you! Your order was placed and will be delivered before 18:52")
  end

end
