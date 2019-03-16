require 'takeaway'

describe TakeAway do

  let(:menu_class_double) {double(:menu_class)}
  let(:menu_double) {double(:menu)}
  let(:subject) {described_class.new(menu_class_double, menu_double)}

  describe '#read_menu' do

    it 'reads the menu object' do
      expect(menu_double).to receive(:read)
      subject.read_menu
    end

  end

end
