# Check if Swarm is present / started
docker info | grep -i swarm

# Init the swarm
docker swarm init

# View swarm nodes
docker mnode ls

# Create a new service
docker service create --name redis redis:3.0.6

# View running services
docker service ls

# Add more replicas to the service
docker service update vim9tvcsg6hs --replicas 3

# Remove service
docker service rm redis

# Join a Swarm
ocker swarm join --token SWMTKN-1-5gykn46824e6vtvni4c793hg772pl83jk9yynsbmg9nlrwzhkn-2jilmteflk1wk2j2z7urdd55m 172.18.0.55:2377
# Add manager nodes to Swarm
docker swarm join-token manager
docker node update --role manager node2

# View join token
docker swarm join-token manager
docker swarm join-token worker