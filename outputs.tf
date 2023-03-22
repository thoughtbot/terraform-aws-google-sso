output "stack_id" {
  description = "ID of the created CloudFormation stack"
  value       = aws_serverlessapplicationrepository_cloudformation_stack.this.id
}

output "stack_outputs" {
  description = "Outputs from the CloudFormation stack"
  value       = aws_serverlessapplicationrepository_cloudformation_stack.this.outputs
}
