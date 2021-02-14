require_relative 'menu'

describe Menu do

  describe '#price_list' do
    it 'shows a list of dishes with prices' do
      expect(subject.price_list).to eq(price_list)
  end

end
