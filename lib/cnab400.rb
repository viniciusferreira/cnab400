require "cnab400/itau/itau"
require "cnab400/itau/header"
require "cnab400/itau/detail"
require "cnab400/itau/trailer"

module Cnab400
    class Ret
        attr_accessor :file_path
        
        def initialize(file_path)
            @file_path = file_path
        end

        def to_string
            File.read(@file_path)         
        end

        def itau
            Itau.new(@file_path)
        end
    end
    
end