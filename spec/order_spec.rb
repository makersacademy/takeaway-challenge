require 'order'

describe Order do

  let(:correct_order) {double("beer")}

  context "create" do

    it 'asks for your order' do
      $stdout.puts "What would you like to order?"
    end

    it 'recives your order' do
      allow($stdin.gets).to receive("foo")
    end

    it 'adds items from the menu to the basket' do
      expect($stdin.gets(correct_order)).to change(@basket)
    end

  end

end