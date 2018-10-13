require 'basket'
require 'takeaway'
describe Basket do

  let(:takeaway) { double :takeaway }

  it 'puts ordered items in a basket' do
    takeaway = Takeaway.new
    takeaway.order('margherita')
    takeaway.order('pepperoni')
    expect(subject.basket).to eq ['margherita','pepperoni']
  end

  it 'allows user to check ordered items and total cost' do
    takeaway = Takeaway.new
    takeaway.order('margherita')
    takeaway.order('pepperoni')
    expect(takeaway.display_basket).to eq(
      "Your order:\nmargherita: £8\npepperoni: £9\nTotal: £17"
    )
  end

end
