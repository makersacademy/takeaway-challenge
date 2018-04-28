describe Menu_handler do
  let(:menu_handler) { described_class.new('/Users/georgesykes/Projects/MakersAcademy/WeekendChallenges/takeaway-challenge/test_resources')}

  describe '#initialize' do

    it 'defaults the root' do
      expect(subject.instance_variable_get(:@root)).to eq described_class::ROOT
    end

    it 'sets the root' do
      expect(menu_handler.instance_variable_get(:@root)).to eq '/Users/georgesykes/Projects/MakersAcademy/WeekendChallenges/takeaway-challenge/test_resources'
    end

    it 'sets the category of the menus' do
      expect(menu_handler.file_summaries[0][:category]).to eq "fake"
    end

    it 'sets the desription of the restaurants' do
      expect(menu_handler.file_summaries[0][:summary]).to eq "blank"
    end

    it 'only returns the descriptions that are defined with Description' do
      expect(menu_handler.file_summaries.count).to eq 1
    end

  end


  describe '#get_menu_items' do
    let(:menu_items) { menu_handler.get__menu_items("fake") }

    it 'returns an array of menu items' do
      expect(menu_items).to be_an_instance_of(Array)
    end

    it 'returns 1 item' do
      expect(menu_items.count).to eq 1
    end

    it 'returns correct values' do
      expect(menu_items.first[:item]).to eq "item"
      expect(menu_items.first[:description]).to eq "description"
      expect(menu_items.first[:price]).to eq "price"
    end

  end

end
