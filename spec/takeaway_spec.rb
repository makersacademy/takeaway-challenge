require 'takeaway'

describe Takeaway do
    it 'responds to .see_dishes' do
      expect(subject).to respond_to(:see_dishes)
    end
        it 'responds to .dishes' do
      expect(subject).to respond_to(:dishes)
    end

    it 'shows a list of dishes with prices' do
        expect(subject.see_dishes.length).to be > 0
    end

end
