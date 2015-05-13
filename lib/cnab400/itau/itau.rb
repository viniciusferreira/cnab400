class Itau
	attr_accessor :file_path
	attr_accessor :header

	attr_accessor :trailer
	
	def initialize(file_path)
		@file_path 	= file_path
		@header 	= ItauHeader.new(File.open(file_path).first)
		@trailer 	= ItauTrailer.new(File.open(file_path).to_a.last)
	end
end