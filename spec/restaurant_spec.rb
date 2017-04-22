require 'restaurant'

describe 'restaurant' do
  subject { Restaurant.new }
  describe '#show_menu' do
    it 'expects restaurant to respond to show_menu' do
    expect(subject).to respond_to(:show_menu)
    end

    menu = Menu.new

    it 'expects restaurant to show the starters' do
      expect(subject.show_menu).to eql (menu.menu)
    end

  end

end
