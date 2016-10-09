require 'menu'
Dir.chdir(File.dirname(__FILE__))
describe Menu do
  #csv = "\"spring roll\",0.99\n\"char sui bun\",3.99\n\"pork dumpling\",2.99\n\"peking duck\",7.99\n\"fu-king fried rice\",5.99"       
  subject(:menu) {described_class.new}
 
  it "responds to the load_menu method" do
    puts Dir.pwd
    #This test requires menu.csv to exist in the root directory (rspec's working directory)
    expect(menu).to respond_to(:load_menu).with(1).argument    # No such file or directory @ rb_sysopen - menu.csv
  end

end



