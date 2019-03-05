require 'order'
require 'menu'

describe Order do

  # let (:dish) {double :dish}
  # let (:menu) {double :menu}
  # allow (:menu).to receive

  subject(:order) {Order.new}

  it {is_expected.to respond_to :menu }
  it {is_expected.to respond_to :basket}
  it {is_expected.to respond_to(:add_order).with(2).argument}

  # it 'takes order' do
  #   order.add_order(:dish, 1)
  #   expect(order.basket[-1]).to eq (:dish)
  # end
end
