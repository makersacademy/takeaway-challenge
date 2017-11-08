require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#initialize' do
    it 'menu should initialize' do
      expect(subject).to be_an_instance_of(Menu)
    end
    it 'should show a menu' do
      allow(menu).to receive(:list).and_return menu.list
    end
  end
end
