namespace :earthquake do
  desc "Permite obtener data sismológica desde el sitio USGS (earthquake.usgs.gov)."

  task get_data_from_last_month: :environment do
    require 'httparty'

    response = HTTParty.get('https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson')

    # @features, en esta variable almacenaré los datos que necesito de la respuesta a la usgs
    @features = []

    if response["metadata"]["status"] === 200
      
      response["features"].each do |feature|

        # Magnitud
        mag = feature["properties"]["mag"] 
        # Latitud
        latitude = feature["geometry"]["coordinates"][0] 
        # Longitud
        longitude = feature["geometry"]["coordinates"][1]
        
        # De acuerdo a la condiciones del reto solo obtengo aquellos features que cumplan con las condiciones.
        if mag >= -1.0 && mag <= 1.0 && latitude >= -90.0 && latitude <= 90 && longitude >= -180.0 && longitude<= 180.0
          @features << feature
        end
      end

      puts @features.length

    else
      puts "Error al obtener los datos: #{response.metadata?.status}"
    end
  end

end
