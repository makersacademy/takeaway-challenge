require 'takeaway'

describe Takeaway do

    it 'stores a menu' do
     expect(subject.menu).not_to be_empty
    end

  describe '#show_menu' do
    it 'shows the menu items' do
    expect { subject.print_menu }.to output.to_stdout
    end 
  end
end 
