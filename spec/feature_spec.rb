# require 'twilio_wrapper'
require 'chinese_restaurant'
require 'orderer'



describe 'Everything' do
  it 'Works' do
    expect do
      r = ChineseRestaurant.new
      dish_id = rand(0..r.menu.count)
      messenger = double(:messenger, send: true)
      orderer = Orderer.new(r.menu, messenger)
      orderer.show_all
      orderer.order(dish_id, 1)
      orderer.order(dish_id, 10)
      orderer.show_order
      orderer.confirm
    end.to_not raise_error
  end
end
