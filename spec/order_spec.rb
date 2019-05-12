require 'order'

describe Order do

  before(:each) do
    allow(subject).to receive(:send_confirmation).and_return("A text has been sent with your delivery time!")
  end

  it 'making a new order' do
    expect(subject.list).to eq ([])
  end

  it 'show menu with option to quit' do
    allow(subject).to receive(:gets).and_return("")
    subject.choose_from_menu
    expect(subject.list).to eq ([])
  end

  it 'add a choice to the list' do
    allow(subject).to receive(:gets).and_return("green", "1" "")
    subject.choose_from_menu
    expect(subject.list).to eq ([{"Gunpowder green" => 1.80}])
  end

  it 'add multiples to the list' do
    allow(subject).to receive(:gets).and_return("green", "3", "")
    subject.choose_from_menu
    expect(subject.list).to eq ([{"Gunpowder green" => 1.80}, {"Gunpowder green" => 1.80}, {"Gunpowder green" => 1.80}])
  end

  it 'can check order total' do
    allow(subject).to receive(:gets).and_return("green", "3", "")
    subject.choose_from_menu
    subject.calculate_total
    subject.format_order
    expect(subject.total).to eq(5.4)
  end

  it 'can format order' do
    allow(subject).to receive(:gets).and_return("green", "3", "")
    subject.choose_from_menu
    subject.calculate_total
    subject.format_order
    expect(subject.formatted_order).to eq("
- Gunpowder green, £1.8
- Gunpowder green, £1.8
- Gunpowder green, £1.8

- Total:           £5.4

")
  end

  it 'can reject order if wrong' do
    allow(subject).to receive(:gets).and_return("no")
    expect{subject.checkout}.to raise_error("cancelled")
  end

  it 'sends a text at confirmation' do
    allow(subject).to receive(:gets).and_return("yes")
    expect(subject.checkout).to eq("A text has been sent with your delivery time!")
  end

  it 'clears the order after placing it' do
    allow(subject).to receive(:gets).and_return("white", "2", "yes")
    subject.choose_from_menu
    subject.checkout
    subject.reset_order
    expect(subject.list).to eq ([])
    expect(subject.formatted_order).to eq("")
  end

end
