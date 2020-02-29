require 'order'
require 'menu'

describe Order do

  subject(:order) { described_class.new }

  describe "#view_menu" do

    it { is_expected.to respond_to(:view_menu) }

    it "displays the menu" do
      expect { order.view_menu }.to output { /burger 10.0/ }.to_stdout
    end

  end
end
