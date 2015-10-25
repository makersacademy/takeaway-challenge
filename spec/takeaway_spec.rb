require 'takeaway'


describe Takeaway do
  let(:menu) { double :menu, total: 10 }
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

  describe '#request_menu' do
    it 'calls Menu#view_menu' do
      expect(menu).to receive(:view_menu)
      subject.request_menu
    end
  end

end