require 'takeaway'

describe Takeaway do

  let(:subject) do
    dishes = {burger: 10, fish: 8, sausage: 5, chips: 2}
    subject = described_class.new(dishes)
  end


  describe '#see_dishes' do
    it 'responds to' do
      expect(subject).to respond_to(:see_dishes)
    end

    it 'displays the list of dishes' do
      expect { subject.see_dishes }.to output("Burger - £10\nFish - £8\nSausage - £5\nChips - £2\n").to_stdout
    end
  end

  describe '#select_dishes' do
    it 'responds to' do
      expect(subject).to respond_to(:select_dishes).with(3).arguments
    end



  end

end
