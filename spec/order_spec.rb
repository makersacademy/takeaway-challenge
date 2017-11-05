require './lib/order.rb'
require './lib/menu.rb'

describe Order do
  subject(:order) { described_class.new }

  describe '#view_menu' do
    it 'should return the menu' do
      expect(subject.view_menu).to eq Menu::DISH_MENU
    end
  end

  describe '#print_menu' do
  #   it 'should return a formated list of dishes and prices' do
  #     expect(subject.print_menu).to eq formated_list
  #   end
  end
end
