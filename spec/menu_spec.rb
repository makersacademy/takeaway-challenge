require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it { is_expected.to(respond_to(:dishes)) }

  describe "#menu" do
    it 'includes a list of menu items' do
      expect(menu.dishes).to(be_a(Hash))
    end
  end

end
