require 'menu.rb'

describe Menu do

  describe '#view' do

    it 'prints out the menu' do
      menu = "1. Green Curry £9\n2. Red Curry £9\n3. Stir Fry £7\n4. Pad Thai £6\n5. Chicken Wings £4\n6. Spring Rolls £4\n7. Tom Yum Soup £5\n"
      expect { subject.view }.to output(menu).to_stdout
    end
    
  end

end
