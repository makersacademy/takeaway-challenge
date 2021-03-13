# require 'csv'

# DIVIDER_LEN = 50

# def show_menu
#   grouped_menu = @menu.group_by { |dish| dish["category"] }
#   puts "*" * DIVIDER_LEN
#   grouped_menu.each do |category, dishes|
#     puts "-" * DIVIDER_LEN
#     puts category
#     puts "-" * DIVIDER_LEN
#     dishes.each { |dish| puts "#{dish["id"]}. #{dish["dish"]} £#{dish["price"]}"}
#   end
#   puts "*" * DIVIDER_LEN
# end

# #private

# def get_menu
#   @menu = []
#   table = CSV.parse(File.read("docs/menu.csv"), headers: true)
#   table.each { |row| @menu << {"id" => row[0],"category" => row[1], "dish" => row[2], "price" => row[3]} }
# end

# get_menu
# show_menu
