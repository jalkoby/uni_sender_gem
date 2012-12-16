# -*- encoding: utf-8 -*-
require File.expand_path('../lib/uni_sender/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sergey Pchelincev"]
  gem.email         = ["jalkoby91@gmail.com"]
  gem.description   = %q{Gem that provide access to unisender.com.ua api}
  gem.summary       = %q{See description}
  gem.homepage      = ""

  gem.add_dependency 'rest-client', '~> 1.6.7'
  gem.add_dependency 'json',        '~> 1.7.5'
  gem.add_development_dependency 'rspec'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "uni_sender"
  gem.require_paths = ["lib"]
  gem.version       = UniSender::VERSION
end
