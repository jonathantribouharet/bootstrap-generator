module Bootstrap::BootstrapHelper

	def bootstrap_navbar(title, menus = [])
		output = '
		<div class="navbar navbar-fixed-top">
			<div class="navbar-inner">
			<div class="container">'
				output += link_to(title, root_path, :class => 'brand')
				output +='
				<div class="nav-collapse">
				<ul class="nav">'
				
				for menu in menus
					
					if menu[2]
						
						output += '<li class="dropdown">' + link_to(raw("#{h menu[0]} <b class='caret'></b>"), '#', :class => 'dropdown-toggle',  'data-toggle' => 'dropdown')
						output += '<ul class="dropdown-menu">'
						
						for submenu in menu[2]
							output += bootstrap_item_nav_bar(submenu)
						end
						
						output += '</ul></li>'
						
					else
						
						output += bootstrap_item_nav_bar(menu)
					
					end
				
				end
				
				output += '
				</ul>
			</div>
			</div>
		</div>
		</div>		
		'
		output.html_safe
	end

	def bootstrap_item_nav_bar(menu)
		# if params[:controller].split('/').first == menu[1].split('/')[1]
			# "<li class='active'>" + link_to(menu[0], menu[1]) + "</li>"
		# else
			"<li>" + link_to(menu[0], menu[1]) + "</li>"
		# end		
	end

	def bootstrap_section(title = '', &block)
		"<section><div class='page-header'><h1>#{title}</h1></div>#{capture(&block)}</section>".html_safe
	end

	def bootstrap_subsection(title = '', &block)
		"<div class='row'><h2>#{title}</h2>#{capture(&block)}</div>".html_safe
	end

	def bootstrap_link_to_button(body, url_options = {}, html_options = {})
		html_options[:class] = 'btn'
		link_to(body, url_options, html_options)
	end

end
