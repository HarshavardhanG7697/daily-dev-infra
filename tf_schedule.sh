HOUR=$(date +%H)

if [ $HOUR -gt 01 ] && [ $HOUR -lt 13 ]; then
    echo "Current hour: $HOUR is within business hours. Applying TF infra"
    terraform plan -out=tfplan
    terraform apply -auto-approve tfplan
else
    echo "Current hour: $HOUR is outside business hours. Destroying TF infra"
    terraform destroy -auto-approve
fi