require 'menu'

describe Menu do
  it { is_expected.to respond_to(:show) }

  it 'should add item to menu' do
    subject.add_dish('pizza', 2.99)
    expect(subject.show).to eq "{\"pizza\"=>2.99}"
  end

  it 'should return price of item' do
    subject.add_dish('pizza', 2.99)
    expect(subject.price('pizza')).to eq 2.99
  end

end
