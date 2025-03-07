echo -e "FROM alpine\nCMD echo 'Hello from Docker'" > Dockerfile
git add Dockerfile
git commit -m "Added Dockerfile"
git push origin main
