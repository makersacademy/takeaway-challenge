require 'rspec'
require 'menu'

RSpec.describe Menu do

  describe '#available_items' do
    it 'lists all items on takeaway menu' do
      expect(subject.available_items).to eq subject.items
    end
  end

  describe '#display_menu' do
    it 'displays formatted menu' do
      expect(subject.display_menu).to include(:rice => 2)
    end
  end
  

end