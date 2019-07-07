require 'takeaway'

describe Menu do
  subject(:menu) { described_class.new }
  let(:fake_menu) {double("fake_menu", menu: [{"wing" => 0.99}, {"burger" => 1.99}, {"banana" => 30.33}])}


  describe "prices" do
    it 'should return a list of food items and prices' do
      hash = [{"wing" => 0.99}, {"burger" => 1.99}, {"banana" => 30.33}]
      expect(fake_menu.menu).to eq hash
    end

    it 'should return the menu for my takeaway' do
      hash = [{"wing" => 0.99}, {"burger" => 1.99}, {"banana" => 30.33}]
      expect(menu.prices).to eq hash
    end
  end

end
