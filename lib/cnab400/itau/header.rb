class ItauHeader
	attr_accessor :header_string
	def initialize(header_string)
		@header_string = header_string
	end

	def content
		@header_string
	end
end