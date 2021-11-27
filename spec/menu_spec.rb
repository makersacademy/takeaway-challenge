require 'menu'

describe Menu do
  let(:dishes) { double :dishes }
  subject { described_class.new }
  dish = { "Fried Chicken": 8}
  
  describe '#initialize' do
    it 'has a list of dishes' do
      expect(subject.dishes).to be_an_instance_of(Array)
    end

    specify 'dishes have a price' do
      subject.dishes << dish
      expect(subject.dishes.last[:"Fried Chicken"]).to eq(8)
    end
  end

  describe '#show' do
    it 'shows a formatted list of dishes' do
      subject.dishes << dish
      expect { subject.show }.to output("Fried Chicken - £8\n").to_stdout
    end
  end
end