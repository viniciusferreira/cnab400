class ItauTrailer
	attr_accessor :trailer_string

	attr_accessor :register_type
	attr_accessor :return_code
	attr_accessor :service_code

	attr_accessor :detail_quantity
    attr_accessor :total_amount
    attr_accessor :sequential_number
	
	def initialize(trailer_string)
		@trailer_string = trailer_string
		self.fill_attributes
	end

	def content
		@trailer_string
	end

	def fill_attributes
		@register_type 		= @trailer_string[0]
		@return_code 		= @trailer_string[1]
		@service_code		= @trailer_string[2..3]
		@detail_quantity	= @trailer_string[212..219]
		@total_amount		= @trailer_string[220..233]
		@sequential_number	= @trailer_string[394..399]
	end
end