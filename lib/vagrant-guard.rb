require 'vagrant'
require 'vagrant-guard/config'
require 'vagrant-guard/command'
require 'vagrant-guard/middleware'

guard = Vagrant::Action::Builder.new do
  use VagrantGuard::Middleware
end

Vagrant::Action.register(:guard, guard)

# Add our custom translations to the load path
I18n.load_path << File.expand_path("../../locales/en.yml", __FILE__)