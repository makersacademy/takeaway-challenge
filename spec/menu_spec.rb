require 'menu'

describe Menu do

  subject(:menu) {described_class.new}

  context 'menu' do
    it 'menu can display food items' do
      expect(menu).to respond_to(:display)
    end
  end
end
