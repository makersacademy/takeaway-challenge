require 'menu'

describe Menu do
  describe '#list' do
    # This test might be not nessasary as there's similar one already.
    it 'shows the list of dishes with prices' do
      food_person = Takeaway.new
      subject.list
      expect(subject.food_list).to eq food_person.show_menu
    end
  end
end
