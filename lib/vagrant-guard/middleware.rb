module VagrantGuard
  class Middleware
    def initialize(app, env)
      @app = app
      @env = env
    end

    def call(env)
      if env["vm"].created? && env["vm"].vm.running?
        command = "guard #{env["guard.command"]}".strip
				
        env["vm"].ssh.execute do |ssh|
          env.ui.info I18n.t("vagrant.plugins.guard.starting", :command => command)

          ssh.exec!("cd #{working_directory}; #{command}") do |channel, type, data|
            # Print the data directly to STDOUT, not doing any newlines
            # or any extra formatting of our own
            $stdout.print(data) if type != :exit_status
          end

          # Puts out an ending newline just to make sure we end on a new line.
          $stdout.puts
        end
      end

      @app.call(env)
    end

    protected

    def working_directory
      @env["guard.cwd"] || @env["config"].guard.directory || @env["config"].vm.shared_folders["v-root"][:guestpath]
    end
  end
end