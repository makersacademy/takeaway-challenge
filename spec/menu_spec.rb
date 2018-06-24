require './lib/menu'

describe Menu do

  it { is_expected.to respond_to :price_list }

  describe '#print_menu' do
    it 'prints menu out to customer' do
      expect(subject.price_list[0]).to eq(:pork => 8.00)
    end
  end
end
