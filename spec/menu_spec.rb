require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'can create a Menu' do
    expect(menu).to be_a_kind_of(Menu)
  end

  it 'shows a list of dishes with prices' do
    expect(menu.list_dishes).to eq [
      { olives: 2.5 },
      { brushetta: 5 },
      { pizza: 10 },
      { pasta: 12 },
      { risotto: 18 },
      { burger: 13 },
      { steak: 20 },
      { sole: 23 },
    ]
  end
end
