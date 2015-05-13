require 'minitest/autorun'
require 'byebug'
require 'cnab400'

class Cnab400ItauTest < Minitest::Unit::TestCase
    def test_itau_header_string
        expected_header = "02RETORNO01COBRANCA       893300133921        ZOOP TECNOLOGIA LTDA ME       341BANCO ITAU S.A.11051501600BPI00007120515                                                                                                                                                                                                                                                                                   000001\n"
        
        ret = Cnab400::Ret.new( File.join( File.dirname(__FILE__), "ret", "CN11055A.RET" ) )
        
        assert_equal expected_header, ret.itau.header.content
    end

    def test_if_header_contains_important_info
        expected_header = { 
                            :register_type  => "0",
                            :return_code    => "2",
                            :return_name    => "RETORNO",
                            :service_code   => "01",
                            :service_name   => "COBRANCA       ",
                            :account_agency => "8933",
                            :account_number => "13392",
                            :account_digit  => "1",
                            :account_bank   => "341",
                            :date_of_file   => "110515"
                          }
        
        ret = Cnab400::Ret.new( File.join( File.dirname(__FILE__), "ret", "CN11055A.RET" ) )
        
        assert_equal ret.itau.header.register_type, expected_header[:register_type]
        assert_equal ret.itau.header.return_code, expected_header[:return_code]
        assert_equal ret.itau.header.return_name, expected_header[:return_name]
        assert_equal ret.itau.header.service_code, expected_header[:service_code]
        assert_equal ret.itau.header.service_name, expected_header[:service_name]
        assert_equal ret.itau.header.account_agency, expected_header[:account_agency]
        assert_equal ret.itau.header.account_number, expected_header[:account_number]
        assert_equal ret.itau.header.account_digit, expected_header[:account_digit]
        assert_equal ret.itau.header.account_bank, expected_header[:account_bank]
        assert_equal ret.itau.header.date_of_file, expected_header[:date_of_file]               
    end

    def test_itau_trailer_string
        expected_trailer = "9201341          000000000000000000000000000000          000000000000000000000000000000                                                  000000000000000000000000000000          000000000000000000000000000000000070000000700000000175000                                                                                                                                                                000009
"

        ret = Cnab400::Ret.new( File.join( File.dirname(__FILE__), "ret", "CN11055A.RET" ) )

        assert_equal expected_trailer, ret.itau.trailer.content
    end

    def test_if_trailer_contains_important_info
        expected_trailer = {
                                :register_type      => "9",
                                :return_code        => "2",
                                :service_code       => "01",
                                :detail_quantity    => "00000007",
                                :total_amount       => "00000000175000",
                                :sequential_number  => "000009"
        }

        ret = Cnab400::Ret.new( File.join( File.dirname(__FILE__), "ret", "CN11055A.RET" ) )

        assert_equal ret.itau.trailer.register_type, expected_trailer[:register_type]
        assert_equal ret.itau.trailer.return_code, expected_trailer[:return_code]
        assert_equal ret.itau.trailer.service_code, expected_trailer[:service_code]

        assert_equal ret.itau.trailer.detail_quantity, expected_trailer[:detail_quantity]
        assert_equal ret.itau.trailer.total_amount, expected_trailer[:total_amount]
        assert_equal ret.itau.trailer.sequential_number, expected_trailer[:sequential_number]
    end
end