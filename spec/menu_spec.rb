require './lib/menu.rb'

describe Menu do

    describe "#initialization"do

    it 'is initialized with a default menu' do
      expect(subject.dishes).to include {}
    end

    it 'has a default menu of dishes with prices' do
      expect(subject.dishes[:Coke]).to eq (5)
    end

    it "has 5 dishes on default menu" do
      expect(subject.menu.dishes.length).to eq 5
    end
  end
end
