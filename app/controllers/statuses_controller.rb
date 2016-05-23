class StatusesController < ApplicationController

  # GET /statuses/new
  def new
    @user = User.find(params[:id])
    @status = Status.new
  end

  # POST /statuses
  # POST /statuses.json
  def create
    @status = Status.new(status_params)

    respond_to do |format|
      if @status.save
        format.html { redirect_to :back, notice: 'Status was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def status_params
      params.require(:status).permit(:status)
    end
end
