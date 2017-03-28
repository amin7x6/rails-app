class ContactController < ApplicationController
  def index

  end

  def create
    #  render plain: "Thank you #{params[:name]} for contacting us"
     redirect_to contact_path({name: params[:name]})

  end
end
