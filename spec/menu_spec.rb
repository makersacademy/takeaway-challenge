require 'menu'

describe Menu do

  it { is_expected.to respond_to :dishes }

  describe '#show_menu' do
    it 'should show a food type and its price' do
      subject.instance_variable_set("@dishes", [{ "edemame" => 3 }])
      expect(subject.show_menu).to eq [{ "edemame" => 3 }]
    end
  end

end
