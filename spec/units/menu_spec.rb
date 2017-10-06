require 'menu'

describe Menu do
  describe '#see' do
    it 'enables users to see the menu' do
      expect(subject.see).to be_an Array
    end
  end
end
