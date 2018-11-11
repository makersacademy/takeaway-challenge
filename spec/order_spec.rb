require "order"

describe Order do
  let(:basket) { double(basket) }
  subject(:order) { Order.new(basket,20) }

  it 'should respond to process' do
    expect(subject).to respond_to(:process)
  end

end
