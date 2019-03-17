require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:dish) { double :dish }
  let(:order) { double :order }
  let(:text_message) { double :text_message }
  let(:order_class) { double :order_class, new: order }
  subject(:takeaway) { Takeaway.new(menu, order_class, text_message) }

  it 'should return an array of dishes when view_menu method is called' do
    allow(menu).to receive(:dishes) { [dish] }
    expect(takeaway.view_menu).to eq [dish]
  end

  it 'should send confirmation text when place_order method is called succesfully' do
    allow(order).to receive(:create_order) { order }
    allow(text_message).to receive(:send_text) { 'text sent' }
    expect(takeaway.place_order({ dish: dish, number: 2 }, 10)).to eq 'text sent'
  end
end
