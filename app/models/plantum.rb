class Plantum < ActiveRecord::Base
  attr_accessible :agrupacion_id, :cif, :cups, :nombre, :potencia, :produccion, :razonsocial
  belongs_to :huerto,  :foreign_key => 'agrupacion_id' , :autosave => false
  
  def self.to_csv(options = {})
    CSV.generate( options ) do |csv|
      csv << [:agrupacion_id,
                :nombre,
                :razonsocial,
                :cif,
                :cups,
                :potencia,
                :produccion]
      all.each do |plantum|
        csv << [plantum[:agrupacion_id],
                plantum[:nombre],
                plantum[:razonsocial],
                plantum[:cif],
                plantum[:cups].to_s,
                plantum[:potencia].to_s,
                plantum[:produccion]]
      end
    end
  end
  
end
