require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'can create a Menu' do
    expect(menu).to be_a_kind_of(Menu)
  end

  it 'shows a list of dishes with prices' do
    expect(menu.list_dishes).to eq [
      { olives: 2.5 },
      { bruschetta: 5 },
      { pizza: 10 },
      { pasta: 12 },
      { risotto: 18 },
      { burger: 13 },
      { steak: 20 },
      { sole: 23 },
    ]
  end

  it 'prints a lits of dishes with prices' do
    expect { menu.list_dishes }.to output("olives £2.5\nbruschetta £5\npizza £10\npasta £12\nrisotto £18\nburger £13\nsteak £20\nsole £23\n").to_stdout
  end
end
