require 'menu'

describe Menu do

  describe '.view_menu' do
    it { is_expected.to respond_to(:view_menu) }

    it 'is able to print out the menu' do
      expect{subject.view_menu}.to output("vegetarian: 4\nchicken: 5\nbeef: 5.5\nrice side dish: 1.5\nvegetables side dish: 1.5\n").to_stdout
    end
  end


end
