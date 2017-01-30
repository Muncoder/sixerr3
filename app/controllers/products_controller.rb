class ProductsController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :my_products]
	before_action :find_product, except: [:index, :new, :create, :my_products ]

	def index
		@products = Product.paginate(:page => params[:page]).order("created_at DESC")
	end

	def new
		@product = current_user.products.new
	end

	def create
		@product = current_user.products.create(product_params)

		if @product.save
			flash[:notice] = "Product saved successfully"
			redirect_to products_path
		else
			flash[:notice] = "Error! could not be saved"
			render "new"
		end
	end

	def show
		
	end

	def edit
	end

	def update
		if @product.update(product_params)
			flash[:notice] = "Product updated successfully"
			redirect_to products_path
		else
			flash[:notice] = "Error! could not be updated"
			render "edit"
		end
	end

	def destroy
	end

	def my_products
		@products = current_user.products.paginate(:page => params[:page]).order("created_at DESC")
	end

	private

		def product_params
			params.require(:product).permit(:name, :price, :description, :image)
		end

		def find_product
			@product = Product.find(params[:id])
		end

end