# networks creation
docker network create --driver overlay backend
docker network create --driver overlay frontend

# Vote service creation
docker service create --name vote -p 80:80 --replicas 2 --network frontend bretfisher/examplevotingapp_vote

# Redis database service creation
docker service create --name redis --replicas 1 --network frontend redis:3.2

# Worker service creation
docker service create --name worker --replicas 1 --network frontend --network backend bretfisher/examplevotingapp_worker:java

# Postgres database service creation
docker service create --name db --network backend --replicas 1 -e POSTGRES_HOST_AUTH_METHOD=trust --mount type=volume,source=db-data,target=/var/lib/postgresql/data postgres:9.4

# result app service creation
docker service create --name result -p 5001:80 --network backend --replicas 1 bretfisher/examplevotingapp_result