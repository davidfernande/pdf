task :update_staging  do
    puts'Compilando assets'
    #sh 'bundle exec rake assets:clean'
    #sh 'bundle exec rake assets:precompile'
    puts''
    puts "modo mantenimiento ON en staging-yelouusuarios en Heroku!"
    sh  'heroku maintenance:on --app staging-yelouusuarios'
    puts''
    puts "Actualizando staging-yelouusuarios en Heroku!"
    puts''
    sh "ls"
    puts ""
    sh 'git add -A '
    puts ""
    sh 'git commit -m "master"' 
    puts ""
    sh 'git push -u origin master'
    puts ""
    sh 'git push staging-yelouusuarios master'
    puts ""
    sh "heroku run rake db:migrate --app staging-yelouusuarios"
    puts " +++++ Reiniciando +++++ "
    puts ""
    sh "heroku restart --app staging-yelouusuarios"
    puts''
    puts "modo mantenimiento OFF en  staging-yelouusuarios en Heroku!"
    sh 'heroku maintenance:off --app staging-yelouusuarios'
  end
  
task :update_production  do
    #puts'Compilando assets'
    #sh 'bundle exec rake assets:clean'    
    #sh 'bundle exec rake assets:precompile'
    puts''
    puts "modo mantenimiento ON en production-yelouusuarios en Heroku!"
    sh  'heroku maintenance:on --app production-yelouusuarios'
    puts''
    puts "Actualizando production-yelouusuarios en Heroku!"
    puts''
    sh "ls"
    puts ""
    sh 'git add -A '
    puts ""
    sh 'git commit -m "master"' 
    puts ""
    sh 'git push -u origin master'
    puts ""
    sh 'git push production-yelouusuarios master'
    puts ""
    sh "heroku run rake db:migrate --app production-yelouusuarios"
    puts " +++++ Reiniciando +++++ "
    puts ""
    sh "heroku restart --app production-yelouusuarios"
    puts''
    puts "modo mantenimiento OFF en  production-yelouusuarios en Heroku!"
    sh 'heroku maintenance:off --app production-yelouusuarios'
  end