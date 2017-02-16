class EventRepo
  include HTTParty
  base_uri 'http://agendacultural.buenosaires.gob.ar/webservice/response/client.php'
  
  def self.all_raw
    self.get('?Method=GetEventosListFiltered&Latitud=&Longitud=')
  end

  def self.all
    response = self.get('?Method=GetEventosListFiltered&Latitud=&Longitud=')
    # data = response.parsed_response
    EventMapper.map_many( response.parsed_response["Items"]["Item"] )
  end

  def self.all_from_location(lat, long)
    # check/senitize parameters if necesary
    response = self.get('?Method=GetEventosListFiltered&Latitud=#{lat}&Longitud=#{long}')
    # data = response.parsed_response
    EventMapper.map_many( response.parsed_response["Items"]["Item"] )
  end
end


