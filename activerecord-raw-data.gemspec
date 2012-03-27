# -*- encoding: utf-8 -*-
require File.expand_path('../lib/activerecord-raw-data/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Yuichi Tateno"]
  gem.email         = ["hotchpotch@gmail.com"]
  gem.description   = %q{Get raw data from ActiveRecord}
  gem.summary       = %q{Get raw data from ActiveRecord}
  gem.homepage      = "https://github.com/hotchpotch/activerecord-raw-data"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "activerecord-raw-data"
  gem.require_paths = ["lib"]
  gem.version       = ActiveRecord::RawData::VERSION

  gem.add_dependency(%q<activerecord>, [">= 3.0.0"])
  gem.add_dependency(%q<rake>, [">= 0.8.0"])
  gem.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
  gem.add_development_dependency(%q<pry>, [">= 0"])
  gem.add_development_dependency(%q<sqlite3>, [">= 0"])
  gem.add_development_dependency(%q<database_cleaner>, [">= 0"])
end
