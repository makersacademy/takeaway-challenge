require 'takeaway'


describe Takeaway do
  let(:menu) { double :menu }
  subject { described_class.new(menu)}
  describe '#initialize' do
    it 'initializes with a menu' do
      expect(subject.menu).to eq menu
    end
  end

  describe '#add' do
    it 'calls the Menu#add method' do
      expect(menu).to receive(:add)
      subject.add("Pork Dumplings", 2)
    end
  end

  describe '#checkout' do
    it 'calls the Menu#checkout method' do

    end
  end
end