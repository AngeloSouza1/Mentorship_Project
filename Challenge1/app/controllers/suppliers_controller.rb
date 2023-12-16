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

  def filtrar2
    if params[:search_name].present?
       author = Author.where("name LIKE ?", "%#{params[:search_name]}%")
       @suppliers = Supplier.where(id: author.pluck(:sup_id))
    else
       @suppliers = Supplier.all
    end
    render :filtrar2
  end
   
  def relatorio_supplier
    if params[:search_supplier].present?
      @suppliers = Supplier.where("name LIKE ?", "%#{params[:search_supplier]}%")
    else
      @suppliers = Supplier.all
    end
    render :relatorio
  end
  

  def gerar_supplier
     supplier_id = params[:supplier_id]
      @suppliers = Supplier.find_by(id: supplier_id)
  end  


  def gerar_supplier_pdf
    supplier_id = params[:supplier_id]
    @suppliers = Supplier.find_by(id: supplier_id)
  
    respond_to do |format|
      format.pdf do
        pdf = Prawn::Document.new
  
        pdf.font_families.update(
          'Roboto' => {
            normal: Rails.root.join('app', 'assets', 'fonts', 'Roboto-Regular.ttf'),
            italic: Rails.root.join('app', 'assets', 'fonts', 'Roboto-Italic.ttf'),
            bold: Rails.root.join('app', 'assets', 'fonts', 'Roboto-Bold.ttf'),
            bold_italic: Rails.root.join('app', 'assets', 'fonts', 'Roboto-BoldItalic.ttf')
          }
        )
        pdf.font 'Roboto'
        pdf.text "Relatório de Fornecedor", size: 18, align: :center, style: :bold
        pdf.stroke_horizontal_line(0, pdf.bounds.width, at: pdf.cursor - 2)
        pdf.move_down 3
  
        if @suppliers.present?
          pdf.move_down 10
          pdf.text "Dados", size: 12, style: :bold
          pdf.move_down 4
          pdf.text "ID Fornecedor:  #{@suppliers.id}", size: 10
          pdf.move_down 4
          pdf.text "Fornecedor:       #{@suppliers.name}", size: 10
          pdf.move_down 4
          pdf.text "CNPJ:                 #{@suppliers.cnpj}", size: 10
          pdf.move_down 4
          pdf.text "Criado:                #{@suppliers.created_at.strftime("%d/%m/%Y %H:%M:%S")}", size: 10
          pdf.move_down 4
          pdf.text "Atualizado:         #{@suppliers.updated_at.strftime("%d/%m/%Y %H:%M:%S")}", size: 10
          pdf.move_down 10
          pdf.stroke_horizontal_line(0, pdf.bounds.width, at: pdf.cursor - 2)
        end
  
        if @suppliers.authors.present?
          pdf.move_down 10
          pdf.text "Autores", size: 12, style: :bold
          pdf.move_down 3
          authors_data = [['ID', 'Nome', 'CPF', 'Criado', 'Atualizado']]
          @suppliers.authors.each do |author|
            authors_data << [author.id, author.name, author.cpf, author.created_at.strftime("%d/%m/%Y %H:%M:%S"), author.updated_at.strftime("%d/%m/%Y %H:%M:%S")]
          end
          pdf.table(authors_data, header: true, width: pdf.bounds.width) do
            row(0).font_style = :bold
            self.row_colors = ['DDDDDD', 'FFFFFF']
            cells.size = 10  
          end
          pdf.move_down 10
        end
               
          pdf.text "Livros", size: 12, style: :bold
          if @suppliers.authors.present?
            pdf.move_down 6
            pdf.move_down 3
            authors_data = [['ID', 'Autor', 'Livros','ISBN', 'Publicação','Criado','Atualizado']]
            @suppliers.authors.each do |author|
              author.books.each do |book|
                authors_data << [author.id, author.name, book.title, book.isbn, book.publishing.strftime("%d/%m/%Y %H:%M:%S"),book.created_at.strftime("%d/%m/%Y %H:%M:%S"), book.updated_at.strftime("%d/%m/%Y %H:%M:%S")]
              end
            end
          
            pdf.table(authors_data, header: true, width: pdf.bounds.width) do
              row(0).font_style = :bold
              self.row_colors = ['DDDDDD', 'FFFFFF']
              cells.size = 10
            end
            pdf.move_down 8
          end
          
  
  
  
  
  
        send_data pdf.render, filename: 'relatorio_fornecedor.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
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
    @suppliers.destroy!

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
    params.require(:supplier).permit(:name, :cnpj, :id)
  end
end
