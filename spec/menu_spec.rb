require 'menu'

describe Menu do

  subject(:menu) {described_class.new}

  describe "#initialize" do
    it 'display list of orderable items' do
      expect{menu.full_list}.to output.to_stdout
    end

  end


end
