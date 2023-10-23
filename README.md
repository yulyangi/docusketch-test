## test api
# to run docker-compose
docker-compose up -d 

# to create an item run
curl -X POST -H "Content-Type: application/json" -d '{"title": "mytitle"}' http://localhost:8080/items

# to get an item run
curl -X GET http://localhost:8080/items/<item_id>

# to change an item run
curl -X PUT -H "Content-Type: application/json" -d '{"title": "FUCK"}' http://localhost:8080/items/<item_id>


## cpu and memory usage
  make sure this script is executable
  chmod +x /path/to/the/script
  to execute the script run "./path/to/the/script"