require 'menu'

describe Menu do

  
  describe '#format menu' do
      menu = Menu.new([{item: 'pizza', price: 3}])
      specify { expect { menu.format_menu }.to output("1. pizza ~ £3\n").to_stdout }

  end
end