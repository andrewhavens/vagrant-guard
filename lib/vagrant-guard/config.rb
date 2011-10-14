module VagrantGuard
	
  class Config < Vagrant::Config::Base
    configures :guard
    attr_accessor :directory

    def validate(errors)
      errors.add(I18n.t("vagrant.plugins.guard.config_directory")) if directory && !directory.is_a?(String)
    end
  end
end
