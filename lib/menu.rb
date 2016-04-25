class Menu

	def initialize(file)
		@list = reformat(file)
	end

	def list
		@list.dup
	end

	def list=(new_file)
		@list = reformat(new_file)
	end
	
	private
	
	def reformat(file)
		list = {}
		File.read(file).split("\n").each do |line|
			list[extract_item(line)]={price: extract_price(line)}
		end
		list
	end

	def extract_item(line)
		line[/[a-zA-Z ']+/].gsub(' ','_').to_sym
	end

	def extract_price(line)
		line[/[0-9.]+/].to_f
	end

end