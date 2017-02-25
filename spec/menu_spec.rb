require 'menu'
require 'spec_helper'

describe Menu do
  subject(:menu) { described_class.new }
  let(:menu_file) { 'menu.csv' }


  it { is_expected.to respond_to(:load_menu)}
  it { is_expected.to respond_to(:view_price_list)}

  describe "defaults" do

    it "list starts as an empty array" do
      expect(menu.list).to be_empty
    end

  end

  describe "#load_menu" do
    it "loads dishes from menu.csv" do
      menu.load_menu
      expect(menu.list.count).to eq 21
    end
  end

end
