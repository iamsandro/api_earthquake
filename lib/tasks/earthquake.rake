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
        magnitude = feature["properties"]["mag"].to_f 
        # Latitud
        latitude = feature["geometry"]["coordinates"][0].to_f  
        # Longitud
        longitude = feature["geometry"]["coordinates"][1].to_f 
        
        # De acuerdo a la condiciones del reto solo obtengo aquellos features que cumplan con las condiciones.
        if (magnitude >= -1.0 && magnitude <= 10.0) && (latitude >= -90.0 && latitude <= 90) && (longitude >= -180.0 && longitude<= 180.0)

          data = {
            :type=>feature["type"],
            :external_id=>feature["id"],
            :magnitude=>magnitude,
            :place=>feature["properties"]["place"],
            :time=>feature["properties"]["time"],
            :tsunami=>feature["properties"]["tsunami"] === 1,
            :mag_type=>feature["properties"]["magType"],
            :title=>feature["properties"]["title"],
            :longitude=>longitude,
            :latitude=>latitude,
            :external_url=>feature["properties"]["url"]
           }
          @features << data
        end
      end

      begin
        Feature.upsert_all(@features, unique_by: :external_id)
      rescue ActiveRecord::RecordInvalid => e
        puts "Error al guardar registros: #{e.message}"
      end

    else
      puts "Error al obtener los datos: #{response.metadata?.status}"
    end

    
  end

end
