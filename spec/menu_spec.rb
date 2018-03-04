require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#initialize' do
    it 'menu should be an array' do
      expect(menu.current_menu).to be_a(Array)
    end

    it 'should not be empty' do
      expect(menu.current_menu)
    end

    it 'should a attr_reader to access menu' do
      expect(menu).to respond_to(:current_menu)
    end
  end
end
