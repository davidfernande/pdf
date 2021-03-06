# RailsAdmin config file. Generated on November 07, 2013 01:59
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|


  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Rails3 Bootstrap Devise Cancan', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, 'User'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'User'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Contrato', 'Huerto', 'Precontrato', 'Role', 'User']

  # Include specific models (exclude the others):
  # config.included_models = ['Contrato', 'Huerto', 'Precontrato', 'Role', 'User']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:



  ###  Contrato  ###

  # config.model 'Contrato' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your contrato.rb model definition

  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer 
  #     configure :suministro_cups, :string 
  #     configure :suministro_tarifa, :string 
  #     configure :suministro_tipousuario, :string 
  #     configure :cliente_nombre, :string 
  #     configure :cliente_apellido1, :string 
  #     configure :cliente_apellido2, :string 
  #     configure :cliente_nifniecif, :string 
  #     configure :cliente_domicilio, :string 
  #     configure :cliente_provincia, :string 
  #     configure :cliente_municipio, :string 
  #     configure :cliente_codigopostal, :string 
  #     configure :cliente_email, :string 
  #     configure :cliente_telefono, :string 
  #     configure :cliente_fax, :string 
  #     configure :titular_elmismo, :boolean 
  #     configure :titular_nombre, :string 
  #     configure :titular_apellido1, :string 
  #     configure :titular_apellido2, :string 
  #     configure :titular_nifniecif, :string 
  #     configure :titular_domicilio, :string 
  #     configure :titular_provincia, :string 
  #     configure :titular_municipio, :string 
  #     configure :titular_codigopostal, :string 
  #     configure :titular_email, :string 
  #     configure :titular_telefono, :string 
  #     configure :titular_fax, :string 
  #     configure :datossuministro_elmismo, :boolean 
  #     configure :datossuministro_direccion, :string 
  #     configure :datossuministro_provincia, :string 
  #     configure :datossuministro_municipio, :string 
  #     configure :datossuministro_codigopostal, :string 
  #     configure :datossuministro_email, :string 
  #     configure :datossuministro_telefono, :string 
  #     configure :datossuministro_fax, :string 
  #     configure :datossuministro_potencia, :string 
  #     configure :datossuministro_consumoestimado, :string 
  #     configure :comunicaciones_elmismo, :boolean 
  #     configure :comunicaciones_direccion, :string 
  #     configure :comunicaciones_provincia, :string 
  #     configure :comunicaciones_municipio, :string 
  #     configure :comunicaciones_codigopostal, :string 
  #     configure :comunicaciones_email, :string 
  #     configure :comunicaciones_telefono, :string 
  #     configure :comunicaciones_fax, :string 
  #     configure :comunicaciones_idioma, :string 
  #     configure :banco_nombre, :string 
  #     configure :banco_apellido1, :string 
  #     configure :banco_apellido2, :string 
  #     configure :banco_cuenta, :string 
  #     configure :aceptaciones_aceptoterminoscontratacion, :boolean 
  #     configure :aceptaciones_aceptoterminosgenerales, :boolean 
  #     configure :aceptaciones_aceptoefactura, :boolean 
  #     configure :aceptaciones_aceptocontratoelectronico, :boolean 
  #     configure :documentos_facturas, :string 
  #     configure :documentos_cie, :string 
  #     configure :documentos_habitabilidad, :string 
  #     configure :documentos_dni, :string 
  #     configure :documentos_poder, :string 
  #     configure :otros_contadoralquiler, :boolean 
  #     configure :otros_titular, :boolean 
  #     configure :otros_apoderado, :boolean 
  #     configure :otros_justotitulo, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :apoderado_nombre, :string 
  #     configure :apoderado_apellido1, :string 
  #     configure :apoderado_apellido2, :string 
  #     configure :apoderado_nifniecif, :string 
  #     configure :apoderado_domicilio, :string 
  #     configure :apoderado_provincia, :string 
  #     configure :apoderado_municipio, :string 
  #     configure :apoderado_codigopostal, :string 
  #     configure :apoderado_email, :string 
  #     configure :apoderado_telefono, :string 
  #     configure :apoderado_fax, :string 
  #     configure :justotitulo_nombre, :string 
  #     configure :justotitulo_apellido1, :string 
  #     configure :justotitulo_apellido2, :string 
  #     configure :justotitulo_nifniecif, :string 
  #     configure :justotitulo_domicilio, :string 
  #     configure :justotitulo_provincia, :string 
  #     configure :justotitulo_municipio, :string 
  #     configure :justotitulo_codigopostal, :string 
  #     configure :justotitulo_email, :string 
  #     configure :justotitulo_telefono, :string 
  #     configure :justotitulo_fax, :string 
  #     configure :cliente_telefono_movil, :string 
  #     configure :cliente_apoderado, :boolean 
  #     configure :esprimera_ocupacion, :boolean 
  #     configure :suministro_cambio, :boolean 
  #     configure :owner_id, :integer 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Huerto  ###

  # config.model 'Huerto' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your huerto.rb model definition

  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :codigonx, :string 
  #     configure :direccion, :string 
  #     configure :municipio, :string 
  #     configure :provincia, :string 
  #     configure :comunidad, :string 
  #     configure :codigopostal, :string 
  #     configure :potenciacil, :decimal 
  #     configure :productor, :string 
  #     configure :x, :string 
  #     configure :y, :string 
  #     configure :icono, :string 
  #     configure :descripcion, :text 
  #     configure :aniomarcha, :integer 
  #     configure :foto01, :string 
  #     configure :foto02, :string 
  #     configure :foto03, :string 
  #     configure :limiteproduccion, :decimal 
  #     configure :limiteclientes, :decimal 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :cups, :string 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Precontrato  ###

  # config.model 'Precontrato' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your precontrato.rb model definition

  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer 
  #     configure :suministro_cups, :string 
  #     configure :suministro_tarifa, :string 
  #     configure :suministro_tipousuario, :string 
  #     configure :cliente_nombre, :string 
  #     configure :cliente_apellido1, :string 
  #     configure :cliente_apellido2, :string 
  #     configure :cliente_nifniecif, :string 
  #     configure :cliente_domicilio, :string 
  #     configure :cliente_provincia, :string 
  #     configure :cliente_municipio, :string 
  #     configure :cliente_codigopostal, :string 
  #     configure :cliente_email, :string 
  #     configure :cliente_telefono, :string 
  #     configure :cliente_fax, :string 
  #     configure :titular_elmismo, :boolean 
  #     configure :titular_nombre, :string 
  #     configure :titular_apellido1, :string 
  #     configure :titular_apellido2, :string 
  #     configure :titular_nifniecif, :string 
  #     configure :titular_domicilio, :string 
  #     configure :titular_provincia, :string 
  #     configure :titular_municipio, :string 
  #     configure :titular_codigopostal, :string 
  #     configure :titular_email, :string 
  #     configure :titular_telefono, :string 
  #     configure :titular_fax, :string 
  #     configure :datossuministro_elmismo, :boolean 
  #     configure :datossuministro_direccion, :string 
  #     configure :datossuministro_provincia, :string 
  #     configure :datossuministro_municipio, :string 
  #     configure :datossuministro_codigopostal, :string 
  #     configure :datossuministro_email, :string 
  #     configure :datossuministro_telefono, :string 
  #     configure :datossuministro_fax, :string 
  #     configure :datossuministro_potencia, :string 
  #     configure :datossuministro_consumoestimado, :string 
  #     configure :comunicaciones_elmismo, :boolean 
  #     configure :comunicaciones_direccion, :string 
  #     configure :comunicaciones_provincia, :string 
  #     configure :comunicaciones_municipio, :string 
  #     configure :comunicaciones_codigopostal, :string 
  #     configure :comunicaciones_email, :string 
  #     configure :comunicaciones_telefono, :string 
  #     configure :comunicaciones_fax, :string 
  #     configure :comunicaciones_idioma, :string 
  #     configure :banco_nombre, :string 
  #     configure :banco_apellido1, :string 
  #     configure :banco_apellido2, :string 
  #     configure :banco_cuenta, :string 
  #     configure :aceptaciones_aceptoterminoscontratacion, :boolean 
  #     configure :aceptaciones_aceptoterminosgenerales, :boolean 
  #     configure :aceptaciones_aceptoefactura, :boolean 
  #     configure :aceptaciones_aceptocontratoelectronico, :boolean 
  #     configure :documentos_facturas, :string 
  #     configure :documentos_cie, :string 
  #     configure :documentos_habitabilidad, :string 
  #     configure :documentos_dni, :string 
  #     configure :documentos_poder, :string 
  #     configure :otros_contadoralquiler, :boolean 
  #     configure :otros_titular, :boolean 
  #     configure :otros_apoderado, :boolean 
  #     configure :otros_justotitulo, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :apoderado_nombre, :string 
  #     configure :apoderado_apellido1, :string 
  #     configure :apoderado_apellido2, :string 
  #     configure :apoderado_nifniecif, :string 
  #     configure :apoderado_domicilio, :string 
  #     configure :apoderado_provincia, :string 
  #     configure :apoderado_municipio, :string 
  #     configure :apoderado_codigopostal, :string 
  #     configure :apoderado_email, :string 
  #     configure :apoderado_telefono, :string 
  #     configure :apoderado_fax, :string 
  #     configure :justotitulo_nombre, :string 
  #     configure :justotitulo_apellido1, :string 
  #     configure :justotitulo_apellido2, :string 
  #     configure :justotitulo_nifniecif, :string 
  #     configure :justotitulo_domicilio, :string 
  #     configure :justotitulo_provincia, :string 
  #     configure :justotitulo_municipio, :string 
  #     configure :justotitulo_codigopostal, :string 
  #     configure :justotitulo_email, :string 
  #     configure :justotitulo_telefono, :string 
  #     configure :justotitulo_fax, :string 
  #     configure :cliente_telefono_movil, :string 
  #     configure :cliente_apoderado, :boolean 
  #     configure :esprimera_ocupacion, :boolean 
  #     configure :suministro_cambio, :boolean 
  #     configure :owner_id, :integer 
  #     configure :finalizado, :boolean 
  #     configure :enviado, :boolean 
  #     configure :huerto_cups, :string 
  #     configure :banco_nif, :string 
  #     configure :CosteMensualAlquilerContador, :string 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Role  ###

  # config.model 'Role' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your role.rb model definition

  #   # Found associations:

  #     configure :resource, :polymorphic_association         # Hidden 
  #     configure :users, :has_and_belongs_to_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :resource_id, :integer         # Hidden 
  #     configure :resource_type, :string         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  User  ###

  # config.model 'User' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your user.rb model definition

  #   # Found associations:

  #     configure :roles, :has_and_belongs_to_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :name, :string 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end

end
