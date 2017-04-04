class ProductsController < ApplicationController
  def new
   @product = Product.new
  end

  def create
    # the line below is what's called "Strong Parameters" feautre that was added
    # to Rails starting with version 4 to help developer be more explicit about
    # the parameters that they want to allow the user to submit
    product_params = params.require(:product).permit([:title, :Description, :price,:category_id, :rating])
    @product = Product.new product_params
    if @product.save
      # redirect_to question_path({id: @question.id})
      # redirect_to question_path(@question.id)
      redirect_to product_path(@product)
    else
      # render 'questions/new'
      render :new
    end
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
  end

  def index
    @products = Product.order(created_at: :desc).limit(20)
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    product_params = params.require(:product).permit([:title, :body, :category_id, :rating])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    product = Product.find params[:id]
    product.destroy
    redirect_to products_path
  end

end
