require 'menu'

describe Menu do

  let(:dish){ double :dish }
  subject(:subject){described_class.new(dish)}

  describe '#list' do

    it 'should respond to list method with type' do
      expect(subject).to respond_to(:list).with(1).argument
    end

    it 'should list indian dishes and their prices' do
      allow(dish).to receive(:indian).and_return({ chicken_korma: 12, chicken_tika_masala: 11, rogan_josh: 10 })
      expect(subject.list("indian")).to include(dish.indian)
    end

    it 'should list italian dishes and their prices' do
      allow(dish).to receive(:italian).and_return({ cajun_pasta: 8, house_salad: 4, bologna: 5 })
      expect(subject.list("italian")).to include(dish.italian)
    end

    it 'should list chinese dishes and their prices' do
      allow(dish).to receive(:chinese).and_return({ duck_chowmein: 9, chicken_chowmein: 8, vegetable_noodles: 7 })
      expect(subject.list("chinese")).to include(dish.chinese)
    end

    it 'should list drinks and their prices' do
      allow(dish).to receive(:drinks).and_return({ fosters: 2, lemonade: 2, coke: 2 })
      expect(subject.list("drinks")).to include(dish.drinks)
    end

  end

end
