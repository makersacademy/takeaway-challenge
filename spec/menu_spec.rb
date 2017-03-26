require './lib/menu'

describe Menu do

  let(:menu) {described_class.new}
  let(:curry) {double :dish}

  it 'adds items to the menu' do
    menu.add(curry)
    expect(menu.list).to include (curry)
  end

  it 'prints a list of items on the menu' do
    kebab = double("kebab", :name => "Kebab", :price => 8)
    menu.add(kebab)
    expect {menu.print_menu}.to output("----------\n1. Kebab, £8\n----------\n").to_stdout
  end


end
