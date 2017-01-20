server 'dkdeploy.vm', # Destination host ip or server name
       user: 'deployment_user', # Deployment user. This user should have sufficient rights on the host deployment path
       domain: 'dkdeploy.vm', #Related domain
       roles: %w(web app backend db) # Role filtering. Restrict deployment to servers matching certain roles

set :deploy_to, '/var/www/myproject/htdocs' # Deployment path