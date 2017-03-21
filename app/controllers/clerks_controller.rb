class ClerksController < ApplicationController
  layout 'general'
  
  def index
    @clerks = Clerk.all
  end

  def details
    @clerk = Clerk.find(params[:id])
  end

  def newclerk
    @clerk = Clerk.new
    @randomID = rand 10 ** 5
  end

  def add_clerk
    @clerk = Clerk.new
    @clerk.clekr_id = params[:clerk][:clekr_id]
    @clerk.clerk_name = params[:clerk][:clerk_name]
    @clerk.clerk_age = params[:clerk][:clerk_age]
    @clerk.clerk_address = params[:clerk][:clerk_address]
    @clerk.phone_num = params[:clerk][:phone_num]
    @randomID = rand 10 ** 5

      if @clerk.save then 
        redirect_to "/clerks/#{@clerk.id}"
      else
        render "/clerks/newclerk"
      end
    
  end

  def edit
    @clerk = Clerk.find(params[:id])
  end

  def update
    @clerk = Clerk.find(params[:id])
    if @clerk.update_attributes(user_params)
      redirect_to "/clerks/#{@clerk.id}"
    else 
      render 'edit'
    end
  end

  def delete
    @clerk = Clerk.find(params[:id])
    @clerk.destroy

  redirect_to '/clerks'
  end

  private
    def user_params
      params.require(:clerk).permit(:clerk_name, :clerk_age, :clerk_address, :phone_num )
    end
end
