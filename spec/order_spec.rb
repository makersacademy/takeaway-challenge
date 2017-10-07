require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:basket) { double(basket) }
  let(:menu) { double(menu)}

  it "#add_item" do
    expect(order).to respond_to(:add_item)
  end

end
