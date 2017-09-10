require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  it 'creates a new instance of menu' do
    expect(menu).to be_a(Menu)
  end

  context '#initialize' do
    it 'has an Italian menu present' do
      expect(menu.italian_menu).not_to be_empty
    end
  end

  context '#header and footer' do
    it 'displays the header' do
      expect(menu.header).to eq("Ciao, welcome to Nero's Pizzeria")
    end

    it 'displays the footer' do
      expect(menu.footer).to eq("A presto!")
    end
  end

  context '#print menu' do
    it 'can print the italian menu' do
      expect(menu.print_menu).to be_a Hash #why can't the menu be printed as is
    end
  end
end
