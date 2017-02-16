class PlaceMapper
  def self.map(attributes)
    if attributes.present?
      Place.new.tap do |place|
        place.name = attributes['Nombre'] 
        place.latitude = attributes['Latitud'] 
        place.longitude = attributes['Longitud'] 
      end 
    end
  end
end
