module Bootstrap
	class Bootstrap::ScaffoldGenerator < Rails::Generators::NamedBase
		source_root File.expand_path('../templates', __FILE__)
		
		def create_controller_file
			template "controller.rb", "app/controllers/#{file_path}_controller.rb"
		end	
		
		def create_view_file
			template "index.html.erb", "app/views/#{file_path}/index.html.erb"
			template "new.html.erb", "app/views/#{file_path}/new.html.erb"
			template "edit.html.erb", "app/views/#{file_path}/edit.html.erb"
			template "_form.html.erb", "app/views/#{file_path}/_form.html.erb"
		end
		
	end
end
