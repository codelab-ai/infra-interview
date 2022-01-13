# outputs.tf

output "listener" {
  value = aws_alb_listener.dgraph_listener.arn
}