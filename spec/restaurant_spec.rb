require 'restaurant'

describe 'restaurant' do
  subject { Restaurant.new }
  describe '#show_menu' do
    it 'expects restaurant to respond to show_menu' do
    expect(subject).to respond_to(:show_menu)
    end

    it 'expects restaurant to show the menu' do
      expect(subject.show_menu).to eql (subject.menu)
    end
  end

  describe '#pretty_print' do
    it 'expects restaurant to respond to pretty_print' do
      expect(subject).to respond_to(:pretty_print)
    end

    it 'expects restaurant to pretty_print' do
      expect(subject.pretty_print). to eq("Battered squid: £5")
    end
  end

end
