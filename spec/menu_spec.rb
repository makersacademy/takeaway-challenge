require 'menu'

describe Menu do

  describe '#menu' do

    it { is_expected.to respond_to(:menu) }

    it { is_expected.to respond_to(:print_menu) }

    it 'prints out the menu of the restaurant' do
      expect(subject.menu).to include("宫爆鸡丁" => 8)
    end

  end


end
