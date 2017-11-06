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

  describe '#add' do
    it 'should add a dish to current_order' do
      subject.add('tikka')
      expect(subject.current_order.values).to eq [menu.list[:Tikka]]
    end

    it 'should add 1 quantity for each add by default' do
      subject.add('dopiaza')
      subject.add('dopiaza')
      expect(subject.current_order[:Dopiaza].quantity).to eq 2
    end

    it 'should add a custom quantity' do
      subject.add('Dhansak', 3)
      expect(subject.current_order[:Dhansak].quantity).to eq 3
    end

    it 'should raise an error if quantity entered is not a number' do
      message = 'the entered quantity is not a numer'
      expect { subject.add('Dhansak', 'two') }.to raise_error(message)
    end

    it 'should raise an error if dish entered is not on the menu' do
      message = 'the entered dish is not on the menu'
      expect { subject.add('abc') }.to raise_error(message)
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

    it 'should raise error if trying to remove a dish not in your list' do
      message = 'No such dish in your current order'
      expect { subject.delete('Biryani') }.to raise_error(message)
    end
  end

  describe '#total_cost' do
    it 'should return the total cost of current_order' do
      subject.add('Jalfrezi')
      subject.add('Korai')
      expect(subject.total_cost).to eq 12
    end
  end

  describe '#new_order' do
    it 'should reset current_order' do
      subject.add('Korma')
      subject.new_order
      expect(subject.current_order).to eq Hash.new
    end
  end

  describe '#cancel_order' do
    it 'should reset current_order' do
      subject.add('Madras')
      subject.cancel_order
      expect(subject.current_order).to eq Hash.new
    end
  end

  describe '#checkout' do
    it 'should raise error if answer doesnt match total_cost' do
      p 'enter anything but 14!'
      subject.add('Moghlai')
      subject.add('Patia')
      expect { subject.checkout }.to raise_error('incorrect total cost')
    end

    xit 'should return confirmed if correct total entered' do
      p 'enter 13!'
      subject.add('Rogan Josh')
      subject.add('Saag')
      expect(subject.checkout).to eq('confirmed')
    end
  end
end
