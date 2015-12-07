require 'place_order'
#name of class and files should
describe Order do
subject(:order) { described_class.new }

describe "#order" do
  it 'acknowledges order' do
    expect(order.order(["chicken"],[1])).to eq "order placed"
  end
end

describe '#total' do
  it 'should display the total of your order' do
    order.order(["chicken"],[1])
    expect(order.total).to eq "Your total is £10.00"
  end

  it 'should raise an error if the order is not in the menu' do
    expect{order.order(["cheese"],[1])}.
    to raise_error "Item not available"
  end
end

it 'should have access to the menu' do
  expect(order.menu).to eq Restaurant::MENU
end

context "when you have finished ordering" do
  describe "#checkout" do

    it 'should reset total when checked out' do
      order.order(["chicken"],[1])
      expect(order.checkout(10)).to eq 0
    end

    it 'should raise an error if the sum does not match the actual total' do
      message = "Incorrect ammount paid"
      expect{order.checkout(5)}.to raise_error(message)
    end
  end
end



end
