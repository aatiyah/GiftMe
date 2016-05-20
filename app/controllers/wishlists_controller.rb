class WishlistsController < ApplicationController
    before_action :set_wishlist, only: [:show, :edit, :update, :destroy]

    # show user's wishlist
    def user_index
        @user = User.find(params[:id])
        @wishlist = @user.wishlists
    end

    # add product to current user's wishlist
    def add
        product = Product.find(params[:id])
        Wishlist.create(title:product.title, price:product.price, user_id:current_user.id)
        flash[:notice] = "#{product.title} is added to your wishlist"
        redirect_to :back
    end

    # GET /wishlists/1
    def show
    end

    # GET /wishlists/new
    def new
        @wishlist = Wishlist.new
    end

    # GET /wishlists/1/edit
    def edit
    end

    # POST /wishlists
    # POST /wishlists.json
    def create
        @wishlist = Wishlist.new(wishlist_params)

        respond_to do |format|
            if @wishlist.save
                format.html { redirect_to @wishlist, notice: 'Wishlist was successfully created.' }
                format.json { render :show, status: :created, location: @wishlist }
            else
                format.html { render :new }
                format.json { render json: @wishlist.errors, status: :unprocessable_entity }
            end
        end
    end



    # PATCH/PUT /wishlists/1
    # PATCH/PUT /wishlists/1.json
    def update
        respond_to do |format|
            if @wishlist.update(wishlist_params)
                format.html { redirect_to @wishlist, notice: 'Wishlist was successfully updated.' }
                format.json { render :show, status: :ok, location: @wishlist }
            else
                format.html { render :edit }
                format.json { render json: @wishlist.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /wishlists/1
    # DELETE /wishlists/1.json
    def destroy
        @wishlist.destroy
        respond_to do |format|
            format.html { redirect_to :back, notice: 'Wishlist was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    helper_method :called_dibs
    def called_dibs
        Wishlist.where(:id => params[:dibcheck]).update_all(dibs_user: current_user.id)
        redirect_to :back
    end

    helper_method :remove
    def remove
        Wishlist.where(:id => params[:id]).update_all(dibs_user: nil)
        redirect_to :back
    end



    private
        # Use callbacks to share common setup or constraints between actions.
        def set_wishlist
            @wishlist = Wishlist.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def wishlist_params
            params.require(:wishlist).permit(:title, :price, :info, :dibcheck, :user_id)
        end
end
