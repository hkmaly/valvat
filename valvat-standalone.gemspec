# frozen_string_literal: true

# Beware: This LOAD_PATH stuff is deliberate, Ruby 1.9.3 doesn't support require_relative here
$LOAD_PATH.push File.expand_path('lib', File.dirname(__FILE__))
require 'valvat/version'

Gem::Specification.new do |s|
  s.name                              = 'valvat-standalone'
  s.version                           = Valvat::VERSION
  s.platform                          = Gem::Platform::RUBY
  s.license                           = 'MIT'
  s.authors                           = ['Sebastian Munz', 'Honza Maly']
  s.email                             = ['sebastian@mite.de', 'honza.maly@newsmatics.com']
  s.homepage                          = 'https://github.com/yolk/valvat'
  s.summary                           = 'Validates european vat numbers. Standalone.'
  s.description                       = 'Validates european vat numbers. Standalone.'
  s.files                             = `git ls-files`.split("\n")
  s.require_paths                     = ['lib']
  s.cert_chain                        = ['certs/mite.pem']
  # s.signing_key                       = File.expand_path('~/.ssh/gem-private_key.pem') if $PROGRAM_NAME =~ /gem\z/
  s.required_ruby_version             = '>= 1.9.3'
  # Also, ruby 1.9.3 doesn't support s.metadata here
  metadata = {
    'bug_tracker_uri' => "#{s.homepage}/issues",
    'changelog_uri' => "#{s.homepage}/blob/master/CHANGES.md",
    'documentation_uri' => "#{s.homepage}/blob/master/README.md",
    'homepage_uri' => s.homepage,
    'source_code_uri' => s.homepage,
    'rubygems_mfa_required' => 'true'
  }

  # s.add_runtime_dependency('rexml', '>= 3.2.5', '< 4.0')
  s.add_runtime_dependency('nokogiri', '>= 1.5.9')
end
