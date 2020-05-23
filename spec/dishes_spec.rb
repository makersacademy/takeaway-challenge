require_relative '../lib/dishes.rb'

describe Dishes do

  describe '#show_dishes' do
    it "should out put the list of available dishes" do
      list = "name1: £1.00\nname2: £1.50\n"
      expect { subject.show_dishes }.to output(list).to_stdout
    end
  end
end
