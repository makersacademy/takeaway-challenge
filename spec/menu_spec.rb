require 'menu'

describe Menu do
  let(:dish) { ["fish", 5, 1] }

  it 'has a menu' do
    expect(subject.menu).to include dish
  end

  it 'has a blank order' do
    expect(subject.order).to eq []
  end

  describe '#list_dishes' do
    it 'lists dishes' do
      expect(subject.list_dishes).to eq subject.menu
    end
  end

  describe '#order_dishes' do
    it 'can order a dish' do
      subject.order_dishes("fish")
      expect(subject.order).to eq [dish]
    end
  end
end
