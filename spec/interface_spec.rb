require 'interface'

describe Interface do

  before do
    @filepath = '/Users/malinnaleach/Programs/takeaway-challenge/lib/test.csv'
  end

  subject(:interface) {described_class.new(@filepath)}

  it 'should show menu' do
    expect(interface.menu_array).to eq ["1. Margherita  £5.95"]
  end

  # it 'should build an order based on user input' do
  #   allow(interface).to receive(:user_dish).and_return(1)
  #   allow(interface).to receive(:user_quantity).and_return(3)
  #   interface.build_order
  #   expect(interface.order.total_cost).to eq 5.95 * 3
  # end

  # it 'should show order' do
  #   allow(interface).to receive(:order.).and_return(1)
  # end

end
