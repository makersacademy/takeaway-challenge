require 'menu'

describe Menu do
  context ': Customer wants to make an order, ' do
    it 'lists dishes with prices' do
      expect(subject.list[0..28]).to eq "flame_grilled_pheonix: £12.00"
    end
  end
end
