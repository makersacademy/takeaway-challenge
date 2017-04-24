require 'rspec'
require_relative '../lib/menu.rb'

describe Menu do 
  subject(:menu) { described_class.new }

  describe "#add_dish " do
    xit "adds a dish to the menu" do
      expect(subject.add_dish(chicken)).to eq
    end
  end

    describe "#list_dishes" do
    xit "returns a list of all dishes on menu" do
      expect(subject.list_dishes).to eq
      end
    end
    
  end