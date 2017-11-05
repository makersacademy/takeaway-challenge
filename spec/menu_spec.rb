require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe 'give_menu' do
    it 'gives the menu list' do
      expect(subject.give_menu).to eq({ "margherita pizza" => 9, "mushroom pizza" => 11 })
    end


  end


end
