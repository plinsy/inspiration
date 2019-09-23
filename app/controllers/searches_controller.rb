class SearchesController < ApplicationController
  def new
  end

  def create
  	@search = params[:search][:name].to_s
    @type = params[:search][:type].to_s
  	@searches = []
    if @type == "users"
    	User.all.each do |user|
    		@searches << user if @search != "" && (user.username.include?(@search) || user.firstname.include?(@search) || user.lastname.include?(@search))
      end

    elsif @type == "conversations"
      Conversation.all.each do |conversation|
        @searches << conversation if @search != "" && (conversation.name.include?(@search))
      end
      
    end

  	respond_to do |format|
  		format.html
  		format.js
  	end
  end
end
