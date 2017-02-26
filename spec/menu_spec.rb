require 'menu'
require 'restaurant'

describe Menu do
  let(:restaurant) { Restaurant.new }
  subject(:menu) { described_class.new(restaurant) }

  # describe "Viewing the menu" do
  #
  #   it "shows the dishes from the restaurant" do
  #     menu.view
  #     expect(STDOUT).to receive(:puts).with(list)
  #   end
  # end
end
