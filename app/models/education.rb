class Education 
  include HTTParty
  	base_uri 'http://api.datos.gba.gob.ar/api/v2/datastreams/NACIM/data.pjson/'
	default_params :auth_key => '504dbe7165fbc9dcb935246d82eb476b9400b89c'
	format :json

	def self.find_by_month(month)
		get '/', :query => {:mes => month}
	end
end