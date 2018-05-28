require 'take_away.rb'

describe TakeAway do

  subject(:takeaway) { described_class.new }

  describe '#print_menu' do
    it 'shows menu' do
      expect(subject.print_menu).to eq( 'Goi Ga £5.99 || Cha Gio £4.99 || Vietnamese dumpling £2.99 || peking duck £5.00 || Pho Bo £6.99')
    end
  end

end
