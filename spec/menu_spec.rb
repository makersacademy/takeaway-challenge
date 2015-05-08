require 'menu'

describe Menu do
  let(:murtabak) { double :dish, name: 'Murtabak', price: 10 }

  before(:each) do
    subject.add_dish(murtabak)
  end

  it 'can add a dish' do
    expect(subject.dishes).to eq [murtabak]
  end

  it 'can remove a dish' do
    subject.remove_dish(murtabak)
    expect(subject.dishes).to eq []
  end

  it 'can change the name of a dish' do
    allow(murtabak).to receive(:name=)
    subject.change_dish_name(murtabak, 'Benny\'s Murtabak')
    allow(murtabak).to receive(:name).and_return('Benny\'s Murtabak')
    expect(subject.get_dish(murtabak.name).name).to eq 'Benny\'s Murtabak'
  end

  it 'can return a specified dish' do
    expect(subject.get_dish(murtabak.name)).to eq murtabak
  end

  it 'raises an error when getting a dish that does not exist' do
    expect { subject.get_dish('Wolf poop') }.to raise_error 'Dish not on menu'
  end
end
