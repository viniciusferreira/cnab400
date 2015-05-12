# lib = File.expand_path('../lib', __FILE__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)


Gem::Specification.new do |gem|
  gem.name          = "cnab400"
  gem.version       = "0.0.0"
  gem.date          = "2015-05-12"
  gem.authors       = ["Felipe Pavão"]
  gem.email         = ["contact@felipepavao.com"]
  gem.homepage        = "https://github.com/felipepavao/cnab400"
  gem.summary       = %q{Leitura de registros CNAB 400}
  gem.description   = %q{Realiza leitura de registros CNAB no padrão 400 posições}
  

  #gem.files         = `git ls-files`.split($/)
  gem.files         = ["lib/cnab400.rb"]
  gem.license       = "MIT"
  #gem.test_files    = gem.files.grep(%r{^(spec)/})
  #gem.require_paths = ["lib"]
end
