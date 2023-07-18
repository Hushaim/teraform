viriginia:
	terraform workspace new viriginia || terraform workspace select viriginia
	 terraform init
	 terraform apply -var-file viriginia.tfvars --auto-approve


ohio:
	 terraform workspace new ohio || terraform workspace select ohio
	 terraform init
	 terraform apply -var-file ohio.tfvars --auto-approve
	 
califonia:
	 terraform workspace new califonia || terraform workspace select califonia
	 terraform init
	 terraform apply -var-file califonia.tfvars --auto-approve
	 
oregon:
	 terraform workspace new oregon || terraform workspace select oregon
	 terraform init
	 terraform apply -var-file oregon.tfvars --auto-approve

apply-all: viriginia ohio califonia oregon

	 



viriginia-destroy:
	terraform workspace new viriginia || terraform workspace select viriginia
	 terraform init
	 terraform destroy -var-file viriginia.tfvars --auto-approve


ohio-destroy:
	 terraform workspace new ohio || terraform workspace select ohio
	 terraform init
	 terraform destroy -var-file ohio.tfvars --auto-approve
	 
califonia-destroy:
	 terraform workspace new califonia || terraform workspace select califonia
	 terraform init
	 terraform destroy -var-file califonia.tfvars --auto-approve
	 
oregon-destroy:
	 terraform workspace new oregon || terraform workspace select oregon
	 terraform init
	 terraform destroy -var-file oregon.tfvars --auto-approve
destroy-all: viriginia-destroy ohio-destroy califonia-destroy oregon-destroy 

	 
