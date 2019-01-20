require 'order'

RSpec.describe Order do
  let(:subject){ Order.new }

  it 'initializes an empty order list'do
    expect(subject.order_list).to be_empty
  end

end
