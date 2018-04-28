require 'menu'

describe Menu do

  describe '#menu method' do
    it 'responds to #menu' do
      expect(subject).to respond_to(:menu)
    end
  end
end
