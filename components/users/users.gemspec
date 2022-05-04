# frozen_string_literal: true

require_relative 'lib/users/version'

Gem::Specification.new do |spec|
  spec.name        = 'users'
  spec.version     = Users::VERSION
  spec.authors     = ['Ernesto']
  spec.email       = ['ernestohlacalle@gmail.com']
  spec.homepage    = 'http://example.org'
  spec.summary     = 'Summary of Users.'
  spec.description = 'Description of Users.'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = 'http://mygemserver.com'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.test_files = Dir['spec/**/*']
  spec.add_development_dependency 'rspec-rails'
  spec.add_dependency 'active_event_store', '~> 1.0'
  spec.add_dependency 'rails', '>= 7.0.2.4'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
