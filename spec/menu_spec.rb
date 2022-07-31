require_relative '../lib/menu.rb'
describe Menu do
    let (:menu) { Menu.new() }
  
it 'prints a list of dishes with prices' do
    expect { menu.display_menu }.to output(<<-output
    fries £2
    shawarma £6
    Hummus £3
    Falafel £5
    Rice £6
    output
    ).to_stdout
  end

end



