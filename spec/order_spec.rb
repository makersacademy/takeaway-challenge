require 'order'

describe Order do
  it 'should have an empty list' do
    expect(subject.order).to eq []
  end

  describe '#added?' do
    it 'should return true' do
      subject.order << "stand in"
      expect(subject.added?).to be true
    end

    it 'should return false' do
      expect(subject.added?).to be false
    end
  end

  describe '#print_list' do
    it 'is expected to return a cheese with the added total' do
      thing = Dish.new("cheese", 40)
      subject.order << thing
      expect(subject.print_list).to eq ["cheese x1 $40"]
    end

    it 'is expected to return 3 cheese with the added total' do
      thing = Dish.new("cheese", 40)
      subject.order << thing
      subject.order << thing
      subject.order << thing
      expect(subject.print_list).to eq ["cheese x3 $120"]
    end

    it 'is expected to return a list with the added total' do
      thing = Dish.new("cheese", 40)
      cow = Dish.new("COW", 500)
      subject.order << thing
      subject.order << thing
      subject.order << cow
      expect(subject.print_list).to eq ["cheese x2 $80", "COW x1 $500"]
    end
  end

  describe '#total' do
    it 'should return a total of $580' do
      thing = Dish.new("cheese", 40)
      cow = Dish.new("COW", 500)
      subject.order << thing
      subject.order << thing
      subject.order << cow
      expect(subject.total).to eq 580
    end
  end
end
