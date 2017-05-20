require 'menu'

describe Menu do

  it { is_expected.to respond_to :dishes }

  describe '#show_menu' do
    let(:menu) { double :menu, dishes: [{ "edemame" => 3 }] }
    it 'should show a food type and its price' do
      expect(subject.show_menu).to eq [{ "edemame" => 3 }]
    end
  end

end
