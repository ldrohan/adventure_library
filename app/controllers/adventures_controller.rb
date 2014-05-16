class AdventuresController < ApplicationController
  def index
    @adventures = Adventure.all
    respond_to do |format|
      format.html
      format.json { render :json => {:adventures => @adventures.as_json(except: [:id, :library_id], include: {:pages => {except: [:id, :adventure_id, :created_at, :updated_at]} })} }
    end
  end
  def create
    @adventure = Adventure.new adventure_params
    #BELOW IS maybe WRONG!!!!!!!!!!
    @adventure.guid = SecureRandom.urlsafe_base64(10)
    if @adventure.save
      redirect_to adventures_path
    else
      flash[:errors] = @adventure.errors.full_messages
      render :edit
    end


    def new
      @adventure = Adventure.new
    end

    def show
      # id = params[:id]
      @adventure = Adventure.find(params[:id])
      @start = Adventure.find(@adventure).pages.find_by(name: "start").id
      redirect_to adventure_page_path(@adventure, @start)
    end

    def edit
      @adventure = Adventure.find(params[:id])
    end

    private
    def adventure_params
      params.require(:adventure).permit(:title, :author, :url)
    end
  end
end
