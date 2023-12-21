class BooksController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :set_book, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @books = Book.all
    respond_to do |format|
      format.html
      format.json { render json: @books }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @book }
    end
  end

  def filtrar
    if params[:search_book].present?
      @books = Book.where("title LIKE ?", "%#{params[:search_book]}%")
    else
      @books = Book.all
    end
    render :filtrar  
  end

  def relatorio_livro
    if params[:search_book].present?
      @books = Book.where("title LIKE ?", "%#{params[:search_book]}%")
    else
      @books = Book.all
    end
    render :relatorio
  end

  
  def gerar_livro
  book_id = params[:id]
  @book = Book.find_by(id: book_id)

  if @book
    render :gerar_livro
  else
    redirect_to books_path, alert: 'Livro não encontrado.'
  end
end

def gerar_livro_pdf
  book_id = params[:book_id]
  @book = Book.find_by(id: book_id)

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
      pdf.text "Relatório de Livro", size: 18, align: :center,style: :bold
      pdf.stroke_horizontal_line(0, pdf.bounds.width, at: pdf.cursor - 2)
      pdf.move_down 3
      if @book.present?
        pdf.move_down 10
        pdf.text "Dados", size: 12, style: :bold
        pdf.move_down 4
        pdf.text "ID Livro:        #{@book.id}", size: 10
        pdf.move_down 3
        pdf.text "Livro:             #{@book.title}", size: 10
        pdf.move_down 4
        pdf.text "Publicação:  #{@book.publishing.strftime("%d/%m/%Y %H:%M:%S")}", size: 10
        pdf.move_down 10
        pdf.stroke_horizontal_line(0, pdf.bounds.width, at: pdf.cursor - 2)
        if @book.present?
          pdf.move_down 8
          pdf.text "Montagens", size: 12, style: :bold
          pdf.move_down 3
          books_data = [['ID', 'Montagem', 'Peça', 'Criado','Atualizado']]
          @book.assemblies_parts.each do |book|
            books_data << [book.id,Assembly.find(book.assembly_id).name,Part.find(book.part_id).nome, book.created_at.strftime("%d/%m/%Y %H:%M:%S"),
            book.updated_at.strftime("%d/%m/%Y %H:%M:%S")]
          end
          pdf.table(books_data, header: true, width: pdf.bounds.width) do
            row(0).font_style = :bold
            self.row_colors = ['DDDDDD', 'FFFFFF']
            cells.size = 10  
          end
         
          pdf.move_down 10
          pdf.stroke_horizontal_line(0, pdf.bounds.width, at: pdf.cursor - 2)
          if @book.present?
            pdf.move_down 8
            pdf.text "Peças", size: 12, style: :bold
            pdf.move_down 3
            books_data = [['ID', 'Peça', 'Número da Peça', 'Valor da Peça','Criado','Atualizado']]
            @book.assemblies_parts.each do |book|
                 books_data << [
                 book.id,
                 Part.find(book.part_id).nome, 
                 Part.find(book.part_id).part_number,  
                 number_to_currency(Part.find(book.part_id).valor, unit: "R$", format: "%u %n"), 
                 book.created_at.strftime("%d/%m/%Y %H:%M:%S"), 
                 book.updated_at.strftime("%d/%m/%Y %H:%M:%S")]
            end  
              pdf.table(books_data, header: true, width: pdf.bounds.width) do
              row(0).font_style = :bold
              self.row_colors = ['DDDDDD', 'FFFFFF']
              cells.size = 10  
            end
          end

       
          pdf.move_down 10
pdf.stroke_horizontal_line(0, pdf.bounds.width, at: pdf.cursor - 2)

if @book.present?
  pdf.move_down 8
  pdf.text "Cálculos", size: 12, style: :bold
  pdf.move_down 3

  # Calcule unique_assemblies antes de usá-lo
  unique_assemblies = @book.assemblies_parts.map { |part| Assembly.find(part.assembly_id) }.uniq
  books_data = [['Montagem', 'Total de Peças', 'Custo Montagem']]
  unique_assemblies.each do |assembly|
    assembly_parts = @book.assemblies_parts.select { |part| part.assembly_id == assembly.id }
    total_valor_assembly = assembly_parts.sum { |part| Part.find(part.part_id).valor }

    books_data << [
      assembly.name,
      assembly_parts.count,
      number_to_currency(total_valor_assembly, unit: "R$", format: "%u %n"),
                  ]
  end

  pdf.table(books_data, header: true, width: pdf.bounds.width) do
    row(0).font_style = :bold
    self.row_colors = ['DDDDDD', 'FFFFFF']
    cells.size = 10
   end
end
       else
         
          pdf.text "Nenhum livro encontrado para este autor.", size: 10
        end
      else
        pdf.text "Autor não encontrado.", size: 10
      end

      send_data pdf.render, filename: 'relatorio_livro.pdf', type: 'application/pdf', disposition: 'inline'
    end
  end
end


  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Livro criado com sucesso." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Livro atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy!

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Livro excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author_id, :publishing, :isbn)
  end
end
