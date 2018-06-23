require './lib/menu'

describe Menu do

  it { is_expected.to respond_to :price_list }

  describe 'List of dishes and prices' do
    it 'contains a list of dishes and prices' do
      expect(subject.price_list[0]).to eq('Pork Burrito' => 8.00)
    end
  end
end
