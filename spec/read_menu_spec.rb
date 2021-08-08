require 'read_menu'

describe ReadMenu do

  let(:full_menu) { double( items: [ 
    { dish: "Pepperoni", price: 12 },
    { dish: "4 Cheeses", price: 11 },
    { dish: "BBQ Meat Feast", price: 13 },
    { dish: "Magherita", price: 10 } ] 
  )}

  subject(:menu_reader)       { described_class.new(menu_class: full_menu) }

  it 'is expected to output a list of menu items with price' do
    expect { menu_reader.list_menu }.to output { "dish - Pepperoni price - 12 dish - 4 Cheeses price - 11 dish - BBQ Meat Feast price - 13 dish - Magherita price - 10" }.to_stdout
  end

end