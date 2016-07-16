require 'menu'

describe Menu do
  let(:food){double :food}
  let(:price){double :price}

  it {is_expected.to respond_to(:display)}

  it 'displays the list of dishes' do
    subject.add_item(food, price)
    expect(subject.display).to eq subject.list
  end

  it 'adds items to menu list' do
    subject.add_item(food, price)
    expect(subject.list).to eq food => price
  end

end
