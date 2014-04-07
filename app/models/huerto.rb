class Huerto < ActiveRecord::Base
  attr_accessible :comunidad, :descripcion, 
                  :foto01, :foto02, :foto03, :municipio, 
                  :provincia, :x, :y, :agrupacion

  has_many :planta, :foreign_key => 'agrupacion_id' , :autosave => false
  
  def self.to_csv(options = {})
    CSV.generate( options ) do |csv|
      csv << [:agrupacion,
                :municipio,
                :provincia,
                :comunidad,
                :x,
                :y,
                :foto01,
                :foto02,
                :foto03]
      all.each do |huerto|
        csv << [huerto[:agrupacion],
                huerto[:municipio],
                huerto[:provincia],
                huerto[:comunidad],
                huerto[:x].to_s,
                huerto[:y].to_s,
                huerto[:foto01],
                huerto[:foto02],
                huerto[:foto03]]
      end
    end
  end


end
