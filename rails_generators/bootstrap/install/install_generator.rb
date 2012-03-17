module Bootstrap
	class Bootstrap::InstallGenerator < Rails::Generators::NamedBase
		source_root File.expand_path('../templates', __FILE__)
		argument :name, :type => :string, :default => "bootstrap"
		
		def generate_layout
			copy_file "layout.html.erb", "app/views/layouts/#{file_name}.html.erb"
			directory "stylesheets", "app/assets/stylesheets"
			directory "images", "app/assets/images"
			directory "javascripts", "app/assets/javascripts"
			directory "helpers", "app/helpers"
		end
			
	end	
end
