module Bootstrap::TableHelper

	def bootstrap_table(headers = [], &block)
		output ='
		<table class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>'
				
				for header in headers
					output += '<th>' + header.to_s + '</th>'
				end

				output +='
				</tr>
			</thead>
			<tbody>'
				output += capture(&block) if block_given?
				output +='
			</tbody>
		</table>'		
		output.html_safe
	end

	def bootstrap_table_item(&block)
		('<tr>' + capture(&block) + '</tr>').html_safe
	end

	def bootstrap_table_col(item)
		output = ('<td>').html_safe
		output += item.to_s
		output += ('</td>').html_safe
		output
	end

	def bootstrap_table_col_edit(path)
		('<td>' + link_to('Editer', path) + '</td>').html_safe
	end

	def bootstrap_table_col_delete(path)
		('<td>' + link_to('Supprimer', path, :method => :delete, :confirm => 'Etes-vous sure?') + '</td>').html_safe
	end

end
