require 'menu'
require 'pry'
require 'order'

describe Order do

  it 'CHECK BALANCE' do
    subject.price(1)
    subject.item_quantity(1)
    subject.choice("Rice")
    subject.add_to_current_order
    expect(subject.balance).to eq 1
  end

  it 'CHECK CURRENT ORDER' do
    subject.price(1)
    subject.item_quantity(1)
    subject.choice("Rice")
    subject.add_to_current_order
    expect(subject.current_order.nil?).to eq false
  end

  it 'CHECK BASKET ON CHECKOUT' do
    subject.price(1)
    subject.item_quantity(1)
    subject.choice("Rice")
    subject.add_to_current_order
    subject.add_to_basket
    expect(subject.basket.nil?).to eq false
  end

  it 'CHECK TOTAL ON CHECKOUT' do
    subject.price(1)
    subject.item_quantity(1)
    subject.choice("Rice")
    subject.add_to_current_order
    subject.add_to_basket
    expect(subject.total).to eq 1
  end

  it 'SEND CONFIRM TEXT REQUEST' do
    text_confirm = double
    allow(text_confirm).to receive(:new).and_return(text_confirm)
    expect(text_confirm).to receive(:text_confirmation)
    subject.checkout(text_confirm)
  end

end
