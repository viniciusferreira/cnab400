require 'minitest/autorun'
require 'byebug'
require 'cnab400'

class Cnab400ItauTest < Minitest::Unit::TestCase
    def test_itau_header_string
        expected_header = "02RETORNO01COBRANCA       893300133921        ZOOP TECNOLOGIA LTDA ME       341BANCO ITAU S.A.11051501600BPI00007120515                                                                                                                                                                                                                                                                                   000001\n"
        
        ret = Cnab400::Ret.new(File.join( "./test/ret/", "CN11055A.RET" ))
        
        assert_equal expected_header, ret.itau.header.content
    end
end