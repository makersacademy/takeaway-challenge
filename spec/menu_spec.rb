require 'menu'

describe Menu do
  describe '#show_menu' do
    it 'should be able to show the menu' do
      expect(subject).to respond_to(:show_menu)
    end
  end
end
