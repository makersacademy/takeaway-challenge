require 'csv'
require_relative 'menu'

class Shop

	attr_reader :menu

	def initialize(menu_items = Menu.new.upload)
		@menu_items = menu_items
		@menu = ""
	end

	def view_menu
		menu_header
		print_menu
		menu_footer
	end


private

	def index_items
		@menu_items.map.with_index(1) do |menu_item, i|
			@menu << "#{i}		#{menu_item[:item]}		#{menu_item[:price]}			#{menu_item[:description]}\n"
		end
	end

	def print_menu
		index_items if @menu.empty?
		puts @menu
	end

	def menu_header
		puts "ITEM.NO		ITEM			PRICE(GBP)		CONTENTS"
	end

	def menu_footer
		puts "#{"-"*10}YOU WILL GET EIGHT MAKI PIECES PER MAKI ITEM#{"-"*10}"
	end

end
