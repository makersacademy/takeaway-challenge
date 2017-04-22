require 'restaurant'

describe 'restaurant' do
  subject { Restaurant.new }
  describe '#menu' do
    it 'expects restaurant to respond to show_menu' do
    expect(subject).to respond_to(:show_menu)
    end
  end

end
