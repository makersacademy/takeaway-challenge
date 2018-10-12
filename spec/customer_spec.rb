require 'customer'

describe Customer do

  describe '#Check_list' do
    it ' Should recieve a list' do
      list = [0, 0, 0, 0]
      expect(subject.check_menu(list)).to eq list
    end
  end



end
