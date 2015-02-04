module Cursored
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def create_cursored_initializer
        copy_file 'cursored.rb', 'config/initializers/cursored.rb'
      end

      def inject_cursored_into_application_controller
        inject_into_class "app/controllers/application_controller.rb", ApplicationController do
          "  include Cursored::Controller\n"
        end
      end
    end
  end
end
