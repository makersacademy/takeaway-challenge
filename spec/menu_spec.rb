
require 'menu'

describe Menu do
  context 'Initialization' do
    subject { Menu.new }

    it 'Checks an instance of menu can be created' do
      expect(subject).to be_instance_of Menu
    end
  end
end