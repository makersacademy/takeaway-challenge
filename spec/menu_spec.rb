require 'menu'

describe Menu do

  let(:dish) { double :dish , name: 'Curry', price: 5 }

  describe '#initializes' do
    it 'it initializes with an array' do
      expect(subject.list).to be_instance_of(Array)
    end
  end

  describe '#add' do
    it 'adds dishes to the list array' do
      subject.add(dish)
      expect(subject.list).to include(dish)
    end
  end

  describe '#pretty_print' do
    it 'pretty prints a list of dishes and prices' do
      subject.add(dish)
      expect { subject.pretty_print }.to output("1) Curry - £5\n").to_stdout
    end
  end

end
