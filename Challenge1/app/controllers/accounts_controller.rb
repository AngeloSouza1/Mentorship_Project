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

    respond_to do |format|
      if @account.save
        format.html { redirect_to account_url(@account), notice: "Conta criada com sucesso." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @account.update(account_params)
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
    params.require(:account).permit(:supplier_id, :account_number)
  end
end
