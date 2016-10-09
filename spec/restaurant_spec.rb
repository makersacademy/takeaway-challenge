require 'restaurant'
require 'menu'

describe Restaurant do
  subject(:restaurant) {described_class.new}

  describe '#show_menu' do

    it 'should show the menu' do
      expect(subject.show_menu).to include({"cod" => 7})
    end
  end
end
