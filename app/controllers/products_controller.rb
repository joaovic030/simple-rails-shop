class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy management_show ]
  before_action :set_options, only: %i[ management_show new create update ]
  # GET /products or /products.json
  def index

    @filterrific = initialize_filterrific(
      Product.includes(:category),
      params[:filterrific]
    ) or return
    @products = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def manage_index
    @filterrific = initialize_filterrific(
      Product.includes(:category),
      params[:filterrific]
    ) or return
    @products = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def management_show

  end

  # GET /products/1 or /products/1.json
  def show
    @cart_action = @product.cart_action current_user.try(:id)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_management_path(@product), notice: "Product was successfully created." }
        format.json { render :management_show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_management_path(@product), notice: "Product was successfully updated." }
        format.json { render :management_show, status: :ok, location: @product }
      else
        format.html { render :management_show, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_management_path, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_options
      @categories = Category.all.map { |c| [c.name, c.id] }
      @brands = Brand.all.map { |c| [c.name, c.id] }
    end
    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :brand_id, :category_id, :price, :image_url, :for, :desc1, :desc2)
    end
end
