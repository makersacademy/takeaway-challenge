require 'menu'

describe Menu do
  it 'should be able to return a list of menu items and prices' do
    expect(subject.display).to eq ["1. Garlic Bread £3", "2. Olives £1", "3. Hummus £2", "4. Pizza £10"]
  end

end
