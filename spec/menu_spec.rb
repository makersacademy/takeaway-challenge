require 'menu'

describe Menu do

  describe '#print' do
    it 'prints all the dishes and prices' do
      expect(subject.print).to eq( 'Goi Ga £5.99 || Cha Gio £4.99 || Vietnamese dumpling £2.99 || peking duck £5.00 || Pho Bo £6.99')
    end
   end
end
