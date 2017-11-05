require './lib/order.rb'
require './lib/menu.rb'

describe Order do
  let(:menu) { Menu.new }
  subject(:order) { described_class.new(menu) }

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

  describe '#add' do
    it 'should add a dish to current_order' do
      subject.add('tikka')
      expect(subject.current_order.values).to eq [menu.list[:Tikka]]
    end

    it 'should add 1 quantity for each add' do
      subject.add('dopiaza')
      subject.add('dopiaza')
      expect(subject.current_order[:Dopiaza].quantity).to eq 2
    end
  end

  describe '#delete' do
    it 'should delete a dish from current_order' do
      subject.add('Passanda')
      subject.delete('Passanda')
      expect(subject.current_order).to eq Hash.new
    end

    it 'should reduce 1 quantity for each delete' do
      subject.add('Bhuna')
      subject.add('Bhuna')
      subject.delete('Bhuna')
      expect(subject.current_order[:Bhuna].quantity).to eq 1
    end
  end
end
