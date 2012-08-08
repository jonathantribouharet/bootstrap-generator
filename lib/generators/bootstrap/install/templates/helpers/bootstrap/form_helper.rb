module Bootstrap::FormHelper

	def bootstrap_form_for(record_or_name_or_array, *args, &block)
		args[0] ||= {}
		args[0].deep_merge!({:html=> {:class => "form-horizontal"}, :builder => BootstrapFormBuilder})
		form_for(record_or_name_or_array, *args, &block)
	end

	class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
		
		def submit(value = nil, options = {})
			super(value, options.merge!(:class => 'btn'))
		end		
				
		def text_field(method, options = {})
			bootstrap_field(method) do
				"#{super(method, options)}#{error_field(method)}"
			end
		end		
		
		def text_area(method, options = {})
			bootstrap_field(method) do
				"#{super(method, options)}#{error_field(method)}"
			end			
		end
		
		def password_field(method, options = {})
			bootstrap_field(method) do
				"#{super(method, options)}#{error_field(method)}"
			end
		end				
		
		def select(method, choices, options = {}, html_options = {})
			bootstrap_field(method) do
				"#{super(method, choices, options, html_options)}#{error_field(method)}".html_safe
			end
		end				
		
		def date_select(method, options = {}, html_options = {})
			bootstrap_field(method) do
				html_options[:class] = 'input-small'
				"#{super(method, options, html_options)}#{error_field(method)}".html_safe
			end
		end		
		
		def datetime_select(method, options = {}, html_options = {})
			bootstrap_field(method) do
				html_options[:class] = 'input-small'
				"#{super(method, options, html_options)}#{error_field(method)}".html_safe
			end
		end				
		
		def file_field(method, options = {})
			bootstrap_field(method) do
				"#{super(method, options)}#{error_field(method)}"
			end
		end			
		
		def check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
			bootstrap_field(method) do
				"<label class='checkbox'>#{super(method, options, checked_value, unchecked_value)}#{options[:text]}</label>#{error_field(method)}".html_safe
			end			
		end		
		
		private
		
		def bootstrap_field(method, &block)
			"<div class='control-group #{have_error?(method) ? 'error' : ''}'>#{label method, :class => 'control-label'}<div class='controls'>#{yield(block)}</div></div>".html_safe
		end
		
		def have_error?(method)
			return true if @object.errors[method].size > 0
			false
		end
		
		def error_field(method)
			if @object.errors[method].size > 0
				"<span class='help-inline'>#{@object.errors[method].join(', ')}</span>".html_safe
			end			
		end		
		
	end

	def bootstrap_form_tag(url_for_options = {}, options = {}, *parameters_for_url, &block)
		options.merge!({:class => "form-horizontal"})
		form_tag(url_for_options, options, *parameters_for_url, &block)
	end
	
	def bootstrap_field(object_name, method, &block)
		"<div class='control-group'>#{label object_name, method, t('.' + object_name.to_s  + '.' + method.to_s), :class => 'control-label'}<div class='controls'>#{capture(&block).to_s}</div></div>".html_safe
	end
	
	def bootstrap_field_tag(object_name, &block)
		"<div class='control-group'>#{label_tag object_name, t('.' + object_name.to_s), :class => 'control-label'}<div class='controls'>#{capture(&block).to_s}</div></div>".html_safe
	end	

	def bootstrap_date_select(object_name, method, options = {}, html_options = {})
		bootstrap_field(object_name, method) do 
			date_select(object_name, method, options, html_options.merge!(:class => 'input-small'))
		end
	end

	def bootstrap_file_field(object_name, method, options = {})
		bootstrap_field(object_name, method) do 
			file_field(object_name, method, options)
		end
	end
		
	def bootstrap_file_field_tag(object_name, options = {})
		bootstrap_field_tag(object_name) do 
			file_field_tag(object_name, options)
		end
	end	
	
	def bootstrap_select_tag(name, option_tags = nil, options = {})
		bootstrap_field_tag(name) do 
			select_tag(name, option_tags, options)
		end
	end	
	
	def bootstrap_text_field_tag(object_name, value = nil, options = {})
		bootstrap_field_tag(object_name) do 
			text_field_tag(object_name, value, options)
		end
	end	

	def bootstrap_text_area_tag(object_name, value = nil, options = {})
		bootstrap_field_tag(object_name) do 
			text_area_tag(object_name, value, options)
		end
	end		

	def bootstrap_check_box(object_name, method, options = {}, checked_value = "1", unchecked_value = "0")
		bootstrap_field_tag(object_name) do 
			check_box(object_name, method, options, checked_value, unchecked_value)
		end			
	end
	
	def bootstrap_check_box_tag(name, value = "1", checked = false, options = {})
		bootstrap_field_tag(name) do 
			check_box_tag(name, value, checked, options)
		end	
	end

	def bootstrap_password_field_tag(object_name, value = nil, options = {})
		bootstrap_field_tag(object_name) do 
			password_field_tag(object_name, value, options)
		end
	end	

	def bootstrap_submit_tag(value = "Save changes", options = {})
		submit_tag(value, options.merge!(:class => 'btn'))
	end		

end
