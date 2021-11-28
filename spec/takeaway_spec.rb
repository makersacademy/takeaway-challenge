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

  describe '#show_total' do
    it 'displays the total cost of the order' do
        subject.add_to_order("Eggs Benedict")
      expect(subject.show_total).not_to eq 0
    end
  end 
end 
