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
    let(:dish) { double :dish, :fried_chicken => 8 }

    it 'shows a formatted list of dishes' do
      expect(subject.show).to eq("Fried Chicken - £8")
      subject.dishes << dish
    end

    specify 'dishes have a price' do
      subject.dishes << dish
      p subject.show.last
      expect(subject.show.last.fried_chicken).to be(8)
    end
  end
end