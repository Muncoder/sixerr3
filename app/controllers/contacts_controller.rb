class ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.create(contact_params)

		if @contact.save
			flash[:notice] = "Saved successfully !"

			@name = params[:contact][:name]
			@email = params[:contact][:email]
			@body = params[:contact][:body]

			ContactMailer.contact_email(@name, @email, @body).deliver

			flash[:notice] = "Query sent successfully !"
			redirect_to root_path
		else
			flash[:notice] = "Error, could not be saved !"
			render "new"
		end
	end

	private

	def contact_params
		params.require(:contact).permit(:name, :email, :body)
	end

end