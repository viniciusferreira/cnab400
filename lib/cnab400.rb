# require "cnab400/itau/header"
# require "cnab400/itau/detail"
# require "cnab400/itau/trailer"

module Cnab400
    class Ret
        attr_accessor :ret_file
        
        def initialize(file_path)
            @ret_file = File.open(file_path, "rb")
        end
    end
    
end