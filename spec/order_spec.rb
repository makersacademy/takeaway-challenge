require 'order'
require 'pry'

describe Order do

  it 'displays the entire menu' do
    expect(subject.view_menu).to eq "pizza £9.00\npasta £8.00\ncurry £10.00\nburger £11.00\nveggie burger £10.00"
  end

  it "allows the user to add items to their basket" do
    subject.add_to_order('veggie burger', 4)
    expect(subject.basket).to include({'veggie burger' => 4})
  end

  it "multiplies the price by the quantity" do
    subject.add_to_order('veggie burger', 4)
    expect(subject.order_total).to eq [40.00]
  end

  it "adds up all the item prices x quantity" do
    subject.add_to_order('veggie burger', 4)
    subject.add_to_order('pizza', 2)
    expect(subject.sum_order).to eq 58
  end

  it "gives a default quantity of 1" do
    subject.add_to_order('veggie burger')
    expect(subject.order_total).to eq [10.00]
  end

  it 'raises error if user tries to add unavailable item' do
    expect{subject.add_to_order('bacon roll')}.to raise_error(RuntimeError)
  end

  it 'sends text' do
    subject.add_to_order('veggie burger', 4)
    subject.add_to_order('pizza', 2)
    subject.sum_order
    subject.check_total
    expect(subject.sms).to be_a Message
  end


end
