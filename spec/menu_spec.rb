require 'menu.rb'

describe Menu do

  it { is_expected.to respond_to :dishes }

  it 'has more than one dish' do
    expect(subject.dishes.count).to be > 1
  end

  it 'can find a dish on the menu' do
    expect(subject.find_dish('pizza').name).to eq 'Pizza'
  end

  it 'raise error if the chosen dish was not found in the menu' do
    expect { subject.find_dish('house').name }.to raise_error 'Dish not found'
  end

end
