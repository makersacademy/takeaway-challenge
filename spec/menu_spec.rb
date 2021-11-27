require 'menu'

describe Menu do
  TEST_PRICE = 8
  let(:dishes) { double :dishes }
  subject { described_class.new }
  dish = { "Fried Chicken": TEST_PRICE}
  
  describe '#initialize' do
    it 'has a list of dishes' do
      expect(subject.dishes).to be_an_instance_of(Array)
    end

    specify 'dishes have a price' do
      subject.dishes << dish
      expect(subject.dishes.last[:"Fried Chicken"]).to eq(TEST_PRICE)
    end
  end

  describe '#show' do
    it 'shows a formatted list of dishes' do
      subject.dishes << dish
      expect { subject.show }.to output("1. Fried Chicken - £8\n").to_stdout
    end
  end
end