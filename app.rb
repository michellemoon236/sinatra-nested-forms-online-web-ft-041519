require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      
      erb :"pirates/new"
    end
    
    post '/pirates' do
      
      @pirate = Pirate.new(params[:pirate])
      
      params[:pirate][:ships].each do |ship_details|
        Ship.new(ship_details)
      end
      
      @ships = Ship.all 
      
      erb :"pirates/show"
    end

    
  end
end
