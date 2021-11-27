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
    let(:dish) {double :food_item}
        it 'adds food items into my basket' do
        subject.add_to_basket(dish)
        expect(subject.basket).to include (dish)
        end 
  end
end 
