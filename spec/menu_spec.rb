require 'menu'

describe Menu do

  describe '#menu', :menu do
    it 'Returns an array 10 dishes with prices' do
      expect(subject.menu.length).to eq 10
    end
  end

  describe '#list', :list do
    it 'responds to the method list' do
      expect(subject).to respond_to(:list)
    end

    it 'Returns a string of dishes with prices' do
      expect { subject.list }.to output("Spring Rolls - £2\nPopadoms - £2\nSpare Ribs - £3.5\nSpicy Chicken Wings - £2.5\nWun Tun Soup - £2.5\nCantonese Roast Duck - £4.5\nKung Po Chicken - £4\nShredded Beef with Chilli - £5\nSzechuan Beef - £5\nCantonese Roast Pork - £5\n").to_stdout
    end
  end
end
