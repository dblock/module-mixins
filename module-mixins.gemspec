$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'module/mixins/version'

Gem::Specification.new do |s|
  s.name = 'module-mixins'
  s.version = Module::Mixins::VERSION
  s.authors = ['Daniel Doubrovkine']
  s.email = 'dblock@dblock.org'
  s.platform = Gem::Platform::RUBY
  s.required_rubygems_version = '>= 1.3.6'
  s.files = `git ls-files`.split("\n")
  s.require_paths = ['lib']
  s.homepage = 'http://github.com/dblock/module-mixins'
  s.licenses = ['MIT']
  s.summary = 'A little bit of help with Ruby modules.'
  s.add_dependency 'activesupport'
end
