require 'menu'

describe Menu do
  let(:dishes) { double :dishes }
  subject { described_class.new }
  
  describe '#initialize' do
    it 'has a list of dishes' do
      expect(subject.dishes).to be_an_instance_of(Array)
    end
  end

  describe '#show' do
    dish = { "Fried Chicken": 8}

    it 'shows a formatted list of dishes' do
      subject.dishes << dish
      expect { subject.show }.to output("Fried Chicken - £8\n").to_stdout
    end

    specify 'dishes have a price' do
      subject.dishes << dish
      p subject.show.last
      expect(subject.show.last["Fried Chicken"]).to be(8)
    end
  end
end