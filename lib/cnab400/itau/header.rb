class ItauHeader
    attr_accessor :header_string
    
    attr_accessor :register_type
    attr_accessor :return_code
    attr_accessor :return_name
    attr_accessor :service_code
    attr_accessor :service_name
    attr_accessor :account_agency
    attr_accessor :account_number
    attr_accessor :account_digit
    attr_accessor :account_bank
    attr_accessor :date_of_file

    def initialize(header_string)
        @header_string = header_string
        self.fill_attributes
    end

    def content
        @header_string
    end

    def fill_attributes
        @register_type  = @header_string[0]
        @return_code    = @header_string[1]
        @return_name    = @header_string[2..8]
        @service_code   = @header_string[9..10]
        @service_name   = @header_string[11..25]
        @account_agency = @header_string[26..29]
        @account_number = @header_string[32..36]
        @account_digit  = @header_string[37]
        @account_bank   = @header_string[76..78]
        @date_of_file   = @header_string[94..99] 
    end
end