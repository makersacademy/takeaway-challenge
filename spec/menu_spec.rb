require 'menu'
require 'spec_helper'


describe Menu do
  subject(:menu) { described_class.new }

  describe "#defaults" do
    it "loads dishes from menu.csv" do
      expect(menu.list.count).to eq 21
    end
  end

  describe "#view_menu" do
    it "displays the list of dishes" do
      expect { menu.view_menu }.to output.to_stdout
    end
  end
end
