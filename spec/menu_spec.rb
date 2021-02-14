require 'menu'

describe Menu do

  describe '#initialize' do
    it 'initializes with a menu' do
      expect(subject).to respond_to(:list)
    end
  end

  describe '#view_menu' do
    it 'lets the user view the menu' do
      expect(subject).to respond_to(:view_menu)
    end
  end

end
