require 'order'
# require 'menu'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double(:menu) }

  before do
    order.select_dish("jerk chicken", 9)
  end
  
  it 'should allow a customer to order items from the menu' do
    expect(subject.selection).to eq ({ "jerk chicken" => 9 })
  end

  it 'should add the items to the order' do
    expect(order.order).to eq ([{ "jerk chicken" => 9 }])
  end
end
