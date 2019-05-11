require 'order'

describe Order do

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

end
