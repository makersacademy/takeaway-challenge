require 'menu'

describe Menu do
  let(:murtabak) { double :dish, name: 'Murtabak', price: 10 }

  it 'can add a dish' do
    subject.add_dish(murtabak)
    expect(subject.dishes).to eq [murtabak]
  end

  it 'can remove a dish' do
    subject.add_dish(murtabak)
    subject.remove_dish(murtabak)
    expect(subject.dishes).to eq []
  end
end
