class ItauDetail
    attr_accessor :detail_string

    attr_accessor :register_type
    attr_accessor :registration_code
    attr_accessor :registration_number
    attr_accessor :identifier #nosso numero
    attr_accessor :identifier_code #dac nosso numero
    attr_accessor :occurrence_date
    attr_accessor :document_number
    attr_accessor :credit_date
    attr_accessor :amount

    def initialize(detail)
        @detail_string          = detail

        @register_type          = detail[0]
        @registration_code      = detail[1..2]
        @registration_number    = detail[5..16]
        @identifier             = detail[85..92]
        @identifier_code        = detail[93]
        @occurrence_date        = detail[110..115]
        @document_number        = detail[116..125]
        @credit_date            = detail[295..300]
        @amount                 = detail[152..164]
    end
end