require './lib/menu.rb'

describe Menu do
  let(:csv) { double :csv }
  let(:menu_file) { double :menu_file }
  let(:menu) { described_class.new }

  it 'prints the menu header' do
    expect { subject.print_menu_header }.to output("Welcome to Adbuls OK late night eatery. Open 25-7. Food for your future self.\n").to_stdout
  end

  it 'opens the file with the menu on' do
    menu.open_menu
    allow(csv).to receive(:open)
  end

  it 'it prints each line of the file to the screen' do
    menu.open_menu
    allow(menu_file).to receive(:readlines)
    menu.print_menu
  end

end
