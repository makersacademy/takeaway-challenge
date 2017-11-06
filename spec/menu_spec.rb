require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe 'give_menu' do
    it 'gives the menu list' do
      expect(subject.give_menu).to eq({ "margherita pizza, price:" => 9, "mushroom pizza, price:" => 11, "summer veggies pizza, price:" => 12})
    end

    describe 'select_dish' do
      it 'selects one dish in the menu' do
        expect(subject.select_dish).to change {selected_dish.length}.by 1
      end
    end


  end


end
