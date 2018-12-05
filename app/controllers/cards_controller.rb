class CardsController < ApplicationController

  def index

	end
	
  def show
  	@cards = Card.find(params[:id])
  end
  def new
  	@cards = Card.new
  end


  def edit 
  	@cards = Card.find(params[:id])

  end


  def update
  	@cards = Card.find(params[:id])
  	@cards.update(long_description: params["cards"][:long_description], short_description: params["cards"][:short_description])



  end

	def create 
		@card = Card.new(card_parameters)
		@card.professional_id = current_professional.id
		@card.discipline_id  = params["card"]["id"]
		@card.opening_hour = params["appt"]
		@card.closing_hour = params["appt2"] 
		@card.latitude = params["lat"]
		@card.longitude = params["lng"]
		puts "ok"

		puts params[:card][:id]
		@card.save
	end
	
	private 
  
	def card_parameters
		params.require(:card).permit(:activity_title, :short_description, :long_description, :organization, :address, :city, :country, :price, :length, :whatsapp, :website, :facebook, :instagram, :appt, :appt2, :lat, :lng)
	end


end
