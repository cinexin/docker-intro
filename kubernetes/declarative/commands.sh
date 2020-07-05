# Create / update resources in a file
kubectl apply -f myfile.yml
# Create / update a whole directory of YAML
kubectl apply -f my-yml/
# Create / update from a URL
kubectl apply -f https://bret.run/podyml
# Dry run on server before effectively applying the changes
# (check the changes before applying them on server)
kubectl apply -f app.yml --server-dry-run
# Check differences visually
kubectl diff -f app.yml