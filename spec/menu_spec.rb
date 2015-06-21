require 'Menu'

describe Menu do

  it 'Creates a menu which can be viewed' do
    expect(subject.show_menu).not_to be_empty
  end

  it 'Correctly displays prices for pizzas' do
    expect(subject.show_menu[:meaty]).to eq 11
  end
end
