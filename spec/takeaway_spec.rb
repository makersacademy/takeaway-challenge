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

  describe '#add_to_basket' do
        it 'adds the food item and its price into my basket' do
        subject.add_to_basket("Eggs Benedict")
        expect(subject.basket).to include (["Eggs Benedict", 8.5])
        end    

  end

  describe '#show_cost' do
    it 'displays the total cost of the order' do
        subject.add_to_basket("Eggs Benedict")
      expect(subject.show_cost).not_to eq 0
    end
  end 
end 
