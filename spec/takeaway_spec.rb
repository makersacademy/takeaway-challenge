require './lib/takeaway.rb'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double(:menu) }

  describe '#initialize' do
    it 'menu should return menu' do
      expect(takeaway.menu).to eq menu
    end
  end

  describe '#welcome' do
    it 'should ask user if they would like to see the menu' do
      expect(takeaway.welcome).to eq Takeaway::WELCOME
    end
  end

end
