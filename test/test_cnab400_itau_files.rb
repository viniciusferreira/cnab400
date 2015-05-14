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

    def test_should_return_only_details_string
        expected_details = "10219468242000132893300133921                                 00000215            157000002155             I06110515          00000215            000000000000002500003339776  000000000000000000000000000000000000000000000000000000000000000000000000000000000000002500000000000000000000000000000   12051500000000000000000000000                                                                    B2000002\n10219468242000132893300133921                                 00000217            157000002171             I06110515          00000217            000000000000002500003335220  000000000000000000000000000000000000000000000000000000000000000000000000000000000000002500000000000000000000000000000   12051500000000000000000000000                                                                    B3000003\n10219468242000132893300133921                                 00000218            157000002189             I06110515          00000218            000000000000002500023727813  000000000000000000000000000000000000000000000000000000000000000000000000000000000000002500000000000000000000000000000   12051500000000000000000000000                                                                    B2000004\n10219468242000132893300133921                                 00000219            157000002197             I06110515          00000219            000000000000002500010422707  000000000000000000000000000000000000000000000000000000000000000000000000000000000000002500000000000000000000000000000   12051500000000000000000000000                                                                    B3000005\n10219468242000132893300133921                                 00000221            157000002213             I06110515          00000221            000000000000002500034174997  000000000000000000000000000000000000000000000000000000000000000000000000000000000000002500000000000000000000000000000   12051500000000000000000000000                                                                    BL000006\n10219468242000132893300133921                                 00000229            157000002296             I06110515          00000229            000000000000002500074500018  000000000000000000000000000000000000000000000000000000000000000000000000000000000000002500000000000000000000000000000   12051500000000000000000000000                                                                    B3000007\n10219468242000132893300133921                                 00000231            157000002312             I06110515          00000231            000000000000002500034138315  000000000000000000000000000000000000000000000000000000000000000000000000000000000000002500000000000000000000000000000   12051500000000000000000000000                                                                    BL000008\n"
        
        ret = Cnab400::Ret.new( File.join( File.dirname(__FILE__), "ret", "CN11055A.RET" ) )
        
        assert_equal expected_details, ret.itau.details_string
        
    end

    def test_if_details_contain_necessary_info
        first_expected_detail_string = "10219468242000132893300133921                                 00000215            157000002155             I06110515          00000215            000000000000002500003339776  000000000000000000000000000000000000000000000000000000000000000000000000000000000000002500000000000000000000000000000   12051500000000000000000000000                                                                    B2000002\n"

        first_expected_detail = {
            :register_type          => "1",
            :registration_code      => "02",
            :registration_number    => "468242000132",
            :identifier             => "00000215",
            :identifier_code        => "5",
            :occurrence_date        => "110515",
            :document_number        => "          ",
            :credit_date            => "120515",
            :amount                 => "0000000025000"

        }

        second_expected_detail_string = "10219468242000132893300133921                                 00000217            157000002171             I06110515          00000217            000000000000002500003335220  000000000000000000000000000000000000000000000000000000000000000000000000000000000000002500000000000000000000000000000   12051500000000000000000000000                                                                    B3000003\n"

        second_expected_detail = {
            :register_type          => "1",
            :registration_code      => "02",
            :registration_number    => "468242000132",
            :identifier             => "00000217",
            :identifier_code        => "1",
            :occurrence_date        => "110515",
            :document_number        => "          ",
            :credit_date            => "120515",
            :amount                 => "0000000025000"
        }

        ret = Cnab400::Ret.new( File.join( File.dirname(__FILE__), "ret", "CN11055A.RET" ) )
        
        
        assert_equal ret.itau.details[0].detail_string, first_expected_detail_string

        assert_equal ret.itau.details[0].register_type, first_expected_detail[:register_type]
        assert_equal ret.itau.details[0].registration_code, first_expected_detail[:registration_code]
        assert_equal ret.itau.details[0].registration_number, first_expected_detail[:registration_number]
        assert_equal ret.itau.details[0].identifier, first_expected_detail[:identifier]
        assert_equal ret.itau.details[0].identifier_code, first_expected_detail[:identifier_code]
        assert_equal ret.itau.details[0].occurrence_date, first_expected_detail[:occurrence_date]
        assert_equal ret.itau.details[0].document_number, first_expected_detail[:document_number]
        assert_equal ret.itau.details[0].credit_date, first_expected_detail[:credit_date]
        assert_equal ret.itau.details[0].amount, first_expected_detail[:amount]
        
        assert_equal ret.itau.details[1].detail_string, second_expected_detail_string

        assert_equal ret.itau.details[1].register_type, second_expected_detail[:register_type]
        assert_equal ret.itau.details[1].registration_code, second_expected_detail[:registration_code]
        assert_equal ret.itau.details[1].registration_number, second_expected_detail[:registration_number]
        assert_equal ret.itau.details[1].identifier, second_expected_detail[:identifier]
        assert_equal ret.itau.details[1].identifier_code, second_expected_detail[:identifier_code]
        assert_equal ret.itau.details[1].occurrence_date, second_expected_detail[:occurrence_date]
        assert_equal ret.itau.details[1].document_number, second_expected_detail[:document_number]
        assert_equal ret.itau.details[1].credit_date, second_expected_detail[:credit_date]
        assert_equal ret.itau.details[1].amount, second_expected_detail[:amount]        

    end
end