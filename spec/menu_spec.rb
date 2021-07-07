require 'menu'

describe Menu do 

# This test will check the menu_list method

  it { is_expected.to respond_to(:print_menu) } 

  describe '#print_menu' do 

    it 'checks the printed list with the whole menu and prices' do 
      expect(subject.print_menu).to include("chicken" => 6)
    end
  end

  describe '#complete_menu' do 

    it { is_expected.to respond_to(:standard_menu) }

  end

end
