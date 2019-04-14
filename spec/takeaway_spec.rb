require 'takeaway'
require 'menu'

describe Takeaway do
  it 'shows the list of dishes with prices' do
    food_person = Menu.new
    food_person.list
    expect(subject.show_menu).to eq food_person.food_list
  end

  describe '#select' do
    let(:food){ double :food }
    it 'puts the selected dishes to the cart' do
      expect(subject.select(food)).to eq "#{food} added to your cart!"
    end
  end
end
