require 'menu'


describe Menu do

  subject(:menu) { described_class.new}

  describe "#print" do
    context "when called" do
     it "prints menu list" do
       expect(menu.print_menu).to eq menu.list
       end
     end
   end

end
