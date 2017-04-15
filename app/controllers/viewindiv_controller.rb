class ViewindivController < ApplicationController
  def new
  end


  def search
  	@search_result = Student.where(id: params[:searchinput][:id])
  	#puts "Printing"
  	#puts params[:email]
  	render 'new'
  	#@search_result = nil
  end
end
