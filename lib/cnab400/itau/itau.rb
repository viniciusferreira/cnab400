class Itau
	attr_accessor :file_path
	attr_accessor :header
	attr_accessor :details
	attr_accessor :details_string
	attr_accessor :trailer
	
	def initialize(file_path)
		@file_path 	= file_path
		
		@header 		= ItauHeader.new(File.open(file_path).first)
		@trailer 		= ItauTrailer.new(File.open(file_path).to_a.last)

		@details		= []

		details_string_tmp = File.open(file_path).to_a
		details_string_tmp.shift
		details_string_tmp.pop
		
		@details_string	= details_string_tmp.join("")
	end
end