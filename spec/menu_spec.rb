require_relative '../lib/menu.rb'

describe Menu do
  
  describe '#dish_list' do
    it 'returns a list of dishes with prices' do
    expect{subject.dish_list}.to output("Cheeseburger:   £2.99\nChicken burger:   £3.99\nLarge fries:   £1.99\nSmall fries:   £0.99\nDrink:   £0.89\n").to_stdout
    end
  end
end
