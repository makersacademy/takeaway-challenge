require 'menu'

describe Menu do

  let(:menu) { Menu.new }

  describe "new dishes" do
    it "equals an empty hash" do
      expect(menu.dishes).to eq([])
    end
  end
  # describe '#get_dishes' do
  #   it 'gets dishes' do
  #     expect(subject.getdishes).to eq("Salmon")
  #   end
  # end
end
