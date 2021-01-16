require 'menu'

describe Menu do

  describe "#view" do

    it 'displays a list of dishes with prices' do
      expect(subject.view).to eq(subject.dishes_hash)
    end
  end

end
