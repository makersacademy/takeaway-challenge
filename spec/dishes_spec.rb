require 'dishes'

describe Dishes do
  describe '#initialize' do
    it { expect(subject.price_list).not_to be_empty }
  end
  describe '#view' do
    it 'prints dishes to stdout' do
      expect { subject.view }.to output("fish - £5\nchips - £2\ncurry_sauce - £1\n").to_stdout
    end
  end
end
