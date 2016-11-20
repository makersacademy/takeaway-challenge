# require 'interface'
#
# describe Interface do
#   # let(:dishes_menu) { class_double "DishesMenu" }
#   let(:name) { double(:name) }
#   let(:dish_list) { [{:dish=>:v, :price=>4},
#                     {:dish=>:v, :price=>3}] }
#   let(:take_away) { class_double "TakeAway" }
#   subject(:interface) { described_class.new(name, DishesMenu, dish_list, Order, take_away)}
#
#   it "Welcomes the user" do
#     message = "Welcome to #{name}, if you are hungry you came to the right place!\n\n"
#     expect {interface.welcome}.to output(message).to_stdout
#   end
#
#   it "Shows a menu of possible actions to the user" do
#     message = "    Input '1' to see our dishes menu.\n\n    Input '2' to place an order.\n\n    Input '3' to check the status of your order.\n\n    Input '9' to exit.\n"
#     expect {interface.actions_menu}.to output(message).to_stdout
#   end
#
#   context "User inputs an option" do
#     before do
#       $stdin = StringIO.new("4")
#     end
#
#     after do
#       $stdin = STDIN
#     end
#
#     it "Lets user choose an option" do
#       expect(interface.get_answer).to eq "4"
#     end
#   end
#
#   context "Options chosen by user get executed" do
#     it "Goes to dishes menu when user chooses to see dishes menu" do
#       allow(interface.dishes_menu).to receive(:show_dishes) { print "from dishes menu" }
#       expect {interface.execute_action("1")}.to output("from dishes menu").to_stdout
#     end
#
#     it "Exits the program when user chooses exit" do
#       expect { interface.execute_action("9") }.to raise_error(SystemExit)
#     end
#
#     it "Tells user to choose a correct answer" do
#       message = "Please choose a number corresponding to your preferred action\n"
#       expect {interface.execute_action("bla")}.to output(message).to_stdout
#     end
#
#     it "Lets user pleace order" do
#       expect (interface.execute_action("2")).to eq (interface.place_order)
#     end
#   end
# end
