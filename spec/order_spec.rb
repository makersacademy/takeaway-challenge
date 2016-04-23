require 'order'

describe Order do
  subject(:order) {described_class.new}
  let(:dish_tikka) {double(:dish_tikka, price: 7)}
  let(:dish_chow) {double(:dish_chow, price: 6)}

  it 'expects to add dish and quantity to order' do
    expect(order).to respond_to(:add).with(2).arguments
  end

  it 'expects payment of order to check sum of dishes prices' do
    expect(order).to respond_to(:payment).with(1).argument
  end

  it 'raises error when payment does not match sum of dishes prices' do
    order.add(dish_tikka, 3)
    order.add(dish_chow, 2)
    err = "Unverified order: payment does not match order sum. Change payment."
    expect{order.payment(100)}.to raise_error err
  end

end
