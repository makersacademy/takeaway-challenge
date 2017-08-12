require './lib/menu.rb'

describe Menu do
  let(:csv) { double :csv }
  let(:menu_file) { double :menu_file }
  let(:menu) { described_class.new }

  it 'prints the menu header' do
    expect { subject.print_menu_header }.to output("Welcome to Adbuls OK late night eatery. Open 25-7. Food for your future self.\n").to_stdout
  end

  it 'opens the file with the menu on' do
    menu.print_menu
    allow(csv).to receive(:open)
  end

  it 'it prints each line of the file to the screen' do
    allow(menu_file).to receive(:readlines)
    menu.print_menu
  end

  it 'prints the menu hash in a less complicated way (Not opening a file)' do
    output = "1.Plastic fried virus skin: $9.99\n2.Birdpeople egg with dehydrated watermelon: $88.67\n3.Shredded concreate: $4.99\n4.Cockroach-wing encapsulated microchip: $7.97\n5.Extra powdered rocket: $2.99\n6.Ninja squirrel rolled in plastic-bag: $4.67\n"
    expect { subject.show_menu_hash }.to output(output).to_stdout
  end

end
