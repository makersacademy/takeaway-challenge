require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(order: order, menu: menu) }
  let(:menu) { double(:menu) }
  let(:order) { double(:order) }

  describe '#initialize'do
    # it 'initializes with a new menu' do
    #   expect(takeaway.menu).to eq menu
    # end
  end

  describe '#show_menu' do

    

  end

  # show menu
  # add to order(dish_name, quantity = 1)
  # show order
  # confirm order
  # send confirmation
  # receive order

end