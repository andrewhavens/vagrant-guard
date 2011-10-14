module VagrantGuard
  class Command < Vagrant::Command::Base
    register "guard", "Run guard from inside the VM environment"
    argument :guard_command, :type => :array, :required => false, :desc => "Guard specific commands or options."
		class_option :path, :type => :string, :default => nil, :desc => "The path to the Guardfile. Defaults to the Vagrant shared directory."
		
    def execute
      target_vms.each do |vm|
      	vm.env.actions.run(
      		:guard,
					"guard.command" => guard_command,
					"guard.cwd" => options[:path]
				)
      end
    end
  end
end