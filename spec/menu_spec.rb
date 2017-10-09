require 'menu'

describe Menu do

  subject(:menu) { described_class.new(stream: stream) }
  let(:stream) { double :stream, puts: nil }

  describe '#initialize' do
    
    it 'has a list of menu items' do
      expect(menu.items).to be_an_instance_of Hash
    end

  end

  describe '#print' do
    
    it 'prints the menu as a string' do
      expect(stream).to receive(:puts)
      menu.print
    end

  end

end
