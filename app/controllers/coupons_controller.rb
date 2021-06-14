class CouponsController < ApplicationController
  before_action :set_coupon, only: [:show, :destroy, :update]
  before_action :set_associated_options, only: [:show, :new]
  def index
    @coupons = Coupon.all.page(params[:page])
  end

  # GET /brands/1 or /brands/1.json
  def show

  end

  # GET /brands/new
  def new
    @coupon = Coupon.new
  end

  # GET /brands/1/edit
  def edit
  end

  def find_by_token
    @coupon = Coupon.find_by(token: params[:token])
    status = "valid"
    status = "invalid" if Date.today > @coupon.expired_date&.to_date

    respond_to do |format|
      format.json { render json: { name: @coupon.description, percentage: @coupon.percentage, status: status } }
    end
  end
  # POST /brands or /brands.json
  def create
    @coupon = Coupon.new(coupon_params)

    respond_to do |format|
      if @coupon.save
        format.html { redirect_to @coupon, notice: "Coupon was successfully created." }
        format.json { render :show, status: :created, location: @coupon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brands/1 or /brands/1.json
  def update
    respond_to do |format|
      if @coupon.update(coupon_params)
        format.html { redirect_to @coupon, notice: "Coupon was successfully updated." }
        format.json { render :show, status: :ok, location: @coupon }
      else
        format.html { render @coupon, notice: "Something went wrong" }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brands/1 or /brands/1.json
  def destroy
    @coupon.destroy
    respond_to do |format|
      format.html { redirect_to coupons_path, notice: "Coupon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_coupon
    @coupon = Coupon.find(params[:id])
  end

  def set_associated_options
    @categories = Category.all.map { |c| [c.name, c.id] }
    @brands = Brand.all.map { |c| [c.name, c.id] }
  end
  # Only allow a list of trusted parameters through.
  def coupon_params
    params.require(:coupon).permit(:activated, :expired_date, :description, :percentage, :token)
  end
end
