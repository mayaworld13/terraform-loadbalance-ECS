# terraform-loadbalance-ECS
```plaintext
VPC (aws_vpc.loadbalance)
|
|-- Internet Gateway (aws_internet_gateway.gateway)
|
|-- Public Subnet 1 (aws_subnet.pub)
|   |
|   |-- Route Table Association (aws_route_table_association.a)
|
|-- Public Subnet 2 (aws_subnet.public)
|   |
|   |-- Route Table Association (aws_route_table_association.b)
|
|-- Route Table (aws_route_table.pub)
|
|-- Security Group (aws_security_group.allow_tls)
|
|-- Application Load Balancer (aws_lb.test)
|   |
|   |-- ALB Listener (aws_lb_listener.front_end)
|
|-- ECS Cluster (aws_ecs_cluster.foo)
|   |
|   |-- ECS Cluster Capacity Providers (aws_ecs_cluster_capacity_providers.example)
|
|-- ECS Task Definition (aws_ecs_task_definition.test)
|
|-- ECS Service (aws_ecs_service.ecs)
|   |
|   |-- Network Configuration (subnets: [aws_subnet.pub.id, aws_subnet.public.id], security_groups: [aws_security_group.allow_tls.id])
|   |-- Load Balancer Configuration (target_group_arn: aws_lb_target_group.target.arn)
|
|-- ALB Target Group (aws_lb_target_group.target)
```
