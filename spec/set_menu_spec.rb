require 'set_menu'

describe Menu do
  it 'returns a menu' do
    expect(subject.curry_house).to be_a(MealList)
  end
end
