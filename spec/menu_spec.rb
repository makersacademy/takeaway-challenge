require 'menu'

describe Menu do
  context '#menu_list' do
    it 'should display the menu' do
      expect(subject.list).not_to be_empty
    end
  end
end
