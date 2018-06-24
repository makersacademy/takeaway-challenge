require './lib/menu'

describe Menu do

  it { is_expected.to respond_to :price_list }

  describe '#print_menu' do
    it 'prints menu out to customer' do
      expect(subject.price_list).to eq('pork' => 8.00, 'chicken' => 7.50, 'steak' => 8.50, 'veggie' => 7.00)
    end
  end
end
