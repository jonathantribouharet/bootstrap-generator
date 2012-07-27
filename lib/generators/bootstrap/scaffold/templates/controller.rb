class <%= class_name %>Controller < ApplicationController
	
	def index
		@<%= plural_name %> = <%= plural_name.singularize.capitalize %>.all
	end
		
	def new
		@<%= plural_name.singularize %> = <%= plural_name.singularize.capitalize %>.new
	end
	
	def edit
		@<%= plural_name.singularize %> = <%= plural_name.singularize.capitalize %>.find(params[:id])
	end
	
	def create
		@<%= plural_name.singularize %> = <%= plural_name.singularize.capitalize %>.new(params[:<%= plural_name.singularize %>])
		if @<%= plural_name.singularize %>.save
			redirect_to <%= table_name %>_url
		else
			render :new
		end
	end
	
	def update
		@<%= plural_name.singularize %> = <%= plural_name.singularize.capitalize %>.find(params[:id])
		if @<%= plural_name.singularize %>.update_attributes(params[:<%= plural_name.singularize %>])
			redirect_to <%= table_name %>_url
		else
			render :edit
		end
	end
	
	def destroy
		<%= plural_name.singularize.capitalize %>.destroy(params[:id])
		redirect_to <%= table_name %>_url
	end
	
end
