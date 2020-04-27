require 'kitchen'
require 'takeaway'

describe Kitchen do
  subject(:kitchen) { described_class.new }
  let(:order) { double() }
  
  it 'should save order' do
    kitchen.order "Tomato Salad"
    expect(kitchen.order_cart).to eq kitchen.order_cart
  end

  it 'should save multiple orders' do
    kitchen.order "Calamari"
    kitchen.order "Tomato Salad"
    expect(kitchen.order_cart).to eq kitchen.order_cart
  end

  it 'should print order and total' do
    kitchen.order "Calamari"
    kitchen.order "Tomato Salad"
    expect { kitchen.order_total }.to output.to_stdout
  end

end
