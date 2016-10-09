require 'menu'
Dir.chdir(File.dirname(__FILE__))
describe Menu do
  subject(:menu) {described_class.new}
 
  it "responds to the load_menu method" do
    #This test requires menu.csv to exist in the root directory (rspec's working directory)
    expect(menu).to respond_to(:load_menu).with(1).argument    # No such file or directory @ rb_sysopen - menu.csv
  end

end



