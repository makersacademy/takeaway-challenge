require 'dishes'

describe Dishes do
  describe '#initialize' do
    it { expect(subject.list).not_to be_empty }
  end
  describe '#view' do
    it 'prints dishes to stdout' do
      list = { fish: 5, chips: 2, curry_sauce: 1 }
      expect { subject.view }.to output("fish - £5\nchips - £2\ncurry_sauce - £1\n").to_stdout
    end
  end
end