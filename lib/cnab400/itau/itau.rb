class Itau
	attr_accessor :file_path
	attr_accessor :header
	
	def initialize(file_path)
		@file_path = file_path
	end

	def header
		@header = ItauHeader.new(File.open(file_path).first)
	end

	def details

	end

	def trailer

	end

end