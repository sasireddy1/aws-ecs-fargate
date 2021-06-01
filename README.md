# aws-ecs-fargate

STEP-1(creating cluster): aws ecs create-cluster --cluster-name fargate-cluster
STEP-2(taskdefinition): aws ecs register-task-definition --cli-input-json file://taskdef.json
STEP-3:(NOT REQUIRED ) aws ecs list-task-definitions

OUTPUT OF STEP-3

{ "taskDefinitionArns": [ "arn:aws:ecs:region:aws_account_id:task-definition/sample-fargate:1" ] }

here every time we are changing code we need to change the x value:: sample-fargate:{{X}}

STEP-4(creating ecs service ): aws ecs create-service --cluster fargate-cluster --service-name fargate-service --task-definition sample-app --desired-count 1 --launch-type "FARGATE" --network-configuration "awsvpcConfiguration={subnets=[subnet-],securityGroups=[sg-**],assignPublicIp=ENABLED}"

ALL THE ABOVE STEPS WE HAVE TO ENTER MANUALLY THROUGH AWS CLI

If we done any change in our docker file we need to update the taskdefintion as well as service jenkins file we have to place these two steps to process CI/CD

. aws ecs register-task-definition --cli-input-json file://taskdef.json
. aws ecs update-service --cluster mycluster --service nginx-service --force-new-deployment --region us-east-2
