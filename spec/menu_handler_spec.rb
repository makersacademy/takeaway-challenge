describe Menu_handler do
  let(:menu_handler) { described_class.new('/Users/georgesykes/Projects/MakersAcademy/WeekendChallenges/takeaway-challenge/test_resources')}

  describe '#initialize' do

    it 'defaults the root' do
      expect(subject.instance_variable_get(:@root)).to eq described_class::ROOT
    end

    it 'initializes a file_summaries array' do
      expect(subject.file_summaries).to be_an_instance_of(Array).and be_empty
    end

    it 'sets the root' do
      expect(menu_handler.instance_variable_get(:@root)).to eq '/Users/georgesykes/Projects/MakersAcademy/WeekendChallenges/takeaway-challenge/test_resources'
    end

  end

  describe '#get_summaries' do
    before { menu_handler.get_summaries }

    it 'returns the category of the menu' do
      expect(menu_handler.file_summaries[0][:category]).to eq "fake"
    end

    it 'returns the desription of the restaurant' do
      expect(menu_handler.file_summaries[0][:summary]).to eq "blank"
    end

    it 'only returns the descriptions that are defined with Description' do
      expect(menu_handler.file_summaries.count).to eq 1
    end

  end

end
