require 'menu'

describe Menu do
  describe '#items' do
    it 'should contain a list of menu items' do
      expect(subject.items).not_to be nil
    end
  end
end
