# -*- encoding: utf-8 -*-
require File.expand_path('../lib/itunes_csv/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andy Waite"]
  gem.email         = ["github.aw@andywaite.com"]
  gem.description   = "Export iTunes Library XML data to CSV"
  gem.summary       = "Export iTunes Library XML data to CSV"
  gem.homepage      = "https://github.com/andyw8/itunes_csv"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "itunes_csv"
  gem.require_paths = ["lib"]
  gem.version       = ItunesCsv::VERSION
  gem.add_runtime_dependency "itunes-library"
end
