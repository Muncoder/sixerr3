class ContactMailer < ActionMailer::Base

	default to: 'munirchittagong@yahoo.com'

	def contact_email(name, email, body)
		@name = name
		@email = email
		@body = body

		mail(subject: "Contact Form", from: email)
	end

end