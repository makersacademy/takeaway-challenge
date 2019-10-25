
require 'menu'

describe Menu do
  context 'Initialization' do
    subject { Menu.new }

    it 'Checks an instance of menu can be created' do
      expect(subject).to be_instance_of Menu
    end

    it 'Has a list of items' do
      expect(subject.items).not_to be_empty
    end
  end 
end