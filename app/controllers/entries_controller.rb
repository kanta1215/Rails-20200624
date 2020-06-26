class EntriesController < ApplicationController
  before_action :set_entry, only: [:destroy]
  before_action :set_entry_params, only: [:confirm, :confirm_back, :create]

  def index
    @enry = Entry.all
  end

  def new
    @entry = Entry.new(room_id: params[:room_id],
                       user_name: current_user.name, user_email: current_user.email)
  end

  def create
   # @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry.room, notice: '予約完了'}
      else
        format.html {render :new}
      end
    end
  end

  def destroy
    @entry.destroy
    respond_to do |format|
      format.js { head :no_content }
    end
  end

  def confirm
   # @entry = Entry.new(entry_params)
    if @entry.invalid?
      render :new
    end
  end

  def confirm_back
    #@entry = Entry.new(entry_params)
    render :new
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])
    end
    
    def entry_params
      params.require(:entry).permit(:user_name, :user_email, :reserved_date,:usage_time,
                                    :room_id, :people, :user_id)
    end

    def set_entry_params
      @entry = Entry.new(entry_params)
    end
end
