require 'menu'

describe Menu do

  subject(:menu) { described_class.new }


  it 'returns the starter menu' do
    
    expect { menu.print_starter_menu }.to output("Starter menu: #{menu.starters}\n").to_stdout
  end
  it 'returns the main menu' do
    expect { menu.print_main_menu }.to output("Main menu: #{menu.mains}\n").to_stdout

  end
end