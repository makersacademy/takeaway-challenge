require 'menu'

describe Menu do

  let(:dish){ double :dish, indian: {chicken_korma: 12, chicken_tika_masala: 11},
    italian: {cajun_pasta: 8, house_salad: 4},
    chinese: {duck_chowmein: 9, chicken_chowmein: 8},
    drinks: {fosters: 2, lemonade: 2}
  }
  subject(:subject){described_class.new(dish)}

  describe 'food categories' do

    it 'should return indian dishes and their prices' do
      expect(subject.indian).to include(dish.indian)
    end

    it 'should return italian dishes and their prices' do
      expect(subject.italian).to include(dish.italian)
    end

    it 'should return chinese dishes and their prices' do
      expect(subject.chinese).to include(dish.chinese)
    end

    it 'should return drinks dishes and their prices' do
      expect(subject.drinks).to include(dish.drinks)
    end

  end

end
