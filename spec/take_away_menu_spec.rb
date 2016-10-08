require 'take_away_menu'

describe TakeAwayMenu do
  subject(:take_away_menu) {described_class.new}

  it 'has a list of dishes' do
    take_away_menu.list_dishes
    expect(take_away_menu).to respond_to(:list_dishes)
  end
end
