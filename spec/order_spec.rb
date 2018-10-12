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
end
