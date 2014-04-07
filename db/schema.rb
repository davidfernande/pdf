# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131128090535) do

  create_table "contratos", :force => true do |t|
    t.string   "suministro_cups"
    t.string   "suministro_tarifa"
    t.string   "suministro_tipousuario"
    t.string   "cliente_nombre"
    t.string   "cliente_apellido1"
    t.string   "cliente_apellido2"
    t.string   "cliente_nifniecif"
    t.string   "cliente_domicilio"
    t.string   "cliente_provincia"
    t.string   "cliente_municipio"
    t.string   "cliente_codigopostal"
    t.string   "cliente_email"
    t.string   "cliente_telefono"
    t.string   "cliente_fax"
    t.boolean  "titular_elmismo"
    t.string   "titular_nombre"
    t.string   "titular_apellido1"
    t.string   "titular_apellido2"
    t.string   "titular_nifniecif"
    t.string   "titular_domicilio"
    t.string   "titular_provincia"
    t.string   "titular_municipio"
    t.string   "titular_codigopostal"
    t.string   "titular_email"
    t.string   "titular_telefono"
    t.string   "titular_fax"
    t.boolean  "datossuministro_elmismo"
    t.string   "datossuministro_direccion"
    t.string   "datossuministro_provincia"
    t.string   "datossuministro_municipio"
    t.string   "datossuministro_codigopostal"
    t.string   "datossuministro_email"
    t.string   "datossuministro_telefono"
    t.string   "datossuministro_fax"
    t.string   "datossuministro_potencia"
    t.string   "datossuministro_consumoestimado"
    t.boolean  "comunicaciones_elmismo"
    t.string   "comunicaciones_direccion"
    t.string   "comunicaciones_provincia"
    t.string   "comunicaciones_municipio"
    t.string   "comunicaciones_codigopostal"
    t.string   "comunicaciones_email"
    t.string   "comunicaciones_telefono"
    t.string   "comunicaciones_fax"
    t.string   "comunicaciones_idioma"
    t.string   "banco_nombre"
    t.string   "banco_apellido1"
    t.string   "banco_apellido2"
    t.string   "banco_cuenta"
    t.boolean  "aceptaciones_aceptoterminoscontratacion"
    t.boolean  "aceptaciones_aceptoterminosgenerales"
    t.boolean  "aceptaciones_aceptoefactura"
    t.boolean  "aceptaciones_aceptocontratoelectronico"
    t.string   "documentos_facturas"
    t.string   "documentos_cie"
    t.string   "documentos_habitabilidad"
    t.string   "documentos_dni"
    t.string   "documentos_poder"
    t.boolean  "otros_contadoralquiler"
    t.boolean  "otros_titular"
    t.boolean  "otros_apoderado"
    t.boolean  "otros_justotitulo"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "apoderado_nombre"
    t.string   "apoderado_apellido1"
    t.string   "apoderado_apellido2"
    t.string   "apoderado_nifniecif"
    t.string   "apoderado_domicilio"
    t.string   "apoderado_provincia"
    t.string   "apoderado_municipio"
    t.string   "apoderado_codigopostal"
    t.string   "apoderado_email"
    t.string   "apoderado_telefono"
    t.string   "apoderado_fax"
    t.string   "justotitulo_nombre"
    t.string   "justotitulo_apellido1"
    t.string   "justotitulo_apellido2"
    t.string   "justotitulo_nifniecif"
    t.string   "justotitulo_domicilio"
    t.string   "justotitulo_provincia"
    t.string   "justotitulo_municipio"
    t.string   "justotitulo_codigopostal"
    t.string   "justotitulo_email"
    t.string   "justotitulo_telefono"
    t.string   "justotitulo_fax"
    t.string   "cliente_telefono_movil"
    t.boolean  "cliente_apoderado"
    t.boolean  "esprimera_ocupacion"
    t.boolean  "suministro_cambio"
    t.integer  "owner_id"
  end

  create_table "huertos", :force => true do |t|
    t.string   "municipio"
    t.string   "provincia"
    t.string   "comunidad"
    t.string   "x"
    t.string   "y"
    t.text     "descripcion"
    t.string   "foto01"
    t.string   "foto02"
    t.string   "foto03"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "agrupacion"
  end

  create_table "planta", :force => true do |t|
    t.string   "nombre"
    t.string   "razonsocial"
    t.string   "cif"
    t.string   "cups"
    t.float    "potencia"
    t.float    "produccion"
    t.integer  "agrupacion_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "precontratos", :force => true do |t|
    t.string   "suministro_cups"
    t.string   "suministro_tarifa"
    t.string   "suministro_tipousuario"
    t.string   "cliente_nombre"
    t.string   "cliente_apellido1"
    t.string   "cliente_apellido2"
    t.string   "cliente_nifniecif"
    t.string   "cliente_domicilio"
    t.string   "cliente_provincia"
    t.string   "cliente_municipio"
    t.string   "cliente_codigopostal"
    t.string   "cliente_email"
    t.string   "cliente_telefono"
    t.string   "cliente_fax"
    t.boolean  "titular_elmismo"
    t.string   "titular_nombre"
    t.string   "titular_apellido1"
    t.string   "titular_apellido2"
    t.string   "titular_nifniecif"
    t.string   "titular_domicilio"
    t.string   "titular_provincia"
    t.string   "titular_municipio"
    t.string   "titular_codigopostal"
    t.string   "titular_email"
    t.string   "titular_telefono"
    t.string   "titular_fax"
    t.boolean  "datossuministro_elmismo"
    t.string   "datossuministro_direccion"
    t.string   "datossuministro_provincia"
    t.string   "datossuministro_municipio"
    t.string   "datossuministro_codigopostal"
    t.string   "datossuministro_email"
    t.string   "datossuministro_telefono"
    t.string   "datossuministro_fax"
    t.string   "datossuministro_potencia"
    t.string   "datossuministro_consumoestimado"
    t.boolean  "comunicaciones_elmismo"
    t.string   "comunicaciones_direccion"
    t.string   "comunicaciones_provincia"
    t.string   "comunicaciones_municipio"
    t.string   "comunicaciones_codigopostal"
    t.string   "comunicaciones_email"
    t.string   "comunicaciones_telefono"
    t.string   "comunicaciones_fax"
    t.string   "comunicaciones_idioma"
    t.string   "banco_nombre"
    t.string   "banco_apellido1"
    t.string   "banco_apellido2"
    t.string   "banco_cuenta"
    t.boolean  "aceptaciones_aceptoterminoscontratacion"
    t.boolean  "aceptaciones_aceptoterminosgenerales"
    t.boolean  "aceptaciones_aceptoefactura"
    t.boolean  "aceptaciones_aceptocontratoelectronico"
    t.string   "documentos_facturas"
    t.string   "documentos_cie"
    t.string   "documentos_habitabilidad"
    t.string   "documentos_dni"
    t.string   "documentos_poder"
    t.boolean  "otros_contadoralquiler"
    t.boolean  "otros_titular"
    t.boolean  "otros_apoderado"
    t.boolean  "otros_justotitulo"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "apoderado_nombre"
    t.string   "apoderado_apellido1"
    t.string   "apoderado_apellido2"
    t.string   "apoderado_nifniecif"
    t.string   "apoderado_domicilio"
    t.string   "apoderado_provincia"
    t.string   "apoderado_municipio"
    t.string   "apoderado_codigopostal"
    t.string   "apoderado_email"
    t.string   "apoderado_telefono"
    t.string   "apoderado_fax"
    t.string   "justotitulo_nombre"
    t.string   "justotitulo_apellido1"
    t.string   "justotitulo_apellido2"
    t.string   "justotitulo_nifniecif"
    t.string   "justotitulo_domicilio"
    t.string   "justotitulo_provincia"
    t.string   "justotitulo_municipio"
    t.string   "justotitulo_codigopostal"
    t.string   "justotitulo_email"
    t.string   "justotitulo_telefono"
    t.string   "justotitulo_fax"
    t.string   "cliente_telefono_movil"
    t.boolean  "cliente_apoderado"
    t.boolean  "esprimera_ocupacion"
    t.boolean  "suministro_cambio"
    t.integer  "owner_id"
    t.boolean  "finalizado"
    t.boolean  "enviado"
    t.string   "huerto_cups"
    t.string   "banco_nif"
    t.string   "CosteMensualAlquilerContador"
    t.text     "huertoid"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
