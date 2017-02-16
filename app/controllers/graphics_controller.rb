class GraphicsController < ApplicationController

  MONTHS = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]  

  def test
    @months = MONTHS
    @result = []

    #por cada anio hago el arreglo de los nacimientos de cada mes.
    BornAmount.distinct.pluck(:anio).sort.each do |year|
      data = []
      #por cada mes
      MONTHS.each do |month|
        partial_result = BornAmount.where(anio: year, mes: month).first
        partial_result ? data << partial_result.nacimientos : data << nil
      end
      @result << { "name": year.to_s, "data": data }
    end
    @result 
  end

  def cultural_events
    @events = EventRepo.all
  end

  def display_event
    place = PlaceRepo.get_by_event_id params[:event_id]
    if place
      @lat = place.latitude
      @long = place.longitude
    end
  end
end
