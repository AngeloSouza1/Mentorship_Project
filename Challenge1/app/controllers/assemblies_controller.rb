class AssembliesController < ApplicationController
  before_action :set_assembly, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @assemblies = Assembly.all
    respond_to do |format|
      format.html
      format.json { render json: @assemblies }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @assembly }
    end
  end

  def new
    @assembly = Assembly.new
  end

  def edit
  end

  def create
    @assembly = Assembly.new(assembly_params)

    respond_to do |format|
      if @assembly.save
        format.html { redirect_to assembly_url(@assembly), notice: "Montagem criada com sucesso." }
        format.json { render :show, status: :created, location: @assembly }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assembly.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @assembly.update(assembly_params)
        format.html { redirect_to assembly_url(@assembly), notice: "Montagem atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @assembly }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assembly.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @assembly.destroy!

    respond_to do |format|
      format.html { redirect_to assemblies_url, notice: "Montagem excluída com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  def set_assembly
    @assembly = Assembly.find(params[:id])
  end

  def assembly_params
    params.require(:assembly).permit(:name)
  end
end
