class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  # GET /suppliers or /suppliers.json
  def index
    @suppliers = Supplier.all

    respond_to do |format|
      format.html # Renderiza views HTML normalmente
      format.json { render json: @suppliers }
    end
  end

  # GET /suppliers/1 or /suppliers/1.json
  def show
    respond_to do |format|
      format.html # Renderiza views HTML normalmente
      format.json { render json: @supplier }
    end
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers or /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to supplier_url(@supplier), notice: "Supplier was successfully created." }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1 or /suppliers/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to supplier_url(@supplier), notice: "Supplier was successfully updated." }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1 or /suppliers/1.json
  def destroy
    @supplier.destroy!

    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: "Supplier was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
    params.require(:supplier).permit(:name)
  end
end
