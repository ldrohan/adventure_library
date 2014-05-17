class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
    @library = Library.new
    respond_to do |format|
      format.html
      format.json { render :json => {:adventures => @adventures.as_json(except: [:id, :library_id], include: {:pages => {except: [:id, :adventure_id, :created_at, :updated_at]} })} }
    end
  end

  def new
    @adventure = Adventure.new
    @page = @adventure.pages.build
    # @library = @library.adventure.create
  end

  def edit
    @adventure = Adventure.find(params[:id])
  end

  def update
  end

  def show
    # id = params[:id]
    @adventure = Adventure.find(params[:id])
    @page = Page.new
    @start = Adventure.find(@adventure).pages.find_by(name: "start")
    redirect_to adventure_page_path(@adventure)
  end

  def create
    @adventure = Adventure.new adventure_params
    @adventure.guid = SecureRandom.urlsafe_base64(10)
    # request = Typhoeus.post("url/email.json", params: {email: params[:email], contact: @contact.email})
    if @adventure.save
    redirect_to new_adventure_page_path(@adventure)
    else
      flash[:errors] = @adventure.errors.full_messages
      render :edit
      redirect_to :back
    end
    # if @library.save
    #   redirect_to adventure_libraries_path
    # end
  end

private
  def adventure_params
    params.require(:adventure).permit(:title, :author, :pages_attributes=>[:name, :text], :libraries_attributes=>[:url])
  end

end
