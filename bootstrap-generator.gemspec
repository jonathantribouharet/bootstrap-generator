# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
	s.files = `git ls-files`.split("\n")
	s.name = "bootstrap-generator"
	s.platform = Gem::Platform::RUBY
	s.homepage = "https://github.com/eviljojo22/bootstrap-generator"
	s.require_paths = ["rails_generators"]
	s.version = "1.0"
	s.author = "Jonathan TRIBOUHARET"
	s.email = "jonathan.tribouharet@gmail.com"
end
