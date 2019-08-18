require 'menu'

describe Menu do
  it 'displays list of dishes with prices' do
    raw_menu = { 'prawn cracker' => 2, 'spring roll' => 3 }
    displayed_menu = "1. prawn cracker....£2\n2. spring roll....£3\n"
    menu = Menu.new(raw_menu)
    expect { menu.display }.to output(displayed_menu).to_stdout
  end
end
