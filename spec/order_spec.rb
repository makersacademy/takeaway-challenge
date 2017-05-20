require 'order'

describe Order do
  subject(:order) {described_class.new}

  it 'should open a new order' do
    expect(order).to respond_to(:menu_index)
  end

  it 'should take users input of line number' do
    allow($stdin).to receive(:gets).and_return("2")
      expect(order.choice).to be == "2"
  end
end
