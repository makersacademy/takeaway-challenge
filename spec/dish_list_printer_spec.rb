require 'dish_list_printer'

describe DishListPrinter do
  subject(:myclass) { Class.new.extend(DishListPrinter) }
  let(:dish) { double("Dish", cost: 5, name: 'Copius Mushroom Skewers') }
  let(:dish2) { double("Dish2", cost: 4, name: 'Vegetable Omlette') }
  let(:dish3) { double("Dish3", cost: 5, name: 'Fried Egg and Rice') }

  context 'given a prefix' do
    it 'prints with the prefix' do
      list = [dish, dish2, dish3]
      messages = [
        '-   Copius Mushroom Skewers        💎  5',
        '-   Vegetable Omlette              💎  4',
        '-   Fried Egg and Rice             💎  5',
      ]
      messages.each { |message| expect(STDOUT).to receive(:puts).with(message) }
      expect(myclass.print_list(list, "-"))
    end
  end

  context 'given no prefix' do
    it 'prints with number' do
      list = [dish, dish2, dish3, dish, dish2, dish3, dish, dish2, dish3, dish, dish2, dish3]
      messages = [
        '1.  Copius Mushroom Skewers        💎  5',
        '2.  Vegetable Omlette              💎  4',
        '3.  Fried Egg and Rice             💎  5',
        '4.  Copius Mushroom Skewers        💎  5',
        '5.  Vegetable Omlette              💎  4',
        '6.  Fried Egg and Rice             💎  5',
        '7.  Copius Mushroom Skewers        💎  5',
        '8.  Vegetable Omlette              💎  4',
        '9.  Fried Egg and Rice             💎  5',
        '10. Copius Mushroom Skewers        💎  5',
        '11. Vegetable Omlette              💎  4',
        '12. Fried Egg and Rice             💎  5'
      ]
      messages.each { |message| expect(STDOUT).to receive(:puts).with(message) }
      expect(myclass.print_list(list))
    end
  end
end
