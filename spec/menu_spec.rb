require 'menu'
# menu class spec file
describe Menu do

  subject(:menu) { described_class.new }

  describe ' #initialize' do
    it 'should be an instance of Menu class' do
      expect(subject).to be_an_instance_of(Menu)
    end
  end

  describe ' #add item' do
    it 'should add new menu items to list' do
      subject.add('Miso Soup', 2)
      item = { 'Miso Soup' => 2 }
      expect(subject.menu).to eq([item])
    end

    it 'should take in menu item and price as parameters' do
      expect(subject).to respond_to(:add).with(2).arguments
    end
  end

end
