require './lib/menu'
describe Menu do
  it 'has a list of dishes with prices' do
    expect(subject.dishes).not_to be_empty
  end

  it 'can view a list of dishes with prices' do
    expect(subject.view_dishes).to eq subject.dishes
  end

  context 'checks to see if a dish is available' do
    it 'is not avaliable' do
      subject.dishes
      expect(subject.available?("Lobster linguine")).to be false
    end

    it 'is avaliable' do
      subject.dishes
      expect(subject.available?("Pizza")).to be true
    end
  end
end
 