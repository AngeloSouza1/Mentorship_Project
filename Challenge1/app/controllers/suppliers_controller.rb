class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @suppliers = Supplier.all
    respond_to do |format|
      format.html
      format.json { render json: @suppliers }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @supplier }
    end
  end

  def new
    @supplier = Supplier.new
  end

  def filtrar
    if params[:search_name].present?
      @suppliers = Supplier.where("name LIKE ?", "%#{params[:search_name]}%")
    else
      @suppliers = Supplier.all
    end
    render :filtrar  
  end


  def edit
  end

  def create
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to supplier_url(@supplier), notice: "Fornecedor criado com sucesso." }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to supplier_url(@supplier), notice: "Fornecedor atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @supplier.destroy!

    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: "Fornecedor excluído com sucesso." }
      format.json { head :no_content }
    end
  end




  private

  def set_supplier
    if params[:id].present?
      @supplier = Supplier.find(params[:id])
    end
  end

  def supplier_params
    params.require(:supplier).permit(:name, :cnpj)
  end
end
