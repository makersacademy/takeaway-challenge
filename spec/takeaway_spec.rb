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

  describe '#add_dish' do
    it 'responds to' do
      expect(subject).to respond_to(:add_dish).with(2).arguments
    end

    it 'adds a dish to order' do
      subject.add_dish(:burger, 4)
      subject.add_dish(:chips, 1)
      expect(subject.order).to eq [:burger, :burger, :burger, :burger, :chips]
    end

    it 'outputs the current total to customer' do
      subject.add_dish(:burger, 4)
      expect { subject.add_dish(:chips, 5) }.to output("Current order total is £50.\n").to_stdout
    end
  end

  describe '#check_order_price' do
    it 'checks overall price is equal to the current total' do
      subject.add_dish(:burger, 4)
      subject.add_dish(:sausage, 1)
      subject.add_dish(:chips, 5)
      subject.check_order_price

      expect(subject.overall_total).to eq subject.current_total
    end

    it 'outputs the total price' do
      subject.add_dish(:burger, 4)
      subject.add_dish(:sausage, 1)
      subject.add_dish(:chips, 5)
      expect { subject.check_order_price }.to output("Final order total is £55.\n").to_stdout
    end
  end

end
