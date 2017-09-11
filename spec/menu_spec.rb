require 'menu'
require 'pry'
require 'order'

describe Menu do

  it 'MENU PRINTS TO SCREEN' do
    expect(subject.main_menu).to eq "Make Your Order!"
  end

  it 'ORDER RICE' do
    subject.get_order(1, 2)
    expect(subject.get_order(5)).to eq [{ :item => "Rice", :quantity => 2, :price => 2 }]
  end

  it 'ORDER CURRY' do
    subject.get_order(2, 1)
    expect(subject.get_order(5)).to eq [{ :item => "Curry", :quantity => 1, :price => 5 }]
  end

  it 'ORDER CHIPS' do
    subject.get_order(3, 1)
    expect(subject.get_order(5)).to eq [{ :item => "Chips", :quantity => 1, :price => 2 }]
  end

  it 'ORDER GARLIC BREAD' do
    subject.get_order(4, 1)
    expect(subject.get_order(5)).to eq [{ :item => "Garlic Bread", :quantity => 1, :price => 4 }]
  end

  it 'CHECK WRONG TOTAL GIVES ERROR MESSAGE' do
    subject.get_order(1, 2)
    expect(subject.checkout(1)).to eq "wrong total try again"
  end

  it 'CHECK WRONG TOTAL GIVES CONFIRM MESSAGE' do
    subject.get_order(1, 2)
    expect(subject.checkout(2)).to eq "your order is on the way!"
  end
end
