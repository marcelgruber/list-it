class ListingsController < ApplicationController
  # A frequent practice is to place the standard CRUD actions in each
  # controller in the following order: index, show, new, edit, create, update
  # and destroy. You may use any order you choose, but keep in mind that these
  # are public methods; as mentioned earlier in this guide, they must be placed
  # before any private or protected method in the controller in order to work.
  http_basic_authenticate_with name: "user", password: "pass", except: [:index, :show]

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def create
    # render plain: params[:listing].inspect #can use this to inspect the submitted form input values
    # render plain: @listing.inspect

    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to @listing
    else
      #The render method is used so that the @listing object is passed back to the new template when it is rendered. This rendering is done within the same request as the form submission, whereas the redirect_to will tell the browser to issue another request.
      render 'new'
    end
  end

  def update
    @listing = Listing.find(params[:id])

    if @listing.update(listing_params)
      redirect_to @listing
    else
      render 'edit'
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    redirect_to listings_path
  end

  private
    def listing_params
      params.require(:listing).permit(:title, :description)
    end
end
