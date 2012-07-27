require 'rails/generators/base'

module Bootstrap
	module Rails
		class Railtie < ::Rails::Railtie
			initializer "configure assets of bootstrap-generator", :group => :all do |app|
				app.config.assets.precompile += %w( bootstrap.js bootstrap.css )
			end
		end
  end
end
