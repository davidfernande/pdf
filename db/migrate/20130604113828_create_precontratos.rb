class CreatePrecontratos < ActiveRecord::Migration
  def change
    create_table :precontratos do |t|
      t.string :suministro_cups
      t.string :suministro_tarifa
      t.string :suministro_tipousuario
      t.string :cliente_nombre
      t.string :cliente_apellido1
      t.string :cliente_apellido2
      t.string :cliente_nifniecif
      t.string :cliente_domicilio
      t.string :cliente_provincia
      t.string :cliente_municipio
      t.string :cliente_codigopostal
      t.string :cliente_email
      t.string :cliente_telefono
      t.string :cliente_fax
      t.boolean :titular_elmismo
      t.string :titular_nombre
      t.string :titular_apellido1
      t.string :titular_apellido2
      t.string :titular_nifniecif
      t.string :titular_domicilio
      t.string :titular_provincia
      t.string :titular_municipio
      t.string :titular_codigopostal
      t.string :titular_email
      t.string :titular_telefono
      t.string :titular_fax
      t.boolean :datossuministro_elmismo
      t.string :datossuministro_direccion
      t.string :datossuministro_provincia
      t.string :datossuministro_municipio
      t.string :datossuministro_codigopostal
      t.string :datossuministro_email
      t.string :datossuministro_telefono
      t.string :datossuministro_fax
      t.string :datossuministro_potencia
      t.string :datossuministro_consumoestimado
      t.boolean :comunicaciones_elmismo
      t.string :comunicaciones_direccion
      t.string :comunicaciones_provincia
      t.string :comunicaciones_municipio
      t.string :comunicaciones_codigopostal
      t.string :comunicaciones_email
      t.string :comunicaciones_telefono
      t.string :comunicaciones_fax
      t.string :comunicaciones_idioma
      t.string :banco_nombre
      t.string :banco_apellido1
      t.string :banco_apellido2
      t.string :banco_cuenta
      t.boolean :aceptaciones_aceptoterminoscontratacion
      t.boolean :aceptaciones_aceptoterminosgenerales
      t.boolean :aceptaciones_aceptoefactura
      t.boolean :aceptaciones_aceptocontratoelectronico
      t.string :documentos_facturas
      t.string :documentos_cie
      t.string :documentos_habitabilidad
      t.string :documentos_dni
      t.string :documentos_poder
      t.boolean :otros_contadoralquiler
      t.boolean :otros_titular
      t.boolean :otros_apoderado
      t.boolean :otros_justotitulo

      t.timestamps
    end
  end
end
