class PlaceRepo

  include HTTParty
  base_uri 'http://agendacultural.buenosaires.gob.ar/webservice/response/client.php'

  def self.get_by_event_id(event_id)
    response = self.get("?Method=GetLugaresByIdEvento&IdEvento=#{event_id}&OrdenarPor=Nombre&Orden=DESC&Limit=1&Offset=0")
    PlaceMapper.map( response.parsed_response["Items"]["Item"] )
  end
end
