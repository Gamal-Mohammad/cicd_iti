FROM httpd
# Add new index
COPY index.html /usr/local/apache2/htdocs
# Add Env Vars
ENV VAR1=Jenkins_Project
