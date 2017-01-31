class ChargesController < ApplicationController

	def new
	end

	def create

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => params[:total_price],
	    :description => params[:description],
	    :currency    => 'usd'
	  )

	  product = Product.find(params[:product_id])

	  order = Order.create(
	  	user: current_user,
	  	product: product,
	  	price: params[:price],
	  	quantity: params[:quantity],
	  	total_price: params[:total_price],
	  	stripe_customer_id: customer.id,
	  	stripe_email: customer.email,
	  	currency: charge.currency
	  )

	  redirect_to root_path

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end

end