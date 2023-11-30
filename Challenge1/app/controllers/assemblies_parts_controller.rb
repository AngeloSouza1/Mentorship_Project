class AssembliesPartsController < ApplicationController
  before_action :set_assemblies_part, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @assemblies_parts = AssembliesPart.all
    respond_to do |format|
      format.html
      format.json { render json:  @assemblies_parts }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json:  @assemblies_parts }
    end
  end
  

  # GET /assemblies_parts/new
  def new
    @assemblies_part = AssembliesPart.new
  end

  # GET /assemblies_parts/1/edit
  def edit
  end

  # POST /assemblies_parts or /assemblies_parts.json
  def create
    @assemblies_part = AssembliesPart.new(assemblies_part_params)

    respond_to do |format|
      if @assemblies_part.save
        format.html { redirect_to assemblies_part_url(@assemblies_part), notice: "Assemblies part was successfully created." }
        format.json { render :show, status: :created, location: @assemblies_part }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assemblies_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assemblies_parts/1 or /assemblies_parts/1.json
  def update
    respond_to do |format|
      if @assemblies_part.update(assemblies_part_params)
        format.html { redirect_to assemblies_part_url(@assemblies_part), notice: "Assemblies part was successfully updated." }
        format.json { render :show, status: :ok, location: @assemblies_part }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assemblies_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assemblies_parts/1 or /assemblies_parts/1.json
  def destroy
    @assemblies_part.destroy!

    respond_to do |format|
      format.html { redirect_to assemblies_parts_url, notice: "Assemblies part was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assemblies_part
      @assemblies_part = AssembliesPart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assemblies_part_params
      params.require(:assemblies_part).permit(:assembly_id, :part_id, :book_id)

    end
end
