require 'restaurant'

describe Restaurant do

  it 'has a menu' do
    expect(subject.view_menu).to eq "Burger: £9.99, Pizza: £6.99, Chips: £1.99, Salad: £8.99"
  end

  it 'can check whether a dish is on the menu' do
    expect(subject.menu_include?(:Fish)).to be false
  end

  it 'respond to #take_away' do
    expect { subject.to respond_to :take_away}
  end

end
