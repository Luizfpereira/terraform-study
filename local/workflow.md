# 1. Start LocalStack
cd /home/gugu/go/src/terraform-study
docker compose up -d

# 2. Wait until healthy
curl http://localhost:4566/_localstack/health

# 3. Apply Terraform
cd local
terraform init
terraform apply

# 4. Verify
terraform state list

aws --endpoint-url http://localhost:4566 --region us-west-2 ec2 describe-vpcs
aws --endpoint-url http://localhost:4566 --region us-west-2 ec2 describe-subnets --filters "Name=default-for-az,Values=false"
aws --endpoint-url http://localhost:4566 --region us-west-2 ec2 describe-instances

# Tear down
cd /home/gugu/go/src/terraform-study/local
terraform destroy
cd ..
docker compose down