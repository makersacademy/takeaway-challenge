module Menu

	attr_reader :menu

	def initialize
		@menu = {}

		def menu
			menu = {Burger: "£8", FishandChips: "£7", PieandMash: "£9", Beer: "£4", Juice: "£2"}
		end

end

puts Menu.menu