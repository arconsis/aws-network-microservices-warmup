echo -n "Please enter a lauch type of ECS (ec2 OR fargate OR eks OR lambda): "
read lauch_type

if [ $lauch_type != "ec2" ] && [ $lauch_type != "fargate" ] && [ $lauch_type != "eks" ] && [ $lauch_type != "lambda" ]; then
  echo "Select a valid lauch type of ECS"
  exit 0
fi

# Deploy books API docker image
cd ./backend/services/booksService &&
./deploy.sh &&

# Deploy users API docker image
cd ../backend/usersService &&
./deploy.sh &&

# Deploy recommendations API docker image
cd ../backend/recommendationsService &&
./deploy.sh &&

# Deploy promotions API docker image
cd ../backend/promotionsService &&
./deploy.sh &&

# Deploy to cloud host (default AWS)
if [ $lauch_type = "fargate" ]; then
  cd ../../devops/aws/ecs_fargate &&
  terraform init
  terraform apply
elif [ $lauch_type = "ec2" ]; then
  cd ../../devops/aws/ecs_ec2 &&
  terraform init
  terraform apply
elif [ $lauch_type = "eks" ]; then
  cd ../../devops/aws/eks &&
  terraform init
  terraform apply
else
  cd ../../devops/aws/serverless &&
  terraform init
  terraform apply
fi
