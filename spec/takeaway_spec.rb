require 'orderpizza'

describe Orderpizza do
  let(:menu) { double(:menu) }
  let(:dish) { double(:dish) }

  context 'when viewing menu' do
    it 'shows a list of dishes with prices' do
      expect(subject.menu).to eq({:BBQ=>11, :hawaiian=>10, :margarita=>8.5,
         :"meat-feast"=>12.5, :pepperoni=>11, :vegitarian=>10.5})
    end
  end

  context 'be able to select several dishes' do
    it 'can add several dishes' do
    subject.add_to_basket(dish, 4) 
    expect(subject.basket[dish]).to eq 4
  end
end

describe '#basket' do
  it 'sets an empty basket by default' do
    expect(subject.basket).to eq({})
  end
end

describe '#order_total' do 
  it 'sets default order total' do
    expect(subject.order_total).to eq(0)
  end
  end

end