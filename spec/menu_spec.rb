require 'menu'

describe Menu do

  it { is_expected.to respond_to :dishes }

  describe '#show_menu' do
    it 'should show a food type and its price in a readable way' do
      subject.instance_variable_set("@dishes", [{ 'generic_food' => 5 }])
      expect(subject.show_menu).to eq "1. 'generic_food', £5.00"
    end
  end

end
