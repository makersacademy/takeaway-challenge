# require 'menu'
# # require 'takeaway'

# describe Menu do 

#   subject(:menu) { described_class.new(dishes) }
#   let(:dishes) do { beansprouts: 3.20, 
#       prawn_toast: 2.50,
#       vegetable_stir_fry: 4.50}

#     context '#Menu' do 
#       it 'has a list of dishes with prices' do
#         p dishes
#         expect(menu.dishes).to eq(dishes)
#         end

#       it 'prints dishes with prices' do
#         printed_menu = "beansprouts £3.20", "prawn toast £2.50", "vegetable stir fry £4.50"
#         expect(menu.print_menu).to eq(printed_menu)
#     end 
#   end
# end 
# end