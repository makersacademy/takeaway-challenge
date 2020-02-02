require 'menu'
describe Menu do
  let(:subject) { Menu.new({ pizza: 4, burger: 3, hot_dog: 2 }) }

  describe "#new" do
    it 'accepts the list of food and prices' do
      expect(subject.dishes).to eq({ pizza: 4, burger: 3, hot_dog: 2 })
    end
  end

  describe "#show" do
    it 'displays the list of dishes with prices' do
      expect { subject.print }.to output("Pizza: £4\nBurger: £3\nHot_dog: £2\n")
        .to_stdout
    end
  end

  describe "#search" do
    it 'tells if a dish is not on the menu' do
      expect { subject.search("falafel") }.to raise_error("Sorry, falafel is not on the menu.")
    end

    it 'returns dish name and price if searched dish is on menu' do
      expect(subject.search("pizza")).to eq("Pizza: £4")
    end
  end
end
