class EventMapper
  REFERENCE = {
    'IdEvento' => :id,
    'Titulo' => :title,
    'Resumen' => :summary, 
    'Descripcion' => :description, 
    'Imagen' => :image, 
    'FechaInicio' => :start_date, 
    'FechaFin' => :finish_date
  }

  DEFAULT_VALUES = {
    title: 'sin titulo', 
    id: 'sin id'
  }

  def self.map(attributes)
    Event.new.tap do |event| 
      REFERENCE.each do |attr_name, attr_method| 
        event.send("#{attr_method}=", attributes[attr_name] ) #|| default_value(attr_method) )
      end
    end
  end

  def self.map_many(array) 
    array.map {|event| map(event) }
  end
end
