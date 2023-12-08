class AccountsController < ApplicationController
  before_action :set_account, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @accounts = Account.all

    respond_to do |format|
      format.html
      format.json { render json: @accounts }
    end
  end

  def filtrar
    if params[:search_account].present?
      @accounts = Account.where("account_number LIKE ?", "%#{params[:search_account]}%")
    else
      @accounts = Account.all
    end
    puts "DEBUG: Parâmetros de filtro - #{params.inspect}"
    render :filtrar  
  end



  def show
    respond_to do |format|
      format.html 
      format.json { render json: @account }
    end
  end

  def new
    @account = Account.new
  end

  def edit
  end

  def create
    @account = Account.new(account_params)
    @account.digito_verificador = @account.calcular_digito_verificador
  
    respond_to do |format|
      if @account.save
        format.html { redirect_to account_url(@account), notice: "Conta criada com sucesso." }
        format.json { render :show, status: :created, location: @account }
      else
         flash[:error] = @account.errors.full_messages.join(", ")
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @account.update(account_params)
         @account.calcular_digito_verificador
         @account.save
  
        format.html { redirect_to account_url(@account), notice: "Conta atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @account.destroy!

    respond_to do |format|
      format.html { redirect_to accounts_url, notice: "Conta excluída com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:supplier_id, :account_number, :digito_verificador)
  end
end
