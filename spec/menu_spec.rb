require './lib/menu.rb'

describe Menu do
  it 'prints the menu header' do
    expect { subject.print_menu_header }.to output("Welcome to Adbuls OK late night eatery. Open 25-7. Food for your future self.\n").to_stdout
  end

  it 'menu list is created as an empty hash' do
    expect(subject.menu_hash).to be_instance_of(Hash)
  end

  # it 'prints the menu' do
  #   expect { subject.print_menu }.to output("1. Metalic fried virus.\n", + "£\n" + "9.99\n").to_stdout
  # end

end
